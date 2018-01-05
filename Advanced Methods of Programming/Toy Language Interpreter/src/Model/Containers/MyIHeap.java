package Model.Containers;

import java.util.Map;
import java.util.Set;

public interface MyIHeap<V> {
    int put(V value);
    int put(int key, V value);
    V get(int key);
    void remove(int key);

    boolean containsKey(int key);
    boolean containsValue(V value);
    void setContent(Map<Integer, V> content);
    Map<Integer, V> getContent();

    Set<Integer> keySet();
    String toString();
}
