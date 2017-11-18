package Model.Expressions.Boolean;

import Model.Expressions.IExpression;
import Model.ProgramState;

public class Greater implements IExpression {
    private IExpression exp1;
    private IExpression exp2;

    public Greater(IExpression exp1, IExpression exp2){
        this.exp1 = exp1;
        this.exp2 = exp2;
    }

    @Override
    public int eval(ProgramState state) {
        boolean result = exp1.eval(state) > exp2.eval(state);
        if (result){
            return 1;
        }
        return 0;
    }

    @Override
    public String toString(){
        return "(" + exp1.toString() + " > " + exp2.toString() + ")";
    }
}
