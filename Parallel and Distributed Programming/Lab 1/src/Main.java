import model.Bill;
import model.Inventory;
import model.Product;
import model.Transaction;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Inventory deposit = new Inventory();

        Product pen = new Product("pen", 5);
        Product book = new Product("book", 45);
        Product oil = new Product("oil", 13);
        Product gem = new Product("gem", 15);
        Product flour = new Product("flour", 9);
        Product sugar = new Product("sugar", 10);

        deposit.add(pen, 10);
        deposit.add(book, 4);
        deposit.add(oil, 3);
        deposit.add(gem, 6);
        deposit.add(flour, 1);
        deposit.add(sugar, 8);

        int money = 0;

        List<Bill> recordOfBills = new ArrayList<>();

        Transaction t1 = new Transaction(deposit, "t1");
        t1.add(pen, 5);
        t1.add(book, 1);

        Transaction t2 = new Transaction(deposit, "t2");
        t2.add(flour, 1);
        t2.add(sugar, 1);
        t2.add(gem, 2);

        Transaction t3 = new Transaction(deposit, "t3");
        t3.add(oil, 2);
        t3.add(book, 2);
        t3.add(pen, 5);

        List<Thread> threads = new ArrayList<>();

        threads.add(new Thread(t1));
        threads.add(new Thread(t2));
        threads.add(new Thread(t3));

        for (Thread thread : threads){
            thread.start();
        }

        for (Thread thread : threads){
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        System.out.println(deposit);
    }
}
