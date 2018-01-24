package Model.Statements.Synchronization;

import Model.Expressions.Variable;
import Model.ProgramState;
import Model.Statements.IStatement;

public class Unlock implements IStatement {

    private static java.util.concurrent.locks.Lock lock = new java.util.concurrent.locks.ReentrantLock();
    private String var;

    public Unlock(String var){
        this.var = var;
    }

    @Override
    public ProgramState exec(ProgramState state){
        lock.lock();
        System.out.println(String.valueOf(state.getID() + "-atomicUnlockSTART " + var));
        try {
            int lockID = state.getSymTable().get(var);
            if (state.getLockTable().get(lockID) == state.getID()) {
                state.getLockTable().put(lockID, -1);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            System.out.println(String.valueOf(state.getID() + "-atomicUnlockEND " + var));
            lock.unlock();
        }
        return null;

    }

    @Override
    public String toString() {
        return "unlock(" + var + ")";
    }
}

