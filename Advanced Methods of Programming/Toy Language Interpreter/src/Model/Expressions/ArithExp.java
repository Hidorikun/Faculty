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
    public int exec(PrgState state) {
        switch (operation) {
            case "+" : return first.exec(state) + second.exec(state);
            case "-" : return first.exec(state) - second.exec(state);
            case "*" : return first.exec(state) * second.exec(state);
            case "/" : return first.exec(state) / second.exec(state);
            default: return -2;
        }
    }

    public String toString(){
        return first.toString() + operation + second.toString();
    }
}
