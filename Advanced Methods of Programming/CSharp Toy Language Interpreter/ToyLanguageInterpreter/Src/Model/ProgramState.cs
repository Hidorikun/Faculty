using System;
using System.IO;
using ToyLanguageInterpreter.Src.Model.Containers;
using ToyLanguageInterpreter.Src.Model.Statements;

namespace ToyLanguageInterpreter.Src.Model
{
    class ProgramState
    {
        public IStack<IStatement> ExeStack { get; set; }
        public Containers.IDictionary<string, int> SymTable { get; set; }
        public IFileTable<Tuple<string, FileStream>> FileTable { get; set; }
        public IHeap<int> Heap { get; set; }
        public string Output { get; set; }

        public ProgramState()
        {
            ExeStack  = new MyStack<IStatement>();
            SymTable  = new MyDictionary<string, int>();
            FileTable = new MyFileTable<Tuple<string, FileStream>>();
            Heap      = new MyHeap<int>();
        }

        public void AppendOutput(string s)
        {
            Output += s;
        }

        public override string ToString()
        {
            return 
                "ExeStack:\n"  + ExeStack.ToString() +
                "SymLink:\n"   + SymTable.ToString() +
                "FileTable:\n" + FileTable.ToString() +
                "Heap:\n"      + Heap.ToString() +
                "Output:\n"    + Output;
        }
    }
}
