import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ClassInfoExtractor extends JavaParserBaseListener {

    // One ClassInfo per class found in the file
    public static class ClassInfo {
        public String className;
        public String parentClass;          // null if no extends
        public List<FieldInfo> fields = new ArrayList<>();
        public List<MethodInfo> methods = new ArrayList<>();
        public List<MethodInfo> constructors = new ArrayList<>();
    }

    public static class FieldInfo {
        public String type;
        public String name;
    }

    public static class MethodInfo {
        public String name;
        public String returnType;           // "void" for constructors
        public List<String> paramTypes = new ArrayList<>();
        public List<String> paramNames = new ArrayList<>();
    }

    // Result: map from className → ClassInfo
    public Map<String, ClassInfo> classes = new LinkedHashMap<>();
    private ClassInfo currentClass = null;
    private boolean inMethod = false;

    @Override
    public void enterClassDeclaration(JavaParser.ClassDeclarationContext ctx) {
        currentClass = new ClassInfo();
        currentClass.className = ctx.identifier().getText();
        if (ctx.EXTENDS() != null) {
            currentClass.parentClass = ctx.typeType().getText();
        }
        classes.put(currentClass.className, currentClass);
    }

    @Override
    public void exitClassDeclaration(JavaParser.ClassDeclarationContext ctx) {
        currentClass = null;
    }

    @Override
    public void enterFieldDeclaration(JavaParser.FieldDeclarationContext ctx) {
        if (currentClass == null || inMethod) return;
        String type = ctx.typeType().getText();
        for (var decl : ctx.variableDeclarators().variableDeclarator()) {
            FieldInfo f = new FieldInfo();
            f.type = type;
            f.name = decl.variableDeclaratorId().getText();
            currentClass.fields.add(f);
        }
    }

    @Override
    public void enterConstructorDeclaration(JavaParser.ConstructorDeclarationContext ctx) {
        if (currentClass == null) return;
        MethodInfo m = new MethodInfo();
        m.name = ctx.identifier().getText();
        m.returnType = "void";
        if (ctx.formalParameters().formalParameterList() != null) {
            for (var p : ctx.formalParameters().formalParameterList().formalParameter()) {
                m.paramTypes.add(p.typeType().getText());
                m.paramNames.add(p.variableDeclaratorId().getText());
            }
        }
        currentClass.constructors.add(m);
        inMethod = true;
    }

    @Override
    public void exitConstructorDeclaration(JavaParser.ConstructorDeclarationContext ctx) {
        inMethod = false;
    }

    @Override
    public void enterMethodDeclaration(JavaParser.MethodDeclarationContext ctx) {
        if (currentClass == null) return;
        MethodInfo m = new MethodInfo();
        m.name = ctx.identifier().getText();
        m.returnType = ctx.typeTypeOrVoid().getText();
        if (ctx.formalParameters().formalParameterList() != null) {
            for (var p : ctx.formalParameters().formalParameterList().formalParameter()) {
                m.paramTypes.add(p.typeType().getText());
                m.paramNames.add(p.variableDeclaratorId().getText());
            }
        }
        currentClass.methods.add(m);
        inMethod = true;
    }

    @Override
    public void exitMethodDeclaration(JavaParser.MethodDeclarationContext ctx) {
        inMethod = false;
    }
}
