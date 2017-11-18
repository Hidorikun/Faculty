package Model.Expressions;

import Model.ProgramState;

public interface IExpression {
    int eval(ProgramState state);
    String toString();
}
