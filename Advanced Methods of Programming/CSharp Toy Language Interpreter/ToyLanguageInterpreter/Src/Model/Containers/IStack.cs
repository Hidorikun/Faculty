using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyLanguageInterpreter.Src.Model.Containers
{
    interface IStack<T>
    {
        bool Empty();
        T Peek();
        T Pop();
        void Push(T item);

        String ToString();
    }
}
