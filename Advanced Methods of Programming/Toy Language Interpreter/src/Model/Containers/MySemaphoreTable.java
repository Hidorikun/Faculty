package Model.Containers;

import Util.Pair;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class MySemaphoreTable implements MyISemaphoreTable {

    private Map<Integer, Pair<List<Integer>, Integer>> content;
    private int id;

    public MySemaphoreTable(){
        content = new HashMap<>();
        id = 0;
    }

    @Override
    public int put(Pair<List<Integer>, Integer> value) {
        content.put(++id, value);
        return id;
    }

    @Override
    public void put(int key, Pair<List<Integer>, Integer> value) {
        content.put(key, value);
    }

    @Override
    public Pair<List<Integer>, Integer> get(int key) {
        return content.get(key);
    }

    @Override
    public Set<Integer> keySet() {
        return content.keySet();
    }
}
