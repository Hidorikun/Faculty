package Model.Statements;

import Model.Containers.MyIStack;
import Model.PrgState;

public class CompStmt implements IStmt {
    private IStmt first;
    private IStmt second;

    public CompStmt(IStmt first, IStmt second){
        this.first = first;
        this.second = second;
    }

    @Override
    public PrgState exec(PrgState state) {
        MyIStack<IStmt> stk = state.getExeStack();
        stk.push(second);
        stk.push(first);
        return state;
    }

    @Override
    public String toString() {
        return first.toString() + ";\n" + second.toString();
    }
}
