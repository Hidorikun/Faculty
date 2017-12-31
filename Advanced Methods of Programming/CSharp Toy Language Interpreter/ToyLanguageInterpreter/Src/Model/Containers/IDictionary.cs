using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyLanguageInterpreter.Src.Model.Containers
{
    interface IDictionary<K, V>
    {
        V Get(K key);
        V Put(K key, V value);

        string ToString();
    }
}
