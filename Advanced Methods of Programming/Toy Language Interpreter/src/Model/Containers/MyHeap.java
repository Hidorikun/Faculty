package Model.Containers;

import java.util.HashMap;
import java.util.Map;

public class MyHeap<V> implements MyIHeap<V>{
    private Map<Integer, V> heap;

    private int nextFreePosition;

    public MyHeap(){
        heap = new HashMap<>();
        nextFreePosition = 1;
    }

    private void getNextFreePosition(){
        while(heap.containsKey(nextFreePosition)){
            nextFreePosition++;
        }
    }

    @Override
    public int put(V value) {
        Integer index = nextFreePosition;
        heap.put(index, value);
        getNextFreePosition();
        return index;
    }

    @Override
    public int put(int key, V value) {
        heap.put(key, value);
        return key;
    }

    @Override
    public V get(int key) {
        return heap.get(key);
    }

    @Override
    public void remove(int key) {
        heap.remove(key);
    }

    @Override
    public boolean containsKey(int key) {
        return heap.containsKey(key);
    }

    @Override
    public boolean containsValue(V value) {
        return heap.containsValue(value);
    }

    @Override
    public void setContent(Map<Integer, V> content) {
        this.heap = content;
    }

    @Override
    public Map<Integer, V> getContent() {
        return heap;
    }


    @Override
    public String toString(){
        StringBuilder builder = new StringBuilder();
        for( int key : heap.keySet()){
            builder.append("   " + String.valueOf(key) + "->" + String.valueOf(heap.get(key)) + "\n");
        }
        return builder.toString();
    }
}
