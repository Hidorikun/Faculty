package Model.Statements;

import Model.Containers.MyIStack;
import Model.ProgramState;

public class Composite implements IStatement {
    private IStatement first;
    private IStatement second;

    public Composite(IStatement first, IStatement second){
        this.first = first;
        this.second = second;
    }

    @Override
    public ProgramState exec(ProgramState state) {
        MyIStack<IStatement> stk = state.getExeStack();
        stk.push(second);
        stk.push(first);
        return null;
    }

    @Override
    public String toString() {
        return first.toString() + ";\n" + second.toString();
    }
}
