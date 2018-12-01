import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;

public class Main {

    public static void main(String[] args) {
        int N = 4;

        String result = "";

        List<BigInteger> numbers = new ArrayList<>(N);

        for (int i = 0; i < N; i++){
            numbers.add(new BigInteger(randomNumber(5)));
        }

        System.out.println("numbers = " + numbers);

        List<ArrayBlockingQueue<BigInteger>> queues = new ArrayList<>(N - 1);

        for (int i = 0; i < N - 1; i++){
            queues.add(new ArrayBlockingQueue(20));
        }

        List<Thread> threads = new ArrayList<>(N - 1);

        threads.add(new Thread(new AddThread("thread 0", numbers.get(0), numbers.get(1), queues.get(0))));

        for (int i = 2; i < N; i++){
            threads.add(new Thread(new AddThread("thread " + (i - 1),  numbers.get(i), queues.get(i - 2), queues.get(i - 1))));
        }

        for (int i = 0; i < N - 1; i++){
//            System.out.println("starting thread " + i);
            threads.get(i).start();
        }

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


        for (int i = 0; i < N - 2; i++){
            try {
                threads.get(i).join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        BigInteger sum = BigInteger.ZERO;
        for (BigInteger number : numbers) {
            sum = sum.add(number);
        }

        System.out.println("My result : " + result);
        System.out.println("Actual sum: " + sum);
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

