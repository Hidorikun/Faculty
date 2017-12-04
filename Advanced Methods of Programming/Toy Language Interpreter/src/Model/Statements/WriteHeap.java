package Model.Statements;

import Model.Expressions.IExpression;
import Model.ProgramState;

public class WriteHeap implements IStatement {
    private String varName;
    private IExpression expression;

    public WriteHeap(String varName, IExpression expression){
        this.varName = varName;
        this.expression = expression;
    }

    @Override
    public ProgramState exec(ProgramState state) {
        int memLocation = state.getSymTable().get(varName);
        state.getHeap().put(memLocation, expression.eval(state));
        return null;
    }

    @Override
    public String toString(){
        return "wH(" + varName  + "," + expression.toString() + ")";
    }
}
