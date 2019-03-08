public class ThreadBlur implements Runnable {
    private int i;
    private int height;
    private int width;
    private int size;

    private int[][] r;
    private int[][] g;
    private int[][] b;
    private int[][][] blurMatrix;

    public ThreadBlur(int i, int height, int width, int size, int[][] r, int[][] g, int[][] b, int[][][] blurMatrix) {
        this.i = i;
        this.height = height;
        this.width = width;
        this.size = size;
        this.r = r;
        this.g = g;
        this.b = b;
        this.blurMatrix = blurMatrix;
    }

    public synchronized void run() {
        for (int column = 0; column < width; column++)
            blurMatrix[i][column] = getAveragePixel(i, column, size);
    }

    private synchronized int[] getAveragePixel(int x, int y, int size) {
        int[] average = new int[3];
        int pix = 0;
        for (int i = x - (size / 2); i < x + (size / 2) + 1; i++)
            if (i >= 0 && i < height)
                for (int j = y - 1; j < y + 2; j++)
                    if (j >= 0 && j < width)
                        if (x != i || y != j) {
                            pix++;
                            average[0] += r[i][j];
                            average[1] += g[i][j];
                            average[2] += b[i][j];
                        }
        average[0] = average[0] / pix;
        average[1] = average[1] / pix;
        average[2] = average[2] / pix;

        return average;
    }
}
