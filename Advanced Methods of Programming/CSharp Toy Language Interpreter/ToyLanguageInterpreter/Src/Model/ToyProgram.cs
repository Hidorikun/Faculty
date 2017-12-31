using System;
using ToyLanguageInterpreter.Src.Model.Exceptions;
using ToyLanguageInterpreter.Src.Model.Statements;

namespace ToyLanguageInterpreter.Src.Model
{
    class ToyProgram
    {
        public int id { get; set; }
        public ProgramState State { get; set; }
        public IStatement Statement { get; set; }
        public string Output
        {
            get { return State.Output; }
        }

        public ToyProgram(IStatement statement)
        {
            this.Statement = statement;
            this.State = new ProgramState();
            State.ExeStack.Push(statement);
            id = 1;
        }

        private ToyProgram(ProgramState state)
        {
            this.Statement = state.ExeStack.Peek();
            this.State = state;
        }

        public ToyProgram OneStep()
        {
            if(this.Completed())
            {
                throw new ProgramCompletedException("All steps executed");
            }

            IStatement currentStatement = State.ExeStack.Pop();
            ProgramState newState = currentStatement.Exec(State);

            if (newState != null)
                return new ToyProgram(newState);

            return null;
        }

        public bool Completed()
        {
            return State.ExeStack.Empty();
        }

        public override string ToString()
        {
            return Statement.ToString();
        }

    }
}
