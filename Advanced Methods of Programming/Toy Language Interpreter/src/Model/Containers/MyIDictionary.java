package Model.Containers;

public interface MyIDictionary<K, V> {
    boolean containsKey(Object key);
    boolean containsValue(Object value);
    V get(Object key);
    V put(K key, V value);

    String toString();
}

