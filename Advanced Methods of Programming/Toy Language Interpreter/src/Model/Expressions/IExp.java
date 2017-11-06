package Model.Expressions;

import Model.PrgState;

public interface IExp {
    int exec(PrgState state);
    String toString();
}
