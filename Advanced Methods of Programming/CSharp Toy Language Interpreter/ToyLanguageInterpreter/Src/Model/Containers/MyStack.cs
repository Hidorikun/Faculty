using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyLanguageInterpreter.Src.Model.Containers
{
    class MyStack<T> : IStack<T>
    {
        private Stack<T> stack; 

        public MyStack()
        {
            stack = new Stack<T>();
        }
        public bool Empty()
        {
            return stack.Count == 0;
        }

        public T Peek()
        {
            return stack.Peek();
        }

        public T Pop()
        {
            return stack.Pop(); 
        }

        public void Push(T item)
        {
            stack.Push(item);
        }
    }
}
