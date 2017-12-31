
namespace ToyLanguageInterpreter.Src.Model.Containers
{
    interface IHeap<T>
    {
        int Put(int key, T value);
        T Get(int key); 

        string ToString();
    }
}
