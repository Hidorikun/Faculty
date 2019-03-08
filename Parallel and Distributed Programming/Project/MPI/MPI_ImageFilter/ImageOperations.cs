using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MPI_ImageFilter
{
    class ImageOperations
    {
        private int height;
        private int width;

        private int[,] r;
        private int[,] g;
        private int[,] b;
        private int[,] grayScale;
        private int[,,] blurMatrix;

        public ImageOperations(Bitmap image)
        {
            height = image.Height;
            width = image.Width;
            
            r = new int[height, width];
            g = new int[height, width];
            b = new int[height, width];
            grayScale = new int[height, width];
            blurMatrix = new int[height, width, 3];

            for (int i = 0; i < height; i++)
                for (int j = 0; j < width; j++)
                {
                    Color pixelColor = image.GetPixel(j, i);
                    r[i, j] = pixelColor.R;
                    g[i, j] = pixelColor.G;
                    b[i, j] = pixelColor.B;
                }
        }

        public int[,] MPIgrayScale(Bitmap image, int begin, int end)
        {
            for (int i = begin; i < end; i++)
            {
                for (int j = 0; j < width; j++)
                {
                    int sum = (int)(r[i, j] * 0.299 + g[i, j] * 0.587 + b[i, j] * 0.114);
                    //int sum = (int)((r[j][i] + g[j][i] + b[j][i])/3);
                    if (sum > 255)
                        grayScale[i, j] = 255;
                    else
                        grayScale[i, j] = sum;
                }
            }

            return grayScale;
        }

        public int[, ,] MPIgaussianBlur(Bitmap image, int begin, int end, int blurringDegree)
        {
            for (int i = begin; i < end; i++)
            {
                for (int j = 0; j < width; j++)
                {
                    int[] averagePixelArray = getAveragePixel(i, j, blurringDegree);
                    for (int k = 0; k < averagePixelArray.Length; k++)
                    {
                        blurMatrix[i, j, k] = averagePixelArray[k];
                    }
                }
            }

            return blurMatrix;
        }

        private int[] getAveragePixel(int x, int y, int size)
        {
            int[] average = new int[3];
            average[0] = 0;
            average[1] = 0;
            average[2] = 0;
            int pix = 0;
            for (int i = x - (size / 2); i < x + (size / 2) + 1; i++)
                if (i >= 0 && i < height)
                    for (int j = y - 1; j < y + 2; j++)
                        if (j >= 0 && j < width)
                            if (x != i || y != j)
                            {
                                pix++;
                                average[0] += r[i, j];
                                average[1] += g[i, j];
                                average[2] += b[i, j];
                            }
            average[0] = average[0] / pix;
            average[1] = average[1] / pix;
            average[2] = average[2] / pix;

            return average;
        }

        public void exportGrayScaleImage(int[,] results, String oldPath, String newPath)
        {
            exportImage(oldPath, newPath, createPixelMatrix(results, results, results));
        }

        public void exportGaussianBlurImage(int[, ,] results, string oldPath, string newPath)
        {
            exportImage(oldPath, newPath, results);
        }

        private void exportImage(String oldPath, String newPath, int[,,] pixelMatrix)
        {
            Bitmap newImage = new Bitmap(oldPath);

            for (int i = 0; i < height; i++)
                for (int j = 0; j < width; j++)
                {
                    int[] pixelColorArray = new int[3];
                    pixelColorArray[0] = pixelMatrix[i, j, 0];
                    pixelColorArray[1] = pixelMatrix[i, j, 1];
                    pixelColorArray[2] = pixelMatrix[i, j, 2];

                    Color pixelColor = Color.FromArgb(pixelColorArray[0], pixelColorArray[1], pixelColorArray[2]);
                    newImage.SetPixel(j, i, pixelColor);
                }

            newPath = newPath + ".jpg";
            newImage.Save(newPath, System.Drawing.Imaging.ImageFormat.Jpeg);
        }

        public int[,,] createPixelMatrix(int[,] r, int[,] g, int[,] b)
        {
            int[,,] pixelMatrix = new int[height, width, 3];

            for (int i = 0; i < height; i++)
                for (int j = 0; j < width; j++)
                {
                    int[] pixel = new int[3];
                    pixel[0] = r[i, j];
                    pixel[1] = g[i, j];
                    pixel[2] = b[i, j];
                    for (int k = 0; k < pixel.Length; k++)
                    {
                        pixelMatrix[i, j, k] = pixel[k];
                    }
                }

            return pixelMatrix;
        }
    }
}
