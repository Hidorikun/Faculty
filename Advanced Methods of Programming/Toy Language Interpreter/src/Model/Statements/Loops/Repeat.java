package Model.Statements.Loops;

import Model.Expressions.Boolean.NotEqual;
import Model.Expressions.IExpression;
import Model.Expressions.Logic.Not;
import Model.ProgramState;
import Model.Statements.Composite;
import Model.Statements.IStatement;


public class Repeat implements IStatement {
    private IStatement stmt;
    private IExpression exp;

    public Repeat(IStatement stmt, IExpression exp){
        this.stmt = stmt;
        this.exp = exp;
    }

    @Override
    public ProgramState exec(ProgramState state) {

        IStatement newWhile = new While(
                new Not(exp),
                stmt
        );

        state.getExeStack().push(newWhile);
        state.getExeStack().push(stmt);
        return null;
    }

    @Override
    public String toString(){
        return "repeat {" + stmt.toString() + "} until( " + exp.toString() + ")";
    }
}
