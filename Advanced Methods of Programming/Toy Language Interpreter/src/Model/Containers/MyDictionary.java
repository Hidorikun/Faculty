package Model.Containers;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MyDictionary<K, V> implements MyIDictionary<K, V> {

    private Map<K, V> content;

    public MyDictionary(){
        content = new HashMap<>();
    }

    @Override
    public boolean containsKey(K key) {
        return this.content.containsKey(key);
    }

    @Override
    public boolean containsValue(V value) {
        return this.content.containsValue(value);
    }

    @Override
    public V get(K key) {
        return this.content.get(key);
    }

    @Override
    public V put(K key, V value) {
        return this.content.put(key, value);
    }

    @Override
    public Map<K, V> getContent() {
        return content;
    }

    @Override
    public void setContent(Map<K, V> content){
        this.content = content;
    }

    @Override
    public Set<K> keySet() {
        return content.keySet();
    }

    public String toString(){
        StringBuilder result = new StringBuilder();
        for( K key  : content.keySet() ){
            result.append("\t")
                    .append(key.toString())
                    .append("-->")
                    .append(content.get(key))
                    .append("\n");
        }
        return result.toString();
    }

    @Override
    public MyDictionary copy(){
        MyDictionary newDictionary = new MyDictionary();
        newDictionary.setContent(this.getContent());
        return newDictionary;
    }
}
