package Model.Statements;

import Model.ProgramState;

public class Fork implements IStatement {
    private IStatement statement;

    public Fork(IStatement statement){
        this.statement = statement;
    }

    @Override
    public ProgramState exec(ProgramState state) {
        ProgramState newPrgState = new ProgramState();
        newPrgState.setExeStack(statement);
        newPrgState.setFileTable(state.getFileTable());
        newPrgState.setHeap(state.getHeap());
        newPrgState.setOutput(state.getOutput());
        newPrgState.setSymTable(state.getSymTable().copy());

        return newPrgState;
    }

    @Override
    public String toString(){
        return "fork( " + statement.toString() + " )";
    }
}
