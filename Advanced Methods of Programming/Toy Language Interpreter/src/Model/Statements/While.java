package Model.Statements;

import Model.Expressions.IExpression;
import Model.ProgramState;

public class While implements IStatement {
   private IExpression exp;
   private IStatement stmt;

   public While(IExpression exp, IStatement stmt){
       this.exp = exp;
       this.stmt = stmt;
   }

    @Override
    public ProgramState exec(ProgramState state) {
        if ( exp.eval(state) == 0){
            return state;
        }

        state.getExeStack().push(this);
        state.getExeStack().push(stmt);

        return state;
    }

    @Override
    public String toString(){
       return "while( " + exp.toString() + "){ " + stmt.toString() + "}";
    }
}
