public class VariableInfo{
    String name;
    String size;
    public VariableInfo(String name,String size){
        this.name=name;
        this.size=size;
    }

    public String toString(){
        return size!=null?name+" [size="+size+"]":name;
    }
}