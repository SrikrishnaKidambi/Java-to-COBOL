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
    private int findFunctionStart(String text, int fromIndex) {
        Pattern functionPattern = Pattern.compile("\\b\\w+\\.\\w+\\b");
        Matcher matcher = functionPattern.matcher(text);
        if (matcher.find(fromIndex)) {
            int nextChar = matcher.end();
            if (nextChar < text.length() && text.charAt(nextChar) == '(') {
                return matcher.start();
            } else {
                return findFunctionStart(text, nextChar);
            }
        }
        return -1;
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

        if (text.startsWith("Math.min")) {
            int start = text.indexOf('(');
            int end = text.lastIndexOf(')');
            if (start != -1 && end != -1) {
                String args = accomodateIntrinsicFunctions(text.substring(start + 1, end));
                args = args.replace(",", " ");
                return "FUNCTION MIN(" + args + ")";
            }
        }

        return text;
    }


    public static void main(String[] args) {
        IntrinsicFunctionConverter converter = new IntrinsicFunctionConverter();

        String javaLine = "int a = Math.min(3, 2) + Math.sin(Math.min(2,Math.sin(60))) + Math.min(3, Math.min(4,5));";
        String cobolLine = converter.accomodateIntrinsicFunctions(javaLine);

        System.out.println("Original: " + javaLine);
        System.out.println("Converted: " + cobolLine);
    }
}
