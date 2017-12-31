
namespace ToyLanguageInterpreter.Src.Model.Commands
{
    abstract class Command
    {
        public string Key { get; }
        public string Description { get; }

        public Command(string key, string description)
        {
            Key = key;
            Description = description;
        }

        public abstract void Execute();
    }
}
