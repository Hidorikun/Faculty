using ToyLanguageInterpreter.Src.Model.Expressions;

namespace ToyLanguageInterpreter.Src.Model.Statements
{
    class Assignment : IStatement
    {
        private string var;
        private IExpression exp;

        public Assignment(string var, IExpression exp)
        {
            this.var = var;
            this.exp = exp;
        }

        public ProgramState Exec(ProgramState state)
        {
            int value = exp.Eval(state);
            state.SymTable.Put(var, value);
            return null;
        }

        public override string ToString()
        {
            return var + "=" + exp.ToString(); 
        }
    }
}
