package Model.Statements;

import Model.Expressions.IExp;
import Model.PrgState;

public class IfStmt implements IStmt{
    private IExp exp;
    private IStmt thenS;
    private IStmt elseS;

    public IfStmt(IExp e, IStmt t){
        exp = e;
        thenS = t;
        elseS = null;
    }
    public IfStmt(IExp e, IStmt t, IStmt el){
        exp = e;
        thenS = t;
        elseS = el;
    }

    @Override
    public PrgState exec(PrgState state){
        if (exp.exec(state) > 0){
            return thenS.exec(state);
        }
        if (elseS == null){
            return state;
        }
        return elseS.exec(state);
    }

    @Override
    public String toString() {
        return "IF(" + exp.toString() + ") THEN (" + thenS.toString() + " ) ELSE (" + elseS.toString() + ")";
    }

}
