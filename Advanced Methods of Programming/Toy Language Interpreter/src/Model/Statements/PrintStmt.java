package Model.Statements;

import Model.Expressions.IExp;
import Model.PrgState;

public class PrintStmt implements IStmt {
    private IExp exp;

    public PrintStmt(IExp exp){
        this.exp = exp;
    }

    @Override
    public String toString() {
        return "print(" + exp.toString() + ")";
    }

    public PrgState exec(PrgState state){
        state.appendOutput(exp.exec(state) + "\n");
        return state;
    }
}
