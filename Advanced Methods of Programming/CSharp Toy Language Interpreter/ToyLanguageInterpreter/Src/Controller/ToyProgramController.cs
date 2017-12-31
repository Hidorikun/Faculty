using ToyLanguageInterpreter.Src.Model.Exceptions;
using ToyLanguageInterpreter.Src.Repository;

namespace ToyLanguageInterpreter.Src.Controller
{
    class ToyProgramController
    {
        private ToyProgramRepository repo;
        public string Output { get; set; }

        public ToyProgramController(ToyProgramRepository repo)
        {
            this.repo = repo;
          
        }

        public void AllStep()
        {
            try
            {
                while (true)
                {
                    repo.First.OneStep();
                    Output = repo.First.Output;
                }
            }
            catch(ProgramCompletedException)
            {
                
            }
           
        }

        public override string ToString()
        {
            return repo.First.ToString();
        }
    }
}
