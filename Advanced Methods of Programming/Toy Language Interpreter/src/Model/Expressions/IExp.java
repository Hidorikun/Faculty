package Model.Expressions;

import Model.PrgState;

public interface IExp {
    int eval(PrgState state);
    String toString();
}
