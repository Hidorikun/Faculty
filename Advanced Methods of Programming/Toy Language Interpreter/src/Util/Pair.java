package Util;

public class Pair<FIRST,SECOND> {
    private FIRST first;
    private SECOND second;

    public Pair(FIRST first, SECOND second){
        this.first = first;
        this.second = second;
    }

    public FIRST getFirst() {
        return first;
    }

    public SECOND getSecond() {
        return second;
    }

    @Override
    public String toString() {
        return first + " " + second;
    }
}
