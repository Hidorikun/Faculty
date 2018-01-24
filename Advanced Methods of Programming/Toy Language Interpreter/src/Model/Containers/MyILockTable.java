package Model.Containers;

import java.util.Set;

public interface MyILockTable{
    int get(int key);
    int put(int value);
    void put(int key, int value);
    Set<Integer> keySet();
}
