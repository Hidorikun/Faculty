package Model.Expressions;

import Model.PrgState;

public class ArithExp implements IExp {
    private String operation;
    private IExp first;
    private IExp second;

    public ArithExp(String operation, IExp first, IExp second){
        this.operation = operation;
        this.first = first;
        this.second = second;
    }

    @Override
    public int eval(PrgState state) {
        switch (operation) {
            case "+" : return first.eval(state) + second.eval(state);
            case "-" : return first.eval(state) - second.eval(state);
            case "*" : return first.eval(state) * second.eval(state);
            case "/" : return first.eval(state) / second.eval(state);
            default: return -2;
        }
    }

    public String toString(){
        return first.toString() + operation + second.toString();
    }
}
