package Model.Containers;

import java.util.HashMap;
import java.util.Map;

public class MyDictionary<K, V> implements MyIDictionary<K, V> {

    private Map<K, V> dict;

    public MyDictionary(){
        dict = new HashMap<>();
    }
    @Override
    public boolean containsKey(K key) {
        return this.dict.containsKey(key);
    }

    @Override
    public boolean containsValue(V value) {
        return this.dict.containsValue(value);
    }

    @Override
    public V get(K key) {
        return this.dict.get(key);
    }

    @Override
    public V put(K key, V value) {
        return this.dict.put(key, value);
    }

    @Override
    public Map<K, V> getContent() {
        return dict;
    }

    public String toString(){
        StringBuilder result = new StringBuilder();
        for( K key  : dict.keySet() ){
            result.append("\t")
                    .append(key.toString())
                    .append("-->")
                    .append(dict.get(key))
                    .append("\n");
        }
        return result.toString();
    }
}
