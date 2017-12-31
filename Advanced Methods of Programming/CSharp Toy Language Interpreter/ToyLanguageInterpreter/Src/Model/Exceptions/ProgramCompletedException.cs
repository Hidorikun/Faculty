using System;

namespace ToyLanguageInterpreter.Src.Model.Exceptions
{
    class ProgramCompletedException : Exception
    {
        public ProgramCompletedException(string message) : base(message)
        {
        }
    }
}
