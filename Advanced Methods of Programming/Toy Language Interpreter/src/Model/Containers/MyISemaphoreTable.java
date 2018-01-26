package Model.Containers;

import Util.Pair;

import java.util.List;
import java.util.Set;

public interface MyISemaphoreTable {
    int put(Pair<List<Integer>, Integer> value);
    void put(int key, Pair<List<Integer>, Integer> value);
    Pair<List<Integer>, Integer> get(int key);
    Set<Integer> keySet();
}
