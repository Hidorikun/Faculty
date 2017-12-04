package Model.Containers;

import java.util.Map;

public interface MyIDictionary<K, V> {
    boolean containsKey(K key);
    boolean containsValue(V value);

    V get(K key);
    V put(K key, V value);

    Map<K, V> getContent();
    void setContent(Map<K, V> content);

    MyIDictionary copy();
    String toString();
}

