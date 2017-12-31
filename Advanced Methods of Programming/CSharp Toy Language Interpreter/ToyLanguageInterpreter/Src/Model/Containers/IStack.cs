
namespace ToyLanguageInterpreter.Src.Model.Containers
{
    interface IStack<T>
    {
        bool Empty();
        T Peek();
        T Pop();
        void Push(T item);

        string ToString();
    }
}
