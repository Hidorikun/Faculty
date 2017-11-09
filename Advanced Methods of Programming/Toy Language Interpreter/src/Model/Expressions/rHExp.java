package Model.Expressions;

import Model.PrgState;

public class rHExp implements IExp {
    private String varName;

    public rHExp(String varName){
        this.varName = varName;
    }

    @Override
    public int eval(PrgState state) {
        int memLocation = state.getSymLink().get(varName);
        return state.getHeap().get(memLocation);
    }

    @Override
    public String toString(){
        return "rH(" + varName + ")";
    }
}
