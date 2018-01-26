package Model.Statements.Synchronization;

import Model.ProgramState;
import Model.Statements.IStatement;
import Util.Pair;

import java.util.List;

public class Acquire implements IStatement{

    private static java.util.concurrent.locks.Lock lock = new java.util.concurrent.locks.ReentrantLock();
    private String var;

    public Acquire(String var){
        this.var = var;
    }

    @Override
    public ProgramState exec(ProgramState state) {
        lock.lock();

        try{
            int index = state.getSymTable().get(var);
            Pair<List<Integer>, Integer> semaphore = state.getSemaphoreTable().get(index);
            List<Integer> threadsRunning = semaphore.getFirst();
            Integer semaphoreThreshold = semaphore.getSecond();

            if (threadsRunning.size() < semaphoreThreshold){
                if (!threadsRunning.contains(state.getID())){
                    threadsRunning.add(state.getID());
                    state.getSemaphoreTable().put(index, new Pair<>(threadsRunning, semaphoreThreshold));
                }
            }else{
                state.getExeStack().push(this);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            lock.unlock();
        }

        return null;
    }

    @Override
    public String toString() {
        return "acquire(" + var + ")";
    }
}
