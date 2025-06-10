import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IntrinsicFunctionConverter {

    
    public String accomodateIntrinsicFunctions(String text) {
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
        
        // Pattern 1: Regular function calls like Math.sin, Integer.parseInt, etc.
        Pattern functionPattern = Pattern.compile("\\b\\w+\\.\\w+\\b");
        Matcher matcher = functionPattern.matcher(text);
        if (matcher.find(fromIndex)) {
            int nextChar = matcher.end();
            if (nextChar < text.length() && text.charAt(nextChar) == '(') {
                earliestMatch = matcher.start();
            }
        }
        
        // Pattern 2: String literals with method calls like "Hello".toUpperCase()
        Pattern stringMethodPattern = Pattern.compile("\"[^\"]*\"\\.\\w+\\(\\)");
        Matcher stringMatcher = stringMethodPattern.matcher(text);
        if (stringMatcher.find(fromIndex)) {
            if (earliestMatch == -1 || stringMatcher.start() < earliestMatch) {
                earliestMatch = stringMatcher.start();
            }
        }
        
        // Pattern 3: Variables with method calls like myString.toUpperCase()
        Pattern varMethodPattern = Pattern.compile("\\b\\w+\\.\\w+\\(\\)");
        Matcher varMatcher = varMethodPattern.matcher(text);
        if (varMatcher.find(fromIndex)) {
            if (earliestMatch == -1 || varMatcher.start() < earliestMatch) {
                earliestMatch = varMatcher.start();
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
        if (text.endsWith(".toUpperCase()")) {
            String stringArg = text.substring(0, text.length() - ".toUpperCase()".length());
            stringArg = accomodateIntrinsicFunctions(stringArg);
            return "FUNCTION UPPER-CASE(" + stringArg + ")";
        }
        // REVERSE function mapping (handles chaining)
        else if (text.endsWith(".reverse()")) {
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
    public static void main(String[] args) {
        IntrinsicFunctionConverter converter = new IntrinsicFunctionConverter();
        //Character.codePointAt(\"A\",0)+Character.codePointAt(\"A\",i)+ Character.codePointAt(myString,1)+Character.codePointAt(myString,i)++ Character.codePointAt(\"A\", 0) + Character.codePointAt(myString, 1)
        // String javaLine = "int a = Arrays.stream(numbers).sum() + \"Hello\".toUpperCase().reverse()+ name.reverse().toUpperCase()+ \"Hello\".reverse() +name.toUpperCase()+Integer.signum(-4) + Math.sin(Math.min(2,Math.random())) + Math.min(3, Double.valueOf(str)) + Math.sqrt(val);";
        String javaLine = "char ch = Collections.max(Arrays.asList(char1, char2, char3));";
        String cobolLine = converter.accomodateIntrinsicFunctions(javaLine);

        System.out.println("Original: " + javaLine);
        System.out.println("Converted: " + cobolLine);
    }
}