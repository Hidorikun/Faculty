import model.Matrix;
import model.MatrixOperation;
import threads.MatrixAdditionThread;
import threads.MatrixMultiplicationThread;
import threads.MatrixOperationThread;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static java.lang.Math.min;

public class Main {

    private static Matrix operation(MatrixOperation op, Matrix a, Matrix b, int threadCount) throws Exception {
        int rowCount = min(a.getRowsNumber(), b.getRowsNumber());
        int colCount = min(a.getColsNumber(), b.getColsNumber());

        Matrix sum = new Matrix(rowCount, colCount);

        List<MatrixOperationThread> threads = new ArrayList<>();

        switch (op){
            case ADD:
                for (int i = 0; i < threadCount; i++){
                    threads.add(new MatrixAdditionThread(a, b, sum));
                }
                break;
            case MULTIPLY:
                for (int i = 0; i < threadCount; i++){
                    threads.add(new MatrixMultiplicationThread(a, b, sum));
                }
                break;
            default:
                throw new Exception("MatrixOperation not recognizqd");
        }

        for (int row = 0; row < sum.getRowsNumber(); row++){
            for(int col = 0; col < sum.getRowsNumber(); col++){
                threads.get(sum.index(row, col) % threadCount).addPointToWorkload(row, col);
            }
        }

        for (int i = 0; i < threadCount; i++){
            threads.get(i).start();
        }

        for (int i = 0; i < threadCount; i++){
            threads.get(i).join();
        }
        return sum;
    }


    public static void main(String[] args) throws Exception {

        Matrix a = new Matrix(3, 3);
        a.setRow(0, Arrays.asList(15, 24, 53));
        a.setRow(1, Arrays.asList(48, 54, 63));
        a.setRow(2, Arrays.asList(78, 78, 97));

        Matrix b = new Matrix(3, 3);
        b.setRow(0, Arrays.asList(93, 8, 75));
        b.setRow(1, Arrays.asList(62, 53, 45));
        b.setRow(2, Arrays.asList(34, 25, 15));

        System.out.println("a =\n" + a);
        System.out.println("b =\n" + b);

        System.out.println("a + b =\n" + operation(MatrixOperation.ADD, a, b, 5).toString());


        Matrix c = new Matrix(3, 2);
        c.setRow(0, Arrays.asList(1, 2));
        c.setRow(1, Arrays.asList(3, 4));
        c.setRow(2, Arrays.asList(5, 6));

        Matrix d = new Matrix(2, 3);
        d.setRow(0, Arrays.asList(1, 2, 3));
        d.setRow(1, Arrays.asList(4, 5, 6));

        System.out.println("c =\n" + c);
        System.out.println("d =\n" + d);

        System.out.println("c * d =\n" + operation(MatrixOperation.MULTIPLY, c, d, 6).toString());
    }
}
