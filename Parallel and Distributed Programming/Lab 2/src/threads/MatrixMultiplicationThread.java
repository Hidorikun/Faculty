package threads;

import javafx.util.Pair;
import model.Matrix;

public class MatrixMultiplicationThread extends MatrixOperationThread{
    public MatrixMultiplicationThread(Matrix a, Matrix b, Matrix sum) {
        super(a, b, sum);
    }

    @Override
    public void run() {
        for (Pair<Integer, Integer> point : this.workload){
            int result = 0;
            for (int i = 0; i < sum.getRowsNumber(); i++){
                result += (a.get(point.getKey(), i) * b.get(i, point.getValue()));
            }

            this.sum.set(point.getKey(), point.getValue(), result);
        }
    }
}
