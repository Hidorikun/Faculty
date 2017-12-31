using System;
using ToyLanguageInterpreter.Src.Model;
using ToyLanguageInterpreter.Src.Model.Expressions;

namespace ToyLanguageInterpreter.Src.View
{
    internal class Variable : IExpression
    {
        private string id;

        public Variable(string id)
        {
            this.id = id;
        }

        public int Eval(ProgramState state)
        {
            return state.SymTable.Get(id);
        }

        public override string ToString()
        {
            return id;
        }
    }
}