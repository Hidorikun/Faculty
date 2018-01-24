package Model;

import Model.Exceptions.ProgramCompletedException;
import Model.Statements.IStatement;

public class ToyProgram {
    private int id;
    private ProgramState state;
    private IStatement statement;

    public ToyProgram(IStatement statement){
        this.statement = statement;
        this.state = new ProgramState();
        state.getExeStack().push(statement);
        id = 1;
        state.setID(1);
    }

    private ToyProgram(ProgramState state){
        this.statement = state.getExeStack().peek();
        this.state = state;
    }

    public ToyProgram oneStep() throws ProgramCompletedException {
        if( this.completed() ){
            throw new ProgramCompletedException("All steps executed");
        }
        IStatement currentStatement = state.getExeStack().pop();
        ProgramState newState = currentStatement.exec(state);
        if (newState != null)
            return new ToyProgram(newState);
        return null;
    }

    public Boolean completed(){
        return state.getExeStack().empty();
    }

    public ProgramState getState(){ return state; }

    public String getOutput(){ return state.getOutput(); }

    public String toString(){ return statement.toString(); }

    public Integer getID() { return id; }

    public void setID(int id){
        this.id = id;
        this.state.setID(id);
    }
}
