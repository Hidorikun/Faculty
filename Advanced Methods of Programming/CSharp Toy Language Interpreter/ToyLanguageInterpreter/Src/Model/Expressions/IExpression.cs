
namespace ToyLanguageInterpreter.Src.Model.Expressions
{
    interface IExpression
    {
        int Eval(ProgramState state);
        string ToString(); 
    }
}
