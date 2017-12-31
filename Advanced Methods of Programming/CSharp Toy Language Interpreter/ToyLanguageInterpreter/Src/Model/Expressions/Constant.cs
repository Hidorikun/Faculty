using System;
using ToyLanguageInterpreter.Src.Model;
using ToyLanguageInterpreter.Src.Model.Expressions;

namespace ToyLanguageInterpreter.Src.View
{
    internal class Constant : IExpression
    {
        private int value;

        public Constant(int value)
        {
            this.value = value;
        }

        public int Eval(ProgramState state)
        {
            return value;
        }

        public override string ToString()
        {
            return value.ToString();
        }
    }
}