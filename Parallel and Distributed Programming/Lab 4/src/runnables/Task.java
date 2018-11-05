package runnables;

import model.Matrix;
import model.Point;

import java.util.List;

public class Task implements Runnable {
    private Point point; 
    private List<Matrix> matrices;
    private List<Matrix> results;

    public Task(Point point, List<Matrix> matrices, List<Matrix> results) {
        this.point = point;
        this.matrices = matrices;
        this.results = results;
    }

    @Override
    public void run() {
        for (int col = 0; col < results.get(point.getMatrixIndex()).getColsNumber(); col++) {
            results.get(point.getMatrixIndex() + 1).addTo(this.point.getRow(), col,
                    results.get(point.getMatrixIndex()).get(this.point.getRow(), this.point.getCol()) *
                            matrices.get(point.getMatrixIndex() + 1).get(this.point.getCol(), col)
            );
        }

    }

    public Point getPoint() {
        return point;
    }

    public List<Matrix> getMatrices() {
        return matrices;
    }

    public List<Matrix> getResults() {
        return results;
    }

    @Override
    public String toString() {
        return point.toString();
    }
}
