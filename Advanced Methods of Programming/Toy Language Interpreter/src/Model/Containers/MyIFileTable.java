package Model.Containers;

import Util.Pair;

import java.io.Reader;
import java.util.Set;
import java.util.stream.Stream;

public interface MyIFileTable<V> {
    int put(V value);
    V get(int key);
    void remove(int key);
    String toString();
    Stream stream();

    Set<Integer> keySet();
}
