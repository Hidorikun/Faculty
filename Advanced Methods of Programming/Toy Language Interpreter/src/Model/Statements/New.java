package Model.Statements;

import Model.Expressions.IExpression;
import Model.ProgramState;

public class New implements IStatement {
    private String varName;
    private IExpression expression;

    public New(String varName, IExpression expression){
        this.varName = varName;
        this.expression = expression;
    }

    @Override
    public ProgramState exec(ProgramState state) {
        int memLocation = state.getHeap().put(expression.eval(state));
        state.getSymTable().put(varName, memLocation);
        return state;
    }

    @Override
    public String toString(){
        return "new(" + varName + ", " + expression.toString() + ")";

    }
}
