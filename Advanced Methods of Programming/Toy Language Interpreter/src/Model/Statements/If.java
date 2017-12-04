package Model.Statements;

import Model.Expressions.IExpression;
import Model.ProgramState;

public class If implements IStatement {
    private IExpression exp;
    private IStatement thenS;
    private IStatement elseS;

    public If(IExpression e, IStatement t){
        exp = e;
        thenS = t;
        elseS = null;
    }
    public If(IExpression e, IStatement t, IStatement el){
        exp = e;
        thenS = t;
        elseS = el;
    }

    @Override
    public ProgramState exec(ProgramState state){
        if (exp.eval(state) > 0){
            return thenS.exec(state);
        }
        if (elseS == null){
            return null;
        }
        return elseS.exec(state);
    }

    @Override
    public String toString() {
        return "IF(" + exp.toString() + ") THEN (" + thenS.toString() + " ) ELSE (" + elseS.toString() + ")";
    }

}
