import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Console {
    public void run() {
        while(true){
            printMenu();
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            try {
                int input = Integer.parseInt(br.readLine());
                switch (input){
                    case 0: System.exit(0);
                    case 1: gaussianBlur(); break;
                    case 2: grayScale(); break;
                    default:
                        System.out.println("Invalid option");
                }
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    private void grayScale() {
        Image img800x600 = new Image("./InputPhotos/cat-800x600.jpg");
       System.out.println("Time for 800x600 is: " + img800x600.exportGrayScaleImageToFile("./OutputPhotos/gray_img800x600") + " seconds");

        Image img1600x1200 = new Image("./InputPhotos/cat-1600x1200.jpg");
        System.out.println("Time for 1600x1200 is: " + img1600x1200.exportGrayScaleImageToFile("./OutputPhotos/gray_img1600x1200") + " seconds");

        Image img4096x2160 = new Image("./InputPhotos/cat-4096x2160.jpg");
        System.out.println("Time for 4096x2160 is: " + img4096x2160.exportGrayScaleImageToFile("./OutputPhotos/gray_img4096x2160") + " seconds");
    }

    private void gaussianBlur() {
        int blurSize = getBlurSize();

        Image img800x600 = new Image("./InputPhotos/cat-800x600.jpg", blurSize);
        System.out.println("Time for 800x600 is: " + img800x600.exportGaussianBlurImageToFile("./OutputPhotos/blur_img800x600") + " seconds");

        Image img1600x1200 = new Image("./InputPhotos/cat-1600x1200.jpg", blurSize);
        System.out.println("Time for 1600x1200 is: " + img1600x1200.exportGaussianBlurImageToFile("./OutputPhotos/blur_img1600x1200") + " seconds");

        Image img4096x2160 = new Image("./InputPhotos/cat-4096x2160.jpg", blurSize);
        System.out.println("Time for 4096x2160 is: " + img4096x2160.exportGaussianBlurImageToFile("./OutputPhotos/blur_img4096x2160") + " seconds");
    }

    private int getBlurSize() {
        System.out.println("Blur depth: ");
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        try {
            int input = Integer.parseInt(br.readLine());
            return input;
        } catch (IOException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    private void printMenu() {
        System.out.println();
        System.out.println("Choose which image filter do you want to apply:");
        System.out.println("1) Gaussian Blur");
        System.out.println("2) Gray scale");
        System.out.println("0) Exit");
        System.out.print("Your choice: ");
        System.out.println();
    }
}
