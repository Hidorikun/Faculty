using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyLanguageInterpreter.Src.Model.Expressions
{
    interface IExpression
    {
        int Eval(ProgramState state);
        String ToString(); 
    }
}
