package Model.Statements.FileManipulation;

import Model.Expressions.IExpression;
import Model.ProgramState;
import Model.Statements.IStatement;

import java.io.BufferedReader;
import java.io.IOException;

public class CloseFile implements IStatement {
    private IExpression expFile;

    public CloseFile(IExpression expFile){
        this.expFile = expFile;
    }

    @Override
    public ProgramState exec(ProgramState state) {
        int fileId = expFile.eval(state);
        BufferedReader r = state.getFileTable().get(fileId).getSecond();
        try{
            r.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        state.getFileTable().remove(fileId);

        return null;
    }

    @Override
    public String toString() {
        return "closeFile(\"" + expFile.toString() + "\")";
    }
}
