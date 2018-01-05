package Model.Containers;

import java.util.List;
import java.util.Stack;

public interface MyIStack<T>{

    boolean empty();
    T peek();
    T pop();
    T push(T item);
    int search(Object o);
    List<T> values();
    String toString();
}
