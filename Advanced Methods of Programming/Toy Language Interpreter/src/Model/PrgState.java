package Model;

import Model.Containers.*;
import Model.Statements.IStmt;
import Util.Pair;

import java.io.BufferedReader;
import java.io.Reader;

public class PrgState {
    private MyIStack<IStmt> exeStack;
    private MyIDictionary<String, Integer> symLink;
    private MyIFileTable<Pair<String, BufferedReader>> fileTable;
    private MyIHeap<Integer> heap;
    private String output;

    public PrgState(){
        exeStack  = new MyStack<>();
        symLink   = new MyDictionary<>();
        fileTable = new MyFileTable<>();
        heap      = new MyHeap<>();
        output    = "";
    }

    public MyIHeap<Integer> getHeap() {
        return heap;
    }

    public MyIStack<IStmt> getExeStack() {
        return exeStack;
    }

    public MyIDictionary<String, Integer> getSymLink() {
        return symLink;
    }

    public MyIFileTable<Pair<String, BufferedReader>> getFileTable() {
        return fileTable;
    }

    String getOutput() {
        return output;
    }

    public String toString(){
        return "ExeStack:\n" + exeStack.toString() +
                "SymLink:\n" + symLink.toString() +
                "FileTable:\n" + fileTable.toString() +
                "Heap:\n" + heap.toString() +
                "Output:\n" + output;
    }

    public void appendOutput(String s){
        this.output = this.output + s;
    }
}
