package Model.Statements.Synchronization;

import Model.ProgramState;
import Model.Statements.IStatement;

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
        newPrgState.setOutputBuffer(state.getOutputBuffer());
        newPrgState.setSymTable(state.getSymTable().copy());
        newPrgState.setLockTable(state.getLockTable());

        return newPrgState;
    }

    @Override
    public String toString(){
        return "fork( " + statement.toString() + " ~)";
    }
}
