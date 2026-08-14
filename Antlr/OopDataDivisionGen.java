import java.io.PrintWriter;
import java.util.Map;

public class OopDataDivisionGen {

    /**
     * For each class, emit a 01-level group item representing one instance.
     * For each object variable declared in main (e.g. "Dog d"), emit a named
     * 01 record using the pattern: CLASSNAME-VARNAME
     *
     * Also emits:
     *   01 CURRENT-CLASSNAME-OBJ.        ← scratch record for method dispatch
     *       05 fields...
     *   01 RETURN-CLASSNAME-METHOD PIC ...  ← one per non-void method
     */
    public static void generateClassRecords(
            Map<String, ClassInfoExtractor.ClassInfo> classes,
            Map<String, String> objectVariables,   // varName → className
            PrintWriter writer) {

        for (ClassInfoExtractor.ClassInfo cls : classes.values()) {
            boolean hasInheritedFields = cls.parentClass != null && classes.containsKey(cls.parentClass)
                    && !classes.get(cls.parentClass).fields.isEmpty();
            boolean hasInstanceState = hasInheritedFields || !cls.fields.isEmpty();
            // ── 1. Template record (used as scratch during method calls) ──
            if (hasInstanceState) {
                writer.printf("      * Class record: %s%n", cls.className);
                writer.printf("       01  %s-OBJ.%n", cls.className.toUpperCase());
            }

            // Inherit parent fields first (single-level only)
            if (cls.parentClass != null && classes.containsKey(cls.parentClass)) {
                ClassInfoExtractor.ClassInfo parent = classes.get(cls.parentClass);
                for (ClassInfoExtractor.FieldInfo f : parent.fields) {
                    writer.printf("           05  %s%-12s %s%n",
                        cls.className.toUpperCase() + "-OBJ-",
                        f.name.toUpperCase(),
                        mapJavaToPic(f.type));
                }
            }
            // Own fields
            for (ClassInfoExtractor.FieldInfo f : cls.fields) {
                writer.printf("           05  %s%-12s %s%n",
                    cls.className.toUpperCase() + "-OBJ-",
                    f.name.toUpperCase(),
                    mapJavaToPic(f.type));
            }

            // ── 2. Return value variables per non-void method ──
            for (ClassInfoExtractor.MethodInfo m : cls.methods) {
                if (!m.returnType.equals("void")) {
                    writer.printf("       01  RETURN-%s-%s %s%n",
                        cls.className.toUpperCase(),
                        m.name.toUpperCase(),
                        mapJavaToPic(m.returnType));
                }
            }
        }

        // ── 3. Named instance records for each declared object variable ──
        writer.println("      * Object instance records");
        for (Map.Entry<String, String> entry : objectVariables.entrySet()) {
            String varName   = entry.getKey();     // e.g. "d"
            String className = entry.getValue();   // e.g. "Dog"
            ClassInfoExtractor.ClassInfo cls = classes.get(className);
            if (cls == null) continue;

            writer.printf("       01  %s-%s-INST.%n",
                className.toUpperCase(), varName.toUpperCase());

            // Inherit parent fields
            if (cls.parentClass != null && classes.containsKey(cls.parentClass)) {
                for (ClassInfoExtractor.FieldInfo f : classes.get(cls.parentClass).fields) {
                    writer.printf("           05  %s-%s-INST-%-12s %s%n",
                        className.toUpperCase(), varName.toUpperCase(),
                        f.name.toUpperCase(), mapJavaToPic(f.type));
                }
            }
            for (ClassInfoExtractor.FieldInfo f : cls.fields) {
                writer.printf("           05  %s-%s-INST-%-12s %s%n",
                    className.toUpperCase(), varName.toUpperCase(),
                    f.name.toUpperCase(), mapJavaToPic(f.type));
            }
        }

        writer.println("      * OOP method parameters");
        for (ClassInfoExtractor.ClassInfo cls : classes.values()) {
            for (ClassInfoExtractor.MethodInfo method : cls.methods) {
                if (!"main".equals(method.name)) {
                    writeMethodParameters(cls.className, method.name, method, writer);
                }
            }
            for (ClassInfoExtractor.MethodInfo constructor : cls.constructors) {
                writeMethodParameters(cls.className, "INIT", constructor, writer);
            }
        }
    }

    private static void writeMethodParameters(String className, String methodName,
                                              ClassInfoExtractor.MethodInfo method,
                                              PrintWriter writer) {
        for (int i = 0; i < method.paramNames.size(); i++) {
            writer.printf("       01  %s-%s-%s %s%n", className.toUpperCase(),
                    methodName.toUpperCase(), method.paramNames.get(i).toUpperCase(),
                    mapJavaToPic(method.paramTypes.get(i)));
        }
    }

    private static String mapJavaToPic(String type) {
        type = type.toLowerCase();
        if (type.contains("long"))   return "PIC S9(18).";
        if (type.contains("int"))    return "PIC S9(9).";
        if (type.contains("double")) return "PIC S9(9)V9(6).";
        if (type.contains("float"))  return "PIC S9(5)V9(4).";
        if (type.contains("char"))   return "PIC X(1).";
        if (type.contains("bool"))   return "PIC X(1).";
        return "PIC X(100).";
    }
}
