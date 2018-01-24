package Model.Statements.Synchronization;

import Model.ProgramState;
import Model.Statements.IStatement;
import Util.Pair;

import java.util.List;

public class Await implements IStatement{

    private static java.util.concurrent.locks.Lock lock = new java.util.concurrent.locks.ReentrantLock();
    private String var;

    public Await(String var){
        this.var = var;
    }

    @Override
    public ProgramState exec(ProgramState state) {
        lock.lock();

        try{
            int index = state.getSymTable().get(var);
            Pair<List<Integer>, Integer> barrier = state.getBarrierTable().get(index);
            List<Integer> threadsWaiting = barrier.getFirst();
            Integer barrierThreshold = barrier.getSecond();

            if (threadsWaiting.size() < barrierThreshold){
                if (!threadsWaiting.contains(state.getID())){
                    threadsWaiting.add(state.getID());
                    state.getBarrierTable().put(index, new Pair<>(threadsWaiting, barrierThreshold));
                }
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
        return "await(" + var + ")";
    }
}
