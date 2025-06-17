import com.github.javaparser.*;
import com.github.javaparser.ast.*;
import com.github.javaparser.ast.body.*;
import com.github.javaparser.ast.expr.*;
import com.github.javaparser.ast.stmt.*;
import com.github.javaparser.ast.visitor.*;
import java.io.*;
import java.util.*;

public class TestJavaVariableScoping {
    public static void main(String[] args) throws Exception {
        File inputFile = new File(args[0]);
        CompilationUnit cu = StaticJavaParser.parse(inputFile);
        cu.accept(new RenameVariableVisitor(), null);

        System.out.println(cu.toString());
    }

    static class RenameVariableVisitor extends ModifierVisitor<Void> {
        private Map<String, Set<String>> methodVarnames = new HashMap<>();
        private String currentMethod = null;

        @Override
        public Visitable visit(MethodDeclaration md, Void arg) {
            String oldMethod = currentMethod;
            currentMethod = md.getNameAsString();

            Set<String> vars = new HashSet<>();
            md.getParameters().forEach(p -> vars.add(p.getNameAsString()));

            md.findAll(VariableDeclarator.class, v -> isInMethod(v, md)).forEach(vd -> vars.add(vd.getNameAsString()));

            methodVarnames.put(currentMethod, vars);

            // Rename parameters
            md.getParameters().forEach(p -> p.setName(p.getNameAsString() + "_" + currentMethod));

            // Rename local variable declarations in this method
            md.findAll(VariableDeclarator.class, v -> isInMethod(v, md)).forEach(vd -> vd.setName(vd.getNameAsString() + "_" + currentMethod));

            // Rename all usages inside the method
            md.getBody().ifPresent(body -> {
                body.accept(new VariableReferenceRenamer(vars, currentMethod), null);
            });

            Visitable result = super.visit(md, arg);
            currentMethod = oldMethod;
            return result;
        }

        // Helper: checks if a VariableDeclarator is within md
        private boolean isInMethod(VariableDeclarator vd, MethodDeclaration md) {
            Node n = vd;
            while (n != null) {
                if (n == md) return true;
                n = n.getParentNode().orElse(null);
            }
            return false;
        }
    }

    static class VariableReferenceRenamer extends ModifierVisitor<Void> {
        private final Set<String> vars;
        private final String methodName;

        public VariableReferenceRenamer(Set<String> vars, String methodName) {
            this.vars = vars;
            this.methodName = methodName;
        }

        @Override
        public Visitable visit(NameExpr n, Void arg) {
            if (vars.contains(n.getNameAsString())) {
                n.setName(n.getNameAsString() + "_" + methodName);
            }
            return super.visit(n, arg);
        }

        @Override
        public Visitable visit(SimpleName n, Void arg) {
            // Only replace if parent is not a declaration (handled earlier)
            if (!(n.getParentNode().orElse(null) instanceof VariableDeclarator)
                    && !(n.getParentNode().orElse(null) instanceof com.github.javaparser.ast.body.Parameter)
                    && vars.contains(n.getIdentifier())) {
                n.setIdentifier(n.getIdentifier() + "_" + methodName);
            }
            return super.visit(n, arg);
        }
    }
}