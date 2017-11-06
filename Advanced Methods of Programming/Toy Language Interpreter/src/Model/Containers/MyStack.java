package Model.Containers;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Stack;

public class MyStack<T> implements MyIStack<T> {

    private Stack<T> stack = new Stack<T>();

    public MyStack(){
    }

    @Override
    public boolean empty() {
        return this.stack.empty();
    }

    @Override
    public T peek() {
        return this.stack.peek();
    }

    @Override
    public T pop() {
        return this.stack.pop();
    }

    @Override
    public T push(T item) {
        return this.stack.push(item);
    }

    @Override
    public int search(Object o) {
        return this.stack.search(o);
    }

    @Override
    public String toString() {
        StringBuilder result = new StringBuilder();
        Stack<T> aux = (Stack<T>) stack.clone();

        while(!aux.empty()){
            result.append(aux.pop().toString())
                    .append("\n");
        }

        return result.toString();
    }
}
