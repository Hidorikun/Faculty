package Model.Expressions;

import Model.ProgramState;

public class Variable implements IExpression {

    private String id;

    public Variable(String id){
        this.id = id;
    }

    @Override
    public int eval(ProgramState state) {
        return state.getSymTable().get(id);
    }

    @Override
    public String toString() {
        return id;
    }
}
