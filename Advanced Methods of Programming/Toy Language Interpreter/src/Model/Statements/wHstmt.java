package Model.Statements;

import Model.Expressions.IExp;
import Model.PrgState;

public class wHstmt implements IStmt {
    private String varName;
    private IExp expression;

    public wHstmt(String varName, IExp expression){
        this.varName = varName;
        this.expression = expression;
    }

    @Override
    public PrgState exec(PrgState state) {
        int memLocation = state.getSymLink().get(varName);
        state.getHeap().put(memLocation, expression.eval(state));
        return state;
    }

    @Override
    public String toString(){
        return "wH(" + varName  + "," + expression.toString() + ")";
    }
}
