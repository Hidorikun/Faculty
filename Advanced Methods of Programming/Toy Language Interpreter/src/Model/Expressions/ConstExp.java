package Model.Expressions;

import Model.PrgState;

public class ConstExp implements IExp {

    private Integer value;

    public ConstExp(int value){
        this.value = value;
    }

    @Override
    public int exec(PrgState state) {
        return value;
    }

    public String toString(){
        return value.toString();
    }
}
