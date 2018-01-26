package Model.Expressions;
import Model.ProgramState;

public class TernaryIf implements IExpression {
    private IExpression exp;
    private IExpression thenS;
    private IExpression elseS;


    public TernaryIf(IExpression e, IExpression t, IExpression el){
        exp = e;
        thenS = t;
        elseS = el;
    }

    @Override
    public int eval(ProgramState state){
        if (exp.eval(state) > 0){
            return thenS.eval(state);
        }
        return elseS.eval(state);
    }

    @Override
    public String toString() {
        return "(" + exp.toString() + ")?(" + thenS.toString() + "):(" + elseS.toString() + ")";
    }

}
