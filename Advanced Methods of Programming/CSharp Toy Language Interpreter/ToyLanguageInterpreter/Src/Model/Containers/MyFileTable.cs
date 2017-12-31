using System.Collections.Generic;

namespace ToyLanguageInterpreter.Src.Model.Containers
{
    class MyFileTable<T> : IFileTable<T>
    {
        private int cnt;
        private Dictionary<int, T> dict; 

        public MyFileTable()
        {
            cnt = 0;
            dict = new Dictionary<int, T>();
        }

        public T Get(int key)
        {
            T result;
            dict.TryGetValue(key, out result);
            return result;
        }

        public int Put(T value)
        {
            dict.Add(cnt, value);
            return cnt++;
        }

        public void Remove(int key)
        {
            dict.Remove(key);
        }
    }
}
