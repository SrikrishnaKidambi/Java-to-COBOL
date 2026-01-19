class P16_CharLoop {
    public static void main(String[] args) {
        char c = 'a';

        for (int i = 0; i < 5; i++) {
            System.out.println(c);
            c = (char)(c + 1);
        }
    }
}