package Model;

import Model.Containers.*;
import Model.Statements.IStmt;
import Util.Pair;

import java.io.BufferedReader;
import java.io.Reader;

public class PrgState {
    private MyIStack<IStmt> exeStack = new MyStack<>();
    private MyIDictionary<String, Integer> symLink = new MyDictionary<>();
    private MyIFileTable<Pair<String, BufferedReader>> fileTable = new MyFileTable<>();

    private String output = "";

    public MyIStack<IStmt> getExeStack() {
        return exeStack;
    }

    public MyIDictionary<String, Integer> getSymLink() {
        return symLink;
    }

    public MyIFileTable<Pair<String, BufferedReader>> getFileTable() {
        return fileTable;
    }

    public String getOutput() {
        return output;
    }

    public void setOutput(String output) {
        this.output = output;
    }

    public String toString(){
        return "exe stack: " + exeStack.toString() + "\nsymLink:" + symLink.toString() + "\noutput:" + output;
    }

    public void appendOutput(String s){
        this.output = this.output + s;
    }
}
