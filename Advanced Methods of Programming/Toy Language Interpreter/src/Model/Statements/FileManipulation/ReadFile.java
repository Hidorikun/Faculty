package Model.Statements.FileManipulation;

import Model.Expressions.IExpression;
import Model.ProgramState;
import Model.Statements.IStatement;

import java.io.BufferedReader;
import java.io.IOException;

public class ReadFile implements IStatement {
    private IExpression expFile;
    private String varName;

    public ReadFile(IExpression expFile, String varName){
        this.expFile = expFile;
        this.varName = varName;
    }

    @Override
    public ProgramState exec(ProgramState state) {
        int fileID = expFile.eval(state);
        BufferedReader w = state.getFileTable().get(fileID).getSecond();

        String line;
        try{
            line = w.readLine();
        } catch (IOException e) {
            throw new RuntimeException("Error while reading file" + e.getMessage());
        }

        int value = 0;
        if (line != null){
            value = Integer.valueOf(line);
        }

        state.getSymTable().put(varName, value);
        return null;
    }

    @Override
    public String toString() {
        return "readFile(\"" + expFile.toString() + "\", \"" + varName + ")";
    }
}
