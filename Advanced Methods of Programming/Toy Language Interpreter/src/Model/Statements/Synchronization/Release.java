package Model.Statements.Synchronization;

import Model.ProgramState;
import Model.Statements.IStatement;
import Util.Pair;

import java.util.List;
import java.util.stream.Collectors;

public class Release implements IStatement{

    private static java.util.concurrent.locks.Lock lock = new java.util.concurrent.locks.ReentrantLock();
    private String var;

    public Release(String var){
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

            if (threadsRunning.contains(state.getID())){
                threadsRunning = threadsRunning.stream().filter(id -> id != state.getID()).collect(Collectors.toList());
                state.getSemaphoreTable().put(index, new Pair<>(threadsRunning, semaphoreThreshold));
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
        return "release(" + var + ")";
    }
}
