package Model.Statements;

import Model.ProgramState;

public interface IStatement {

     ProgramState exec(ProgramState state);
     String toString();

}
