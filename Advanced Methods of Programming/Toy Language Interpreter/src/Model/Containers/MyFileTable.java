package Model.Containers;

import Util.Pair;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

public class MyFileTable<V> implements MyIFileTable<V> {
    private int cnt;
    private Map<Integer, V> dict;

    public MyFileTable(){
        cnt = 0;
        dict = new HashMap<>();
    }

    @Override
    public int put(V value) {
        dict.put(cnt, value);
        return cnt++;
    }

    @Override
    public V get(int key) {
        return dict.get(key);
    }

    @Override
    public void remove(int key) {
        dict.remove(key);
    }

    public String toString(){
        StringBuilder str = new StringBuilder();
        for( Integer k : dict.keySet() ){
            str.append("\t")
                    .append(k.toString())
                    .append("-->")
                    .append(dict.get(k).toString())
                    .append("\n");
        }
        return str.toString();
    }
}
