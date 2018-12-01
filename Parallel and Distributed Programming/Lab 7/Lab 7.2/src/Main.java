import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;

public class Main {

    public static void main(String[] args) {
        int TEST_COUNT = 16;
        int QUEUE_CAP = 20;

        batchTesting(TEST_COUNT, QUEUE_CAP);

    }

    static void addNumbersSequential(List<BigInteger> numbers) {
        BigInteger sum = BigInteger.ZERO;
        for (BigInteger number : numbers) {
            sum = sum.add(number);
        }
    }

    static void addNumbersParallel(List<BigInteger> numbers, int queueCap){
        int N = numbers.size();

        List<ArrayBlockingQueue<BigInteger>> queues = new ArrayList<>(N - 1);

        for (int i = 0; i < N - 1; i++){
            queues.add(new ArrayBlockingQueue<BigInteger>(queueCap));
        }

        List<Thread> threads = new ArrayList<>(N - 1);

        threads.add(new Thread(new AddThread(numbers.get(0), numbers.get(1), queues.get(0))));

        for (int i = 2; i < N; i++){
            threads.add(new Thread(new AddThread(numbers.get(i), queues.get(i - 2), queues.get(i - 1))));
        }

        for (int i = 0; i < N - 1; i++){
            threads.get(i).start();
        }

        String result = "";
        BigInteger digit = new BigInteger("0");
        while (digit.compareTo(new BigInteger("-1")) != 0) {
            try {
                digit = queues.get(N - 2).poll(5, TimeUnit.SECONDS);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            if (digit.compareTo(BigInteger.ZERO) >= 0){
                result = digit + result;
            }
        }

        for (int i = 0; i < N - 1; i++){
            try {
                threads.get(i).join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    static void testParallel(int level, List<BigInteger> numbers, int queueCap) {
        long startTime = System.nanoTime();
        addNumbersParallel(numbers, queueCap);
        long endTime = System.nanoTime();
        long duration = (endTime - startTime) / 1000000;
        System.out.println("Level " + level + ": " + duration + " ms");

    }

    static void testSequential(int level, List<BigInteger> numbers) {
        long startTime = System.nanoTime();
        addNumbersSequential(numbers);
        long endTime = System.nanoTime();
        long duration = (endTime - startTime) / 1000000;
        System.out.println("Level " + level + ": " + duration + " ms");

    }

    static void batchTesting(int testCount, int queueCap) {
        List<BigInteger> numbers;

        for (int i = 1; i <= testCount; i++){
            numbers = generateNumbers(i * 10, i * 1);
            testParallel(i, numbers, queueCap);
            testSequential(i, numbers);
        }
    }

    static List<BigInteger> generateNumbers(int count, int digitSize) {
        List<BigInteger> numbers = new ArrayList<>(count);

        for (int i = 0; i < count; i++){
            numbers.add(new BigInteger(randomNumber(digitSize)));
        }

        return numbers;
    }

    static String randomNumber(int length) {
        StringBuilder result = new StringBuilder();

        Random random = new Random();

        for (int i = 0; i < length; i++) {
            result.append(random.nextInt(9) + 1);
        }

        return result.toString();
    }
}

