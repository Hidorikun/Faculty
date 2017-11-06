package Model.Containers;

import java.util.Stack;

public interface MyIStack<T>{

    boolean empty();
    T peek();
    T pop();
    T push(T item);
    int search(Object o);

    String toString();
}
