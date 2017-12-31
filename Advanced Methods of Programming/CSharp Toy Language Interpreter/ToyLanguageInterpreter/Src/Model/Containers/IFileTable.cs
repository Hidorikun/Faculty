using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyLanguageInterpreter.Src.Model.Containers
{
    interface IFileTable<T>
    {
        int Put(T value);
        T Get(int key);
        void Remove(int key);

        string ToString(); 
    }
}
