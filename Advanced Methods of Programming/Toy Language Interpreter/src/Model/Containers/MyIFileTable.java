package Model.Containers;

import Util.Pair;

import java.io.Reader;

public interface MyIFileTable<V> {
    int put(V value);
    V get(int key);
    void remove(int key);
    String toString();
}
