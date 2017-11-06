package Model;

import Model.Exceptions.ProgramCompletedException;
import Model.Statements.IStmt;

public class ToyProgram {
    private PrgState state;
    private IStmt statement;

    public ToyProgram(IStmt statement){
        this.statement = statement;
        this.state = new PrgState();
        state.getExeStack().push(statement);
    }

    public PrgState getState(){
        return state;
    };

    public String toString(){
        return statement.toString();
    }

    public String getOutput(){
        return state.getOutput();
    }

}
