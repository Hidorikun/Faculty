using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyLanguageInterpreter.Src.Model.Statements
{
    interface IStatement
    {
        ProgramState Exec(ProgramState state);
        string ToString(); 
    }
}
