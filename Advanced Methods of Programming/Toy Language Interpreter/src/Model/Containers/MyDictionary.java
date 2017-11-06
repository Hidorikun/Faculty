package Model.Containers;

import java.util.HashMap;
import java.util.Map;

public class MyDictionary<K, V> implements MyIDictionary<K, V> {

    Map<K, V> dict = new HashMap<K, V>();

    @Override
    public boolean containsKey(Object key) {
        return this.dict.containsKey(key);
    }

    @Override
    public boolean containsValue(Object value) {
        return this.dict.containsValue(value);
    }

    @Override
    public V get(Object key) {
        return this.dict.get(key);
    }

    @Override
    public V put(K key, V value) {
        return this.dict.put(key, value);
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
