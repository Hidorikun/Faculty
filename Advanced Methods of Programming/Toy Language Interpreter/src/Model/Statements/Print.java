package Model.Statements;

import Model.Expressions.IExpression;
import Model.ProgramState;

public class Print implements IStatement {
    private IExpression exp;

    public Print(IExpression exp){
        this.exp = exp;
    }

    @Override
    public String toString() {
        return "print(" + exp.toString() + ")";
    }

    public ProgramState exec(ProgramState state){
        state.appendOutput(exp.eval(state) + "\n");
        return state;
    }
}
