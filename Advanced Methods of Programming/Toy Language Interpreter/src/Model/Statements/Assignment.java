package Model.Statements;

import Model.Expressions.IExpression;
import Model.ProgramState;

public class Assignment implements IStatement {
    private String var;
    private IExpression exp;

    public Assignment(String var, IExpression exp){
        this.var = var;
        this.exp = exp;
    }

    @Override
    public String toString() {
        return var + "=" + exp.toString();
    }

    @Override
    public ProgramState exec(ProgramState state) {
        int value = exp.eval(state);
        state.getSymTable().put(var, value);
        return state;
    }
}
