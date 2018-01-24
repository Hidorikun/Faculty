package Model.Statements.Synchronization;

import Model.Expressions.IExpression;
import Model.ProgramState;
import Model.Statements.IStatement;
import Util.Pair;

import java.util.ArrayList;

public class NewBarrier implements IStatement {

    private static java.util.concurrent.locks.Lock lock = new java.util.concurrent.locks.ReentrantLock();
    private String var;
    private IExpression exp;

    public NewBarrier(String var, IExpression exp){
        this.var = var;
        this.exp = exp;
    }

    @Override
    public ProgramState exec(ProgramState state) {
        lock.lock();
        int index = state.getBarrierTable().put(new Pair<>(new ArrayList<>(), exp.eval(state)));
        state.getSymTable().put(var, index);
        lock.unlock();
        return null;
    }

    @Override
    public String toString() {
        return "newBarrier(" + var + ", " + exp.toString() + ")";
    }
}
