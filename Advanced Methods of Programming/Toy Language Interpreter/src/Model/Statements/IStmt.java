package Model.Statements;

import Model.PrgState;

public interface IStmt {

     PrgState exec(PrgState state);
     String toString();

}
