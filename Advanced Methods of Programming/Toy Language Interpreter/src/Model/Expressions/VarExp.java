package Model.Expressions;

import Model.PrgState;

public class VarExp implements IExp {

    private String id;

    public VarExp(String id){
        this.id = id;
    }

    @Override
    public int exec(PrgState state) {
        return state.getSymLink().get(id);
    }

    @Override
    public String toString() {
        return id;
    }
}
