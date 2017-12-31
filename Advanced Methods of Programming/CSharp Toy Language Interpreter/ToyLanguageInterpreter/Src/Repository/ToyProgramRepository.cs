using System.Collections.Generic;
using System.IO;
using ToyLanguageInterpreter.Src.Model;

namespace ToyLanguageInterpreter.Src.Repository
{
    class ToyProgramRepository
    {
        public List<ToyProgram> ToyPrograms { get; set; }
        public string LogFilePath { get; set; }
        public ToyProgram First
        {
            get { return ToyPrograms[0]; }
        }

        public ToyProgramRepository(ToyProgram prg, string logFilePath)
        {
            this.LogFilePath = logFilePath;
            ToyPrograms = new List<ToyProgram>();
            ToyPrograms.Add(prg);
        }

        public void LogPrgState(ToyProgram prg)
        {
            FileStream logFile = new FileStream(LogFilePath, FileMode.Append);
            StreamWriter writer = new StreamWriter(logFile);

            writer.WriteLine(prg.State.ToString());
            writer.Close();
        }
    }
}
