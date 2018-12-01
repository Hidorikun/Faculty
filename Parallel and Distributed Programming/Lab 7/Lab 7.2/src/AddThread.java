import java.math.BigInteger;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;

public class AddThread implements Runnable {
    private ArrayBlockingQueue<BigInteger> queueIN = null;
    private ArrayBlockingQueue<BigInteger> queueOUT = null;
    private BigInteger number;
    private BigInteger secondNumber = null;
    private BigInteger digitPos = BigInteger.ONE;
    private BigInteger remainder = BigInteger.ZERO;
    private String name;

    public AddThread(String name, BigInteger number, BigInteger secondNumber, ArrayBlockingQueue<BigInteger> queueOUT) {
        this.queueOUT = queueOUT;
        this.number = number;
        this.secondNumber = secondNumber;
        this.name = name;
    }

    public AddThread(String name, BigInteger number ,ArrayBlockingQueue<BigInteger> queueIN, ArrayBlockingQueue<BigInteger> queueOUT) {
        this.queueIN = queueIN;
        this.queueOUT = queueOUT;
        this.number = number;
        this.name = name;
    }

    void normalCode() throws InterruptedException {

        BigInteger digit = this.queueIN.poll(5, TimeUnit.SECONDS);

//        System.out.println(name + " got " + digit);


        while (digit.compareTo(new BigInteger("-1")) != 0) {
            this.digitPos = this.digitPos.multiply(BigInteger.TEN);

            BigInteger sum = digit
                    .add(this.number.mod(this.digitPos).divide(this.digitPos.divide(BigInteger.TEN)))
                    .add(this.remainder);

            if (sum.compareTo(BigInteger.TEN) >= 0) {
                remainder = sum.divide(BigInteger.TEN);
                sum = sum.mod(BigInteger.TEN);
            } else {
                remainder = BigInteger.ZERO;
            }
//            System.out.println(name + " --> " + sum);
            queueOUT.offer(sum);

            digit = this.queueIN.poll(5, TimeUnit.SECONDS);
//            System.out.println(name + " got " + digit);
        }

        while (this.digitPos.compareTo(this.number) <= 0 || this.remainder.compareTo(BigInteger.ZERO) != 0){
            if (this.digitPos.compareTo(this.number) <= 0) {
                this.digitPos = this.digitPos.multiply(BigInteger.TEN);

                BigInteger sum = digit
                        .add(this.number.mod(this.digitPos).divide(this.digitPos.divide(BigInteger.TEN)))
                        .add(this.remainder);

                if (sum.compareTo(BigInteger.TEN) >= 0) {
                    remainder = sum.divide(BigInteger.TEN);
                    sum = sum.mod(BigInteger.TEN);
                } else {
                    remainder = BigInteger.ZERO;
                }
//                System.out.println(name + " --> " + sum);
                queueOUT.offer(sum);

            } else {
//                System.out.println(name + " --> " + remainder);
                queueOUT.offer(this.remainder);
                this.remainder = BigInteger.ZERO;
            }

        }

//        System.out.println(name + " --> " + "-1");
        queueOUT.offer(new BigInteger("-1"));


    }

    void leafCode() {
        while (this.number.compareTo(BigInteger.ZERO) != 0 && this.secondNumber.compareTo(BigInteger.ZERO) != 0) {

            BigInteger sum = this.number.mod(BigInteger.TEN)
                    .add(this.secondNumber.mod(BigInteger.TEN))
                    .add(this.remainder);
//
//            getDigitAndRemainderFromSum(sum);
            if (sum.compareTo(BigInteger.TEN) >= 0) {
                remainder = sum.divide(BigInteger.TEN);
                sum = sum.mod(BigInteger.TEN);
            } else {
                remainder = BigInteger.ZERO;
            }

            queueOUT.offer(sum);

            this.number = this.number.divide(BigInteger.TEN);
            this.secondNumber = this.secondNumber.divide(BigInteger.TEN);
        }

        while (this.number.compareTo(BigInteger.ZERO) != 0){
            BigInteger sum = this.number.mod(BigInteger.TEN)
                    .add(this.remainder);

            if (sum.compareTo(BigInteger.TEN) >= 0) {
                remainder = sum.divide(BigInteger.TEN);
                sum = sum.mod(BigInteger.TEN);
            } else {
                remainder = BigInteger.ZERO;
            }

//            System.out.println(name + " --> " + sum);
            queueOUT.offer(sum);
        }

        while (this.number.compareTo(BigInteger.ZERO) != 0){
            BigInteger sum = this.secondNumber.mod(BigInteger.TEN)
                    .add(this.remainder);

            if (sum.compareTo(BigInteger.TEN) >= 0) {
                remainder = sum.divide(BigInteger.TEN);
                sum = sum.mod(BigInteger.TEN);
            } else {
                remainder = BigInteger.ZERO;
            }

//            System.out.println(name + " --> " + sum);
            queueOUT.offer(sum);
        }

        if (this.remainder.compareTo(BigInteger.ZERO) != 0) {
//            System.out.println(name + " --> " + remainder);
            queueOUT.offer(this.remainder);
        }
//        System.out.println(name + " --> " + "-1");
        queueOUT.offer(new BigInteger("-1"));
    }

    @Override
    public void run() {
        if (queueIN != null) {
            try {
                normalCode();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }else {
            leafCode();
        }
    }

    void getDigitAndRemainderFromSum(BigInteger sum) {

    }
}
