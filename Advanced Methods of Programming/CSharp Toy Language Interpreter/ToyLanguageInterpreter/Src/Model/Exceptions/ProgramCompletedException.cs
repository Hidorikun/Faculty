using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyLanguageInterpreter.Src.Model.Exceptions
{
    class ProgramCompletedException : Exception
    {
        public ProgramCompletedException(string message) : base(message)
        {
        }
    }
}
