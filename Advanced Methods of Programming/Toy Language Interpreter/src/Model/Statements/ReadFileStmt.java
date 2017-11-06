package Model.Statements;

import Model.Expressions.IExp;
import Model.PrgState;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.Reader;

public class ReadFileStmt implements IStmt {
    private IExp expFile;
    private String varName;

    public ReadFileStmt(IExp expFile, String varName){
        this.expFile = expFile;
        this.varName = varName;
    }

    @Override
    public PrgState exec(PrgState state) {
        int fileID = expFile.exec(state);
        BufferedReader w = state.getFileTable().get(fileID).getSecond();

        String line = null;
        try{
            line = w.readLine();
        } catch (IOException e) {
            throw new RuntimeException("error while reading file" + e.getMessage());
        }

        int value = 0;
        if (line != null){
            value = Integer.valueOf(line);
        }

        state.getSymLink().put(varName, value);
        return state;
    }

    @Override
    public String toString() {
        return "readFile(\"" + expFile.toString() + "\", \"" + varName + ")";
    }
}
