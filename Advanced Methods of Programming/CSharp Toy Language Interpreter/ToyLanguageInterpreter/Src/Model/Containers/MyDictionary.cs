using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyLanguageInterpreter.Src.Model.Containers
{
    class MyDictionary<K, V> : IDictionary<K, V>
    {
        Dictionary<K, V> dict; 

        public MyDictionary()
        {
            dict = new Dictionary<K, V>();
        }

        public V Get(K key)
        {
            V result;
            dict.TryGetValue(key, out result);
            return result;
        }

        public V Put(K key, V value)
        {
            dict.Add(key, value);
            return value;
        }

        public override string ToString()
        {
            StringBuilder result = new StringBuilder();
            foreach (K key in dict.Keys)
            {
                result.Append("\t")
                      .Append(key.ToString())
                      .Append("-->")
                      .Append(dict[key])
                      .Append("\n");
            }

            return result.ToString();
        }
    }
}
