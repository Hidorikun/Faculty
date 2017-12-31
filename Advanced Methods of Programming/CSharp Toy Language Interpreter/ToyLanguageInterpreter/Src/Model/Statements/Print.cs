using System;
using ToyLanguageInterpreter.Src.Model.Expressions;

namespace ToyLanguageInterpreter.Src.Model.Statements
{
    class Print : IStatement
    {
        private IExpression exp; 

        public Print(IExpression exp)
        {
            this.exp = exp;
        }

        public override string ToString()
        {
            return "print(" + exp.ToString() + ")";
        }

        public ProgramState Exec(ProgramState state)
        {
            state.AppendOutput(exp.Eval(state) + "\n");
            return null;
        }
    }
}
