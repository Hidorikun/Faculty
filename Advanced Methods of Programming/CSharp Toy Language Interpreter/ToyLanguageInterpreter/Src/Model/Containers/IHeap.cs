using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyLanguageInterpreter.Src.Model.Containers
{
    interface IHeap<T>
    {
        int Put(int key, T value);
        T Get(int key); 

        String ToString();
    }
}
