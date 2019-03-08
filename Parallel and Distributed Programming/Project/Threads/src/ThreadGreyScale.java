public class ThreadGreyScale implements Runnable {
    private int width;
    private int i;

    private int[][] r;
    private int[][] g;
    private int[][] b;
    private int[][] grayScale;

    public ThreadGreyScale(int i, int width, int[][] r, int[][] g, int[][] b, int[][] grayScale) {
        this.i = i;
        this.width = width;
        this.r = r;
        this.g = g;
        this.b = b;
        this.grayScale = grayScale;

    }

    @Override
    public void run() {
        for (int j = 0; j < width; j++) {
            int sum = (int) (r[i][j] * 0.299 + g[i][j] * 0.587 + b[i][j] * 0.114);
            if (sum > 255)
                grayScale[i][j] = 255;
            else
                grayScale[i][j] = sum;
        }
    }
}
