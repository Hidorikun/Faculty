package threads;

import javafx.util.Pair;
import model.Matrix;

public class MatrixMultiplicationThread extends MatrixOperationThread{
    public MatrixMultiplicationThread(Matrix a, Matrix b, Matrix result) {
        super(a, b, result);
    }

    @Override
    public void run() {
        for (Pair<Integer, Integer> point : this.workload){
            int result = 0;
            for (int i = 0; i < this.result.getRowsNumber(); i++){
                result += (a.get(point.getKey(), i) * b.get(i, point.getValue()));
            }

            this.result.set(point.getKey(), point.getValue(), result);
        }
    }
}
