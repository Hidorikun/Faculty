package Model.Statements.Synchronization;

import Model.ProgramState;
import Model.Statements.IStatement;

public class NewLock implements IStatement {

    private static java.util.concurrent.locks.Lock lock = new java.util.concurrent.locks.ReentrantLock();
    private String var;

    public NewLock(String var){
        this.var = var;
    }

    @Override
    public ProgramState exec(ProgramState state) {
        lock.lock();
        System.out.println(String.valueOf(state.getID()) + "-atomicLcckCreationStart");
        int lockID = state.getLockTable().put(-1);
        state.getSymTable().put(var, lockID);
        lock.unlock();
        System.out.println(String.valueOf(state.getID()) + "-atomicLcckCreationEnd");
        return null;
    }

    @Override
    public String toString() {
        return "newLock(" + "\"" + var + "\"" + ")";
    }
}
