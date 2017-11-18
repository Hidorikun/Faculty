package Model;

import Model.Statements.IStatement;

public class ToyProgram {
    private ProgramState state;
    private IStatement statement;

    public ToyProgram(IStatement statement){
        this.statement = statement;
        this.state = new ProgramState();
        state.getExeStack().push(statement);
    }

    public ProgramState getState(){
        return state;
    }

    public String toString(){
        return statement.toString();
    }

    public String getOutput(){
        return state.getOutput();
    }

}
