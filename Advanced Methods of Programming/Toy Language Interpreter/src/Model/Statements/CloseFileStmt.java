package Model.Statements;

import Model.Expressions.IExp;
import Model.PrgState;

import java.io.BufferedReader;
import java.io.IOException;

public class CloseFileStmt implements IStmt {
    private IExp expFile;

    public CloseFileStmt(IExp expFile){
        this.expFile = expFile;
    }

    @Override
    public PrgState exec(PrgState state) {
        int fileId = expFile.exec(state);
        BufferedReader r = state.getFileTable().get(fileId).getSecond();
        try{
            r.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        state.getFileTable().remove(fileId);

        return state;
    }

    @Override
    public String toString() {
        return "closeFile(\"" + expFile.toString() + "\")";
    }
}
