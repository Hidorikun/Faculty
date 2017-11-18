package Model.Expressions.Arithmetic;

import Model.Expressions.IExpression;
import Model.ProgramState;

public class Division implements IExpression {
    private IExpression exp1;
    private IExpression exp2;

    public Division(IExpression exp1, IExpression exp2){
        this.exp1 = exp1;
        this.exp2 = exp2;
    }

    @Override
    public int eval(ProgramState state) {
        return exp1.eval(state) / exp2.eval(state);
    }

    @Override
    public String toString(){
        return "(" + exp1.toString() + " / " + exp2.toString() + ")";
    }
}
