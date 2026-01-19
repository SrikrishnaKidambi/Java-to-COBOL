class P20_RandomMod {
    public static void main(String[] args) {
        int r = (int)(Math.random() * 100);
        int mod = r % 10;

        System.out.println(r);
        System.out.println(mod);
    }
}