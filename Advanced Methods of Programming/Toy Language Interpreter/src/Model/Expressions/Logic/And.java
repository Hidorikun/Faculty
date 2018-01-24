package Model.Expressions.Logic;

import Model.Expressions.IExpression;
import Model.ProgramState;

public class And implements IExpression {

    private IExpression exp1;
    private IExpression exp2;

    public And(IExpression exp1, IExpression exp2){
        this.exp1 = exp1;
        this.exp2 = exp2;
    }

    @Override
    public int eval(ProgramState state) {
        if (exp1.eval(state) == 1 && exp2.eval(state) == 1)
            return 1;
        return 0;
    }

    @Override
    public String toString() {
        return "(" + exp1.toString() + " and " + exp2.toString() + ")";
    }
}
