package Model.Expressions;

import Model.ProgramState;

public class ReadHeap implements IExpression {
    private String varName;

    public ReadHeap(String varName){
        this.varName = varName;
    }

    @Override
    public int eval(ProgramState state) {
        int memLocation = state.getSymTable().get(varName);
        return state.getHeap().get(memLocation);
    }

    @Override
    public String toString(){
        return "rH(" + varName + ")";
    }
}
