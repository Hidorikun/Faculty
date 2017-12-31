
namespace ToyLanguageInterpreter.Src.Model.Statements
{
    interface IStatement
    {
        ProgramState Exec(ProgramState state);
        string ToString(); 
    }
}
