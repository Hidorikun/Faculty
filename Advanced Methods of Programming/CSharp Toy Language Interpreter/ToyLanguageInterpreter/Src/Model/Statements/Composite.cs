using System;
using ToyLanguageInterpreter.Src.Model;
using ToyLanguageInterpreter.Src.Model.Containers;
using ToyLanguageInterpreter.Src.Model.Statements;

namespace ToyLanguageInterpreter.Src.View
{
    internal class Composite : IStatement
    {
        private IStatement first;
        private IStatement second; 
       
        public Composite(IStatement first, IStatement second)
        {
            this.first = first;
            this.second = second; 
        }

        public ProgramState Exec(ProgramState state)
        {
            IStack<IStatement> stack = state.ExeStack;
            stack.Push(second);
            stack.Push(first);
            return null;
        }

        public override string ToString()
        {
            return first.ToString() + ";\n" + second.ToString();
        }
    }
}