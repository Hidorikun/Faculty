
namespace ToyLanguageInterpreter.Src.Model.Containers
{
    interface IDictionary<K, V>
    {
        V Get(K key);
        V Put(K key, V value);

        string ToString();
    }
}
