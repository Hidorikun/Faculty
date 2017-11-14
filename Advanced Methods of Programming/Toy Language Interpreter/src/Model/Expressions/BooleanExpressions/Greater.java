package Model.Expressions.BooleanExpressions;

import Model.Expressions.IExp;
import Model.PrgState;

public class Greater implements IExp{
    private IExp exp1;
    private IExp exp2;

    public Greater(IExp exp1, IExp exp2){
        this.exp1 = exp1;
        this.exp2 = exp2;
    }

    @Override
    public int eval(PrgState state) {
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
