import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IntrinsicFunctionConverter {

    
    public String accomodateIntrinsicFunctions(String text) {

        // identifying the pattern for casting to int

        Pattern integerCastPattern=Pattern.compile("\\(int\\)\\s*([\\w\\.\\(\\)]+)");
        Matcher integerCastMatcher=integerCastPattern.matcher(text);
        StringBuffer sb=new StringBuffer();
        while(integerCastMatcher.find()){
            String arg=integerCastMatcher.group(1);
            integerCastMatcher.appendReplacement(sb, "FUNCTION INTEGER("+arg+")");
        }
        integerCastMatcher.appendTail(sb);
        text=sb.toString();

        Pattern firstOnePattern = Pattern.compile("Integer\\.numberOfLeadingZeros\\s*\\(([^)]*)\\)\\s*\\+\\s*1");
        Matcher firstOneMatcher=firstOnePattern.matcher(text);
        StringBuffer firstOneBuffer=new StringBuffer();
        while(firstOneMatcher.find()){
            String expr=firstOneMatcher.group(1).trim();
            firstOneMatcher.appendReplacement(firstOneBuffer, "FUNCTION FIRSTONE("+expr+")");
        }

        firstOneMatcher.appendTail(firstOneBuffer);
        text=firstOneBuffer.toString();

        StringBuilder result = new StringBuilder();
        int i = 0;
        while (i < text.length()) {
            int funcStart = findFunctionStart(text, i);
            if (funcStart == -1) {
                result.append(text.substring(i));
                break;
            }

            // Append before function
            result.append(text.substring(i, funcStart));

            int parenStart = text.indexOf('(', funcStart);
            int parenEnd = findMatchingParen(text, parenStart);
            if (parenStart == -1 || parenEnd == -1) break;

            String fullFuncCall = text.substring(funcStart, parenEnd + 1);
            String converted = findIntrinsicFunction(fullFuncCall);
            result.append(converted);

            i = parenEnd + 1;
        }
        return result.toString();
    }

    // Helper to find start of function like "Math.min"
    // Replace your existing findFunctionStart method with this updated version
    // Replace your findFunctionStart method with this corrected version
    private int findFunctionStart(String text, int fromIndex) {
        int earliestMatch = -1;

        // Single unified pattern: word.word( — covers ALL method calls with any args
        // This handles: Math.sin(, s.length(, s.charAt(1, "lit".toUpperCase(
        Pattern callPattern = Pattern.compile("\\b\\w+\\.\\w+\\s*\\(");
        Matcher m = callPattern.matcher(text);
        // Find ALL matches from fromIndex and pick the earliest one
        m.region(fromIndex, text.length());
        while (m.find()) {
            // The match includes the '(' - function start is at m.start()
            if (earliestMatch == -1 || m.start() < earliestMatch) {
                earliestMatch = m.start();
                break; // region scan goes left-to-right, first is earliest
            }
        }

        // Also check string literal method calls: "Hello".method(
        Pattern stringMethodPattern = Pattern.compile("\"[^\"]*\"\\.\\w+\\s*\\(");
        Matcher sm = stringMethodPattern.matcher(text);
        sm.region(fromIndex, text.length());
        if (sm.find()) {
            if (earliestMatch == -1 || sm.start() < earliestMatch) {
                earliestMatch = sm.start();
            }
        }

        return earliestMatch;
    }
    // Find the position of the matching closing parenthesis
    private int findMatchingParen(String text, int openIndex) {
        int count = 0;
        for (int i = openIndex; i < text.length(); i++) {
            if (text.charAt(i) == '(') count++;
            else if (text.charAt(i) == ')') count--;
            if (count == 0) return i;
        }
        return -1;
    }




    public String findIntrinsicFunction(String text) {
        if (text.startsWith("Math.sin")) {
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String arg = accomodateIntrinsicFunctions(text.substring(start + 1, end));
                return "FUNCTION SIN(" + arg + ")";
            }
        }
        else if (text.startsWith("Math.min")) {
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String args = accomodateIntrinsicFunctions(text.substring(start + 1, end));
                args = args.replace(",", " ");
                return "FUNCTION MIN(" + args + ")";
            }
        }
        else if (text.startsWith("Math.max")) {
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String args = accomodateIntrinsicFunctions(text.substring(start + 1, end));
                args = args.replace(",", " ");
                return "FUNCTION MAX(" + args + ")";
            }
        }
        else if(text.startsWith("Math.floorMod")){
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String args = accomodateIntrinsicFunctions(text.substring(start + 1, end));
                args = args.replace(",", " ");
                return "FUNCTION MOD(" + args + ")";
            }
        }
        else if (text.startsWith("Integer.parseInt") ||
            text.startsWith("Double.parseDouble") ||
            text.startsWith("Float.parseFloat") ||
            text.startsWith("Long.parseLong") ||
            text.startsWith("Short.parseShort") ||
            text.startsWith("Byte.parseByte") ||
            text.startsWith("Double.valueOf")) {

            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String arg = accomodateIntrinsicFunctions(text.substring(start + 1, end));
                return "FUNCTION NUMVAL(" + arg + ")";
            }
        }
        else if(text.startsWith("Math.sqrt")){
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String arg = accomodateIntrinsicFunctions(text.substring(start + 1, end));
                return "FUNCTION SQRT(" + arg + ")";
            }
        }
        else if (text.startsWith("Character.codePointAt")) {
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String args = accomodateIntrinsicFunctions(text.substring(start + 1, end));
                String[] argArray = args.split(",");
                if (argArray.length >= 2) {
                    String stringArg = argArray[0].trim();
                    String indexArg = argArray[1].trim();
                    
                    // Convert double quotes to single quotes only for string literals
                    String cobolString = stringArg;
                    if (stringArg.startsWith("\"") && stringArg.endsWith("\"")) {
                        cobolString = "'" + stringArg.substring(1, stringArg.length() - 1) + "'";
                    }
                    
                    // If index is 0, we can use the string/variable directly with ORD
                    if ("0".equals(indexArg)) {
                        return "FUNCTION ORD(" + cobolString + ")";
                    } else {
                        // For non-zero index, we need to extract substring first
                        try {
                            int index = Integer.parseInt(indexArg);
                            return "FUNCTION ORD(" + cobolString + "(" + (index + 1) + ":1))";
                        } catch (NumberFormatException e) {
                            // If indexArg is a variable, handle it differently
                            return "FUNCTION ORD(" + cobolString + "(" + indexArg + " + 1:1))";
                        }
                    }
                }
            }
        }
        else if (text.startsWith("Math.tan")) {
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String arg = accomodateIntrinsicFunctions(text.substring(start + 1, end));
                return "FUNCTION TAN(" + arg + ")";
            }
        }
        else if (text.startsWith("Integer.signum") || 
                text.startsWith("Double.signum") || 
                text.startsWith("Float.signum") || 
                text.startsWith("Math.signum")) {
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String arg = accomodateIntrinsicFunctions(text.substring(start + 1, end));
                return "FUNCTION SIGN(" + arg + ")";
            }
        }
        else if (text.startsWith("Math.random")) {
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                return "FUNCTION RANDOM";
            }
        }
        else if(text.startsWith("Math.abs") || text.startsWith("Integer.abs") || text.startsWith("Double.abs") || text.startsWith("Float.abs") || text.startsWith("Long.abs") || text.startsWith("Short.abs")){
            int start=text.indexOf('(');
            int end=text.lastIndexOf(')');
            if(start!=-1 && end!=-1){
                String arg=accomodateIntrinsicFunctions(text.substring(start+1, end));
                return "FUNCTION ABS("+arg+")";
            }
        }else if(text.startsWith("Math.acos")){
            int start=text.indexOf('(');
            int end=text.indexOf(')');
            if(start!=-1 && end!=-1){
                String arg=accomodateIntrinsicFunctions(text.substring(start+1, end));
                return "FUNCTION ACOS("+arg+")";
            }
        }else if(text.startsWith("Math.asin")){
            int start=text.indexOf('(');
            int end=text.indexOf(')');
            if(start!=-1 && end!=-1){
                String arg=accomodateIntrinsicFunctions(text.substring(start+1, end));
                return "FUNCTION ASIN("+arg+")";
            }
        }
        else if(text.startsWith("Math.atan")){
            int start=text.indexOf('(');
            int end=text.indexOf(')');
            if(start!=-1 && end!=-1){
                String arg=accomodateIntrinsicFunctions(text.substring(start+1, end));
                return "FUNCTION ATAN("+arg+")";
            }
        }
        else if(text.startsWith("Math.exp")){
            int start=text.indexOf('(');
            int end=text.indexOf(')');
            if(start!=-1 && end!=-1){
                String arg=accomodateIntrinsicFunctions(text.substring(start+1, end));
                return "FUNCTION EXP("+arg+")";
            }
        }
        else if(text.startsWith("Math.floor")){
            int start=text.indexOf('(');
            int end=text.lastIndexOf(')');
            if(start!=-1 && end!=-1){
                String arg=accomodateIntrinsicFunctions(text.substring(start+1,end));
                return "FUNCTION INTEGER("+arg+")";
            }
        }
        else if(text.startsWith("Math.acos")){
            int start=text.indexOf('(');
            int end=text.indexOf(')');
            if(start!=-1 && end!=-1){
                String arg=accomodateIntrinsicFunctions(text.substring(start+1, end));
                return "FUNCTION ACOS("+arg+")";
            }
        }
        else if(text.startsWith("Math.log")){
            int start=text.indexOf('(');
            int end=text.indexOf(')');
            if(start!=-1 && end!=-1){
                String arg=accomodateIntrinsicFunctions(text.substring(start+1, end));
                return "FUNCTION LOG("+arg+")";
            }
        }
        else if(text.startsWith("Math.log10")){
            int start=text.indexOf('(');
            int end=text.indexOf(')');
            if(start!=-1 && end!=-1){
                String arg=accomodateIntrinsicFunctions(text.substring(start+1, end));
                return "FUNCTION LOG10("+arg+")";
            }
        }
        if (text.endsWith(".toUpperCase()")) {
            String stringArg = text.substring(0, text.length() - ".toUpperCase()".length());
            stringArg = accomodateIntrinsicFunctions(stringArg);
            return "FUNCTION UPPER-CASE(" + stringArg + ")";
        }else if (text.endsWith(".toLowerCase()")) {
            String stringArg = text.substring(0, text.length() - ".toLowerCase()".length());
            stringArg = accomodateIntrinsicFunctions(stringArg);
            return "FUNCTION LOWER-CASE(" + stringArg + ")";
        }
        // REVERSE function mapping (handles chaining)
        else if (text.endsWith(".reverse().toString()")) {
            String stringArg = text.substring(0, text.length() - ".reverse()".length());
            stringArg = accomodateIntrinsicFunctions(stringArg);
            return "FUNCTION REVERSE(" + stringArg + ")";
        }
        // Java sum mapping for arrays (maps Arrays.stream(arr).sum() and IntStream.of(arr).sum() to COBOL FUNCTION SUM)
        //********To be verified later */
        else if (
            (text.startsWith("java.util.Arrays.stream(") && text.endsWith(").sum()")) ||
            (text.startsWith("IntStream.of(") && text.endsWith(").sum()")) ||
            (text.startsWith("Arrays.stream(") && text.endsWith(").sum()"))
        ) {
            // Extract the array name/expression
            int start = text.indexOf('(') + 1;
            int end = text.lastIndexOf(')');
            String arg = text.substring(start, end - 4); // remove ").sum"
            arg = accomodateIntrinsicFunctions(arg.trim());
            return "FUNCTION SUM(" + arg + ")";
        }
        else if (text.startsWith("Collections.max")) {
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String args = text.substring(start + 1, end);
                
                // Handle Arrays.asList pattern
                if (args.contains("Arrays.asList")) {
                    int arrayStart = args.indexOf("Arrays.asList(") + "Arrays.asList(".length();
                    int arrayEnd = args.lastIndexOf(')');
                    if (arrayEnd > arrayStart) {
                        String charList = args.substring(arrayStart, arrayEnd);
                        // Process the character list - remove quotes and spaces
                        String processedChars = processCharacterList(charList);
                        return "FUNCTION ORD-MAX(" + processedChars + ")";
                    }
                }
                // Handle direct list/array
                else {
                    String processedArgs = accomodateIntrinsicFunctions(args);
                    return "FUNCTION ORD-MAX(" + processedArgs + ")";
                }
            }
        }

        // ORD-MIN mapping - for Collections.min with character lists  
        else if (text.startsWith("Collections.min")) {
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String args = text.substring(start + 1, end);
                
                // Handle Arrays.asList pattern
                if (args.contains("Arrays.asList")) {
                    int arrayStart = args.indexOf("Arrays.asList(") + "Arrays.asList(".length();
                    int arrayEnd = args.lastIndexOf(')');
                    if (arrayEnd > arrayStart) {
                        String charList = args.substring(arrayStart, arrayEnd);
                        // Process the character list - remove quotes and spaces
                        String processedChars = processCharacterList(charList);
                        return "FUNCTION ORD-MIN(" + processedChars + ")";
                    }
                }
                // Handle direct list/array
                else {
                    String processedArgs = accomodateIntrinsicFunctions(args);
                    return "FUNCTION ORD-MIN(" + processedArgs + ")";
                }
            }
        }

        // ---- Fix 1.8: String instance method mappings ----
        // These are called with fullFuncCall = "varName.method(args)"

        // var.length()
        if (text.matches("\\w+\\.length\\(\\)")) {
            String var = text.substring(0, text.indexOf('.'));
            return "FUNCTION LENGTH(FUNCTION TRIM(" + var + "))";
        }
        // "literal".length()
        if (text.matches("\"[^\"]*\"\\.length\\(\\)")) {
            String lit = text.substring(0, text.indexOf('.'));
            return "FUNCTION LENGTH(" + lit + ")";
        }

        // var.isEmpty()
        if (text.matches("\\w+\\.isEmpty\\(\\)")) {
            String var = text.substring(0, text.indexOf('.'));
            return "(FUNCTION LENGTH(FUNCTION TRIM(" + var + ")) = 0)";
        }

        // var.equals(other)
        {
            Pattern p = Pattern.compile("^(\\w+)\\.equals\\((.+)\\)$");
            Matcher m = p.matcher(text);
            if (m.matches()) {
                return m.group(1) + " = " + m.group(2);
            }
        }

        // var.equalsIgnoreCase(other)
        {
            Pattern p = Pattern.compile("^(\\w+)\\.equalsIgnoreCase\\((.+)\\)$");
            Matcher m = p.matcher(text);
            if (m.matches()) {
                return "FUNCTION UPPER-CASE(" + m.group(1) + ") = FUNCTION UPPER-CASE(" + m.group(2) + ")";
            }
        }

        // var.charAt(literal_int)  →  var(pos+1:1)
        {
            Pattern p = Pattern.compile("^(\\w+)\\.charAt\\((\\d+)\\)$");
            Matcher m = p.matcher(text);
            if (m.matches()) {
                int pos = Integer.parseInt(m.group(2)) + 1;
                return m.group(1) + "(" + pos + ":1)";
            }
        }
        // var.charAt(expr)  →  var(expr+1:1)
        {
            Pattern p = Pattern.compile("^(\\w+)\\.charAt\\((.+)\\)$");
            Matcher m = p.matcher(text);
            if (m.matches()) {
                return m.group(1) + "(" + m.group(2) + " + 1:1)";
            }
        }

        // var.substring(start)  →  var(start+1:)
        {
            Pattern p = Pattern.compile("^(\\w+)\\.substring\\((\\d+)\\)$");
            Matcher m = p.matcher(text);
            if (m.matches()) {
                int start = Integer.parseInt(m.group(2)) + 1;
                return m.group(1) + "(" + start + ":)";
            }
        }
        // var.substring(start, end) with literal ints  →  var(start+1 : end-start)
        {
            Pattern p = Pattern.compile("^(\\w+)\\.substring\\((\\d+),\\s*(\\d+)\\)$");
            Matcher m = p.matcher(text);
            if (m.matches()) {
                int start  = Integer.parseInt(m.group(2));
                int end    = Integer.parseInt(m.group(3));
                int length = end - start;
                return m.group(1) + "(" + (start + 1) + ":" + length + ")";
            }
        }
        // var.substring(expr, expr) with variable indices
        {
            Pattern p = Pattern.compile("^(\\w+)\\.substring\\(([^,]+),\\s*(.+)\\)$");
            Matcher m = p.matcher(text);
            if (m.matches()) {
                String var   = m.group(1);
                String start = m.group(2).trim();
                String end   = m.group(3).trim();
                return var + "(" + start + " + 1:" + end + " - " + start + ")";
            }
        }

        // var.trim()
        if (text.matches("\\w+\\.trim\\(\\)")) {
            String var = text.substring(0, text.indexOf('.'));
            return "FUNCTION TRIM(" + var + ")";
        }

        // var.indexOf("x") — no direct COBOL equivalent, emit 0 as safe fallback
        if (text.matches("\\w+\\.indexOf\\(.+\\)")) {
            return "0";
        }

        // var.startsWith("prefix") with string literal
        {
            Pattern p = Pattern.compile("^(\\w+)\\.startsWith\\(\"([^\"]*)\"\\)$");
            Matcher m = p.matcher(text);
            if (m.matches()) {
                String var    = m.group(1);
                String prefix = m.group(2);
                int len = prefix.length();
                return var + "(1:" + len + ") = \"" + prefix + "\"";
            }
        }

        // var.endsWith("suffix") with string literal
        {
            Pattern p = Pattern.compile("^(\\w+)\\.endsWith\\(\"([^\"]*)\"\\)$");
            Matcher m = p.matcher(text);
            if (m.matches()) {
                String var    = m.group(1);
                String suffix = m.group(2);
                int len = suffix.length();
                return var + "(FUNCTION LENGTH(FUNCTION TRIM(" + var + ")) - "
                     + (len - 1) + ":" + len + ") = \"" + suffix + "\"";
            }
        }

        // String.valueOf(x) — just pass through the value
        if (text.startsWith("String.valueOf(")) {
            int start = text.indexOf('(');
            int end   = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                return accomodateIntrinsicFunctions(text.substring(start + 1, end));
            }
        }

        // Integer.toString(x) / Long.toString(x)
        if (text.startsWith("Integer.toString(") || text.startsWith("Long.toString(")) {
            int start = text.indexOf('(');
            int end   = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                return accomodateIntrinsicFunctions(text.substring(start + 1, end));
            }
        }

        // Character.isDigit(c)
        if (text.startsWith("Character.isDigit(")) {
            int start = text.indexOf('(');
            int end   = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String arg = text.substring(start + 1, end);
                return arg + " >= '0' AND " + arg + " <= '9'";
            }
        }

        // Character.isLetter(c)
        if (text.startsWith("Character.isLetter(")) {
            int start = text.indexOf('(');
            int end   = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String arg = text.substring(start + 1, end);
                return "(" + arg + " >= 'A' AND " + arg + " <= 'Z') OR ("
                     + arg + " >= 'a' AND " + arg + " <= 'z')";
            }
        }

        // Character.isUpperCase(c)
        if (text.startsWith("Character.isUpperCase(")) {
            int start = text.indexOf('(');
            int end   = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String arg = text.substring(start + 1, end);
                return arg + " >= 'A' AND " + arg + " <= 'Z'";
            }
        }

        // Character.isLowerCase(c)
        if (text.startsWith("Character.isLowerCase(")) {
            int start = text.indexOf('(');
            int end   = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String arg = text.substring(start + 1, end);
                return arg + " >= 'a' AND " + arg + " <= 'z'";
            }
        }

        return text;
    }

    // Helper method to process character lists for ORD-MAX/ORD-MIN
    private String processCharacterList(String charList) {
        StringBuilder result = new StringBuilder();
        String[] chars = charList.split(",");
        
        for (int i = 0; i < chars.length; i++) {
            String ch = chars[i].trim();
            
            // Remove single quotes around characters and convert to COBOL format
            if (ch.startsWith("'") && ch.endsWith("'") && ch.length() == 3) {
                // Single character like 'A'
                result.append("\"").append(ch.charAt(1)).append("\"");
            } else if (ch.startsWith("\"") && ch.endsWith("\"")) {
                // Already double quoted - keep as is
                result.append(ch);
            } else {
                // Variable or other expression
                result.append(ch);
            }
            
            if (i < chars.length - 1) {
                result.append(" ");
            }
        }
        
        return result.toString();
    }
    //main is just for testing
    public static void main(String[] args) {
        IntrinsicFunctionConverter converter = new IntrinsicFunctionConverter();
        //Character.codePointAt(\"A\",0)+Character.codePointAt(\"A\",i)+ Character.codePointAt(myString,1)+Character.codePointAt(myString,i)++ Character.codePointAt(\"A\", 0) + Character.codePointAt(myString, 1)
        // String javaLine = "int a = Arrays.stream(numbers).sum() + \"Hello\".toUpperCase().reverse()+ name.reverse().toUpperCase()+ \"Hello\".reverse() +name.toUpperCase()+Integer.signum(-4) + Math.sin(Math.min(2,Math.random())) + Math.min(3, Double.valueOf(str)) + Math.sqrt(val);";
        String javaLine = "int x=Integer.numberOfLeadingZeros(mask)+1+Math.acos(1.45)+(int)x";
        String cobolLine = converter.accomodateIntrinsicFunctions(javaLine);

        System.out.println("Original: " + javaLine);
        System.out.println("Converted: " + cobolLine);
    }
}