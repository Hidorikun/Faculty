package Model.Containers;

import java.util.Map;
import java.util.Set;

public interface MyIDictionary<K, V> {
    boolean containsKey(K key);
    boolean containsValue(V value);

    V get(K key);
    V put(K key, V value);

    Map<K, V> getContent();
    void setContent(Map<K, V> content);

    Set<K> keySet();
    MyIDictionary copy();
    String toString();
}

