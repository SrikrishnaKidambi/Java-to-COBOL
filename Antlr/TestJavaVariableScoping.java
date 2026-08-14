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

        // // Also rename the class if it is "Test" to "TestScoped"
        // cu.findAll(ClassOrInterfaceDeclaration.class).forEach(cls -> {
        //     if (cls.getNameAsString().equals("Test")) {
        //         cls.setName("TestScoped");
        //     }
        // });

        // Write to file explicitly
        try (Writer writer = new OutputStreamWriter(
                new FileOutputStream("TestScoped.java"),
                java.nio.charset.StandardCharsets.UTF_8)) {
            writer.write(cu.toString());
        }
    }

    static class RenameVariableVisitor extends ModifierVisitor<Void> {
        private Map<String, Set<String>> methodVarnames = new HashMap<>();
        private String currentMethod = null;

        @Override
        public Visitable visit(MethodDeclaration md, Void arg) {
            String oldMethod = currentMethod;
            currentMethod = md.getNameAsString();

            Set<String> vars = new HashSet<>();

            md.getParameters().forEach(p ->
                    vars.add(p.getNameAsString())
            );

            /*
             * Collect ordinary local variables only.
             *
             * Object variables such as:
             *
             *     Dog d = new Dog();
             *
             * must NOT be added to 'vars', because the OOP translator
             * needs the original variable name 'd' to resolve:
             *
             *     d.name
             *     d.age
             *     d.speak()
             */
            md.findAll(
                    VariableDeclarator.class,
                    v -> isInMethod(v, md)
            ).forEach(vd -> {
                if (!isObjectVariable(vd)) {
                    vars.add(vd.getNameAsString());
                }
            });

            methodVarnames.put(currentMethod, vars);

            // Rename parameters
            md.getParameters().forEach(p ->
                    p.setName(
                            p.getNameAsString() + "_" + currentMethod
                    )
            );

            /*
             * Rename ordinary local variable declarations.
             *
             * Object variables are deliberately left unchanged.
             *
             * Example:
             *
             *     int x = 10;
             *         ↓
             *     int x_main = 10;
             *
             * But:
             *
             *     Dog d = new Dog();
             *
             * remains:
             *
             *     Dog d = new Dog();
             */
            md.findAll(
                    VariableDeclarator.class,
                    v -> isInMethod(v, md)
            ).forEach(vd -> {
                if (!isObjectVariable(vd)) {
                    vd.setName(
                            vd.getNameAsString() + "_" + currentMethod
                    );
                }
            });

            // Rename all usages of ordinary variables inside the method
            md.getBody().ifPresent(body -> {
                body.accept(
                        new VariableReferenceRenamer(vars, currentMethod),
                        null
                );
            });

            Visitable result = super.visit(md, arg);
            currentMethod = oldMethod;
            return result;
        }

        // Helper: checks if a VariableDeclarator is within md
        private boolean isInMethod(
                VariableDeclarator vd,
                MethodDeclaration md) {

            Node n = vd;

            while (n != null) {
                if (n == md) {
                    return true;
                }

                n = n.getParentNode().orElse(null);
            }

            return false;
        }

        /*
         * Checks whether a variable is an object instance.
         *
         * Example:
         *
         *     Dog d = new Dog();
         *
         * Here:
         *
         *     vd.getNameAsString() = "d"
         *     initializer = ObjectCreationExpr
         *
         * Therefore this returns true.
         *
         * Object variables must retain their names so that the
         * Java-to-COBOL translator can maintain:
         *
         *     d -> Dog
         */
        private boolean isObjectVariable(VariableDeclarator vd) {
            return vd.getInitializer()
                    .map(initializer ->
                            initializer instanceof ObjectCreationExpr)
                    .orElse(false);
        }
    }

    static class VariableReferenceRenamer extends ModifierVisitor<Void> {
        private final Set<String> vars;
        private final String methodName;

        public VariableReferenceRenamer(
                Set<String> vars,
                String methodName) {

            this.vars = vars;
            this.methodName = methodName;
        }

        @Override
        public Visitable visit(NameExpr n, Void arg) {
            if (vars.contains(n.getNameAsString())) {
                n.setName(
                        n.getNameAsString() + "_" + methodName
                );
            }

            return super.visit(n, arg);
        }

        @Override
        public Visitable visit(SimpleName n, Void arg) {

            // Only replace if parent is not a declaration
            // (handled earlier)
            if (!(n.getParentNode().orElse(null)
                    instanceof VariableDeclarator)
                    && !(n.getParentNode().orElse(null)
                    instanceof com.github.javaparser.ast.body.Parameter)
                    && vars.contains(n.getIdentifier())) {

                n.setIdentifier(
                        n.getIdentifier() + "_" + methodName
                );
            }

            return super.visit(n, arg);
        }
    }
}