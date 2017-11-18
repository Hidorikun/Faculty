package Model.Expressions;

import Model.ProgramState;

public class Constant implements IExpression {

    private Integer value;

    public Constant(int value){
        this.value = value;
    }

    @Override
    public int eval(ProgramState state) {
        return value;
    }

    public String toString(){
        return value.toString();
    }
}
