using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyLanguageInterpreter.Src.Model.Containers
{

    class MyHeap<T> : IHeap<T>
    {
        private Dictionary<int, T> dict; 

        public MyHeap()
        {
            dict = new Dictionary<int, T>(); 
        }

        public T Get(int key)
        {
            T result = default(T);
            dict.TryGetValue(key, out result);
            return result;
        }

        public int Put(int key, T value)
        {
            dict.Add(key, value);
            return key;
        }
    }
}
