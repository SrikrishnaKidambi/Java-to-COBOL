public class Test28 {
    static void printMatrixDiagonal() {
        for (int row = 0; row < 3; row++) {
            for (int col = 0; col < 3; col++) {
                if (row == col) {
                    System.out.println("Diagonal: " + row + "," + col);
                }
            }
        }
    }

    public static void main(String[] args) {
        printMatrixDiagonal();
    }
}
