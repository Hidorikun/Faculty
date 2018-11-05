import model.Matrix;
import model.Point;
import runnables.Task;
import runnables.TeamMember;

import java.util.*;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;

import static java.lang.Math.min;

public class Main {

    private static Matrix matrixMultiply(List<Matrix> matrices, int threadCount) throws Exception {
        int rowCount = matrices.get(0).getRowsNumber();
        for (Matrix m : matrices) {
            rowCount = min(m.getRowsNumber(), rowCount);
        }

        int colCount = matrices.get(0).getColsNumber();
        for (Matrix m : matrices) {
            colCount = min(m.getColsNumber(), colCount);
        }

        List<Matrix> results = new ArrayList<>();
        results.add(matrices.get(0));

        while (results.size() < matrices.size()) {
            results.add(new Matrix(rowCount, colCount, 0, 0));
        }

        ConcurrentLinkedQueue<Task> backlog = new ConcurrentLinkedQueue<>();

        for (int row = 0; row < rowCount; row++){
            for (int col= 0; col < colCount; col++) {
                backlog.add(new Task(new Point(0, row, col), matrices, results));
            }
        }

        Map<Point, Integer> pointsValidation = Collections.synchronizedMap(new HashMap<>());

        List<TeamMember> teamMembers = new ArrayList<>();

        for (int i = 0; i < threadCount; i++){
            teamMembers.add(new TeamMember(i, backlog, pointsValidation, matrices, results));
        }

        for (TeamMember teamMember: teamMembers){
            teamMember.start();
        }

        for (TeamMember teamMember: teamMembers) {
            teamMember.join();
        }

        return results.get(results.size() - 1);
    }

    public static void main(String[] args) throws Exception {

        Matrix a = new Matrix(3, 3, 1, 5);
        a.setRow(0, Arrays.asList(1, 2, 3));
        a.setRow(1, Arrays.asList(4, 5, 6));
        a.setRow(2, Arrays.asList(7, 8, 9));

        Matrix b = new Matrix(3, 3, 3, 6);
        b.setRow(0, Arrays.asList(0, 7, 4));
        b.setRow(1, Arrays.asList(6, 0, 5));
        b.setRow(2, Arrays.asList(7, 4, 7));

        Matrix c = new Matrix(3, 3, 1, 3);
        c.setRow(0, Arrays.asList(2, 1, 4));
        c.setRow(1, Arrays.asList(0, 1, 0));
        c.setRow(2, Arrays.asList(3, 1, 1));


        float start =  System.nanoTime() / 1000000;
        Matrix result = matrixMultiply(Arrays.asList(a, b, c), 8);
        float end = System.nanoTime() / 1000000;

        System.out.println(end - start);

        System.out.println(a);
        System.out.println(b);
        System.out.println(c);
        System.out.println(result);
    }
}
