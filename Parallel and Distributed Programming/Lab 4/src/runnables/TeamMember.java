package runnables;

import model.Matrix;
import model.Point;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Semaphore;

public class TeamMember extends Thread {

    static Semaphore mutex = new Semaphore(1);

    private int id;
    private ConcurrentLinkedQueue<Task> backlog;
    private Map<Point, Integer> pointsValiation;

    private List<Matrix> matrices;
    private List<Matrix> results;

    public TeamMember(int id, ConcurrentLinkedQueue<Task> backlog, Map<Point, Integer> pointsValiation, List<Matrix> matrices, List<Matrix> results) {
        this.id = id;
        this.backlog = backlog;
        this.pointsValiation = pointsValiation;
        this.matrices = matrices;
        this.results = results;
    }

    @Override
    public void run() {
        while (true) {
            try {
                mutex.acquire();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            Task task = backlog.poll();
            mutex.release();

            if (task == null) {
                return;
            }

            task.run();

            int colCount = task.getMatrices().get(0).getColsNumber();

            if (task.getPoint().getMatrixIndex() == this.results.size() - 2){
                continue;
            }

            for (int col = 0; col < colCount; col++) {
                try {
                    mutex.acquire();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Point affectedPoint = new Point(task.getPoint().getMatrixIndex() + 1, task.getPoint().getRow(), col);

                if (pointsValiation.containsKey(affectedPoint)){
                    pointsValiation.put(affectedPoint, pointsValiation.get(affectedPoint) + 1);
                }else{
                    pointsValiation.put(affectedPoint, 1);
                }

                if (pointsValiation.get(affectedPoint) == colCount) {
                    backlog.add(new Task(affectedPoint, this.matrices, this.results));
                }


                mutex.release();
            }
        }
    }
}
