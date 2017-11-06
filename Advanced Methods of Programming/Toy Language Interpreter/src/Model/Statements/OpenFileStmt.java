package Model.Statements;

import Model.PrgState;
import Util.Pair;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;

public class OpenFileStmt implements IStmt {
    private String varName;
    private String fileName;
    private BufferedReader bufferedFileReader;

    public OpenFileStmt(String varName, String fileName) throws FileNotFoundException{
        this.varName = varName;
        this.fileName = fileName;

        bufferedFileReader = new BufferedReader(new FileReader(fileName));
    }

    @Override
    public PrgState exec(PrgState state) {
        int fileId = state.getFileTable().put(new Pair<>(fileName, bufferedFileReader));
        state.getSymLink().put(varName, fileId);

        return state;
    }

    @Override
    public String toString() {
        return "openRFile(" + varName + ", \"" + fileName + "\")";
    }
}
