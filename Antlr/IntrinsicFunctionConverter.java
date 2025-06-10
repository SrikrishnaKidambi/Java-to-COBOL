import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IntrinsicFunctionConverter {

    
    public String accomodateIntrinsicFunctions(String text) {
        // Regex for matching function calls like Math.pow(a, b) or Character.toUpperCase(c)
        Pattern pattern = Pattern.compile("(\\w+\\.\\w+)\\(([^()]*)\\)");
        Matcher matcher = pattern.matcher(text);
        StringBuffer result = new StringBuffer();

        while (matcher.find()) {
            String fullFuncCall = matcher.group(0);       // e.g., Math.pow(a, 2)
            String replacement = findIntrinsicFunction(fullFuncCall);
            matcher.appendReplacement(result, Matcher.quoteReplacement(replacement));
        }
        matcher.appendTail(result);
        return result.toString();
    }


    public String findIntrinsicFunction(String text) {
        // Examples:
        // Math.pow(a, 2)
        // Character.toUpperCase(ch)
        // Integer.parseInt("123")
        // this will handle above type of intrinsic functions

        if(text.contains("Math.sin")){
            int start = text.indexOf('(');
            int end = text.indexOf(')');
            if(start!=-1 && end!=-1 && end>start){
                String arg = text.substring( start+1, end);
                return "FUNCTION SIN (" + arg + ")";
            }
        }

        

        // Default: return as is if no match
        return text;
    }

    public static void main(String[] args) {
        IntrinsicFunctionConverter converter = new IntrinsicFunctionConverter();

        String javaLine = "int a = Math.pow(x, 2) + Math.sin(30);";
        String cobolLine = converter.accomodateIntrinsicFunctions(javaLine);

        System.out.println("Original: " + javaLine);
        System.out.println("Converted: " + cobolLine);
    }
}
