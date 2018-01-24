package Model.Statements.Synchronization;

import Model.Expressions.Variable;
import Model.ProgramState;
import Model.Statements.IStatement;

public class Lock implements IStatement {

    private static java.util.concurrent.locks.Lock lock = new java.util.concurrent.locks.ReentrantLock();
    private String var;

    public Lock(String var){
        this.var = var;
    }

    @Override
    public ProgramState exec(ProgramState state){
        lock.lock();
        try{
            System.out.println(String.valueOf(state.getID()) + "-atomicLockingSTART");
            System.out.println(var);
            int lockID = state.getSymTable().get(var);
            System.out.println(lockID);
            System.out.println(state.getLockTable().get(lockID));
            if (state.getLockTable().get(lockID) == -1){
                state.getLockTable().put(lockID, state.getID());
            }else{
                state.getExeStack().push(this);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            lock.unlock();
            System.out.println(String.valueOf(state.getID()) + "-atomicLockingEND");
        }

        return null;

    }

    @Override
    public String toString() {
        return "lock(" + var + ")";
    }
}
