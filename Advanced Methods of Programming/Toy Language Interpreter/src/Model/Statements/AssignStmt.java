package Model.Statements;

import Model.Expressions.IExp;
import Model.Expressions.VarExp;
import Model.PrgState;

public class AssignStmt implements IStmt {
    String var;
    IExp exp;

    public AssignStmt(String var, IExp exp){
        this.var = var;
        this.exp = exp;
    }

    @Override
    public String toString() {
        return var + "=" + exp.toString();
    }

    @Override
    public PrgState exec(PrgState state) {
        int value = exp.exec(state);
        state.getSymLink().put(var, value);
        return state;
    }
}
