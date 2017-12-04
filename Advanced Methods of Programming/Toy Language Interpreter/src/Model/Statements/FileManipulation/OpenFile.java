package Model.Statements.FileManipulation;

import Model.ProgramState;
import Model.Statements.IStatement;
import Util.Pair;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;

public class OpenFile implements IStatement {
    private String varName;
    private String fileName;
    private BufferedReader bufferedFileReader;

    public OpenFile(String varName, String fileName) throws FileNotFoundException{
        this.varName = varName;
        this.fileName = fileName;

        bufferedFileReader = new BufferedReader(new FileReader(fileName));
    }

    @Override
    public ProgramState exec(ProgramState state) {
        int fileId = state.getFileTable().put(new Pair<>(fileName, bufferedFileReader));
        state.getSymTable().put(varName, fileId);

        return null;
    }

    @Override
    public String toString() {
        return "openRFile(" + varName + ", \"" + fileName + "\")";
    }
}
