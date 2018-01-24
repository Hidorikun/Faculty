package Model.Expressions.Logic;

import Model.Expressions.IExpression;
import Model.ProgramState;

public class Not implements IExpression {

    private IExpression exp;

    public Not(IExpression exp){
        this.exp = exp;
    }
    @Override
    public int eval(ProgramState state) {
        if (exp.eval(state) == 1)
            return 0;
        return 1;
    }

    @Override
    public String toString(){
        return "not(" + exp.toString() + ")";
    }
}
