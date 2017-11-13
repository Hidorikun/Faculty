package Model.Statements;

import Model.Expressions.IExp;
import Model.PrgState;

public class NewStmt implements IStmt{
    private String varName;
    private IExp expression;

    public NewStmt(String varName, IExp expression){
        this.varName = varName;
        this.expression = expression;
    }

    @Override
    public PrgState exec(PrgState state) {
        int memLocation = state.getHeap().put(expression.eval(state));
        state.getSymLink().put(varName, memLocation);
        return state;
    }

    @Override
    public String toString(){
        return "new(" + varName + ", " + expression.toString() + ")";

    }
}
