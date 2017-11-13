package Model.Expressions.ArithmeticExpressions;

import Model.Expressions.IExp;
import Model.PrgState;

public class Multiplication implements IExp{
    private IExp exp1;
    private IExp exp2;

    public Multiplication(IExp exp1, IExp exp2){
        this.exp1 = exp1;
        this.exp2 = exp2;
    }

    @Override
    public int eval(PrgState state) {
        return exp1.eval(state) * exp2.eval(state);
    }

    @Override
    public String toString(){
        return "(" + exp1.toString() + " * " + exp2.toString() + ")";
    }
}
