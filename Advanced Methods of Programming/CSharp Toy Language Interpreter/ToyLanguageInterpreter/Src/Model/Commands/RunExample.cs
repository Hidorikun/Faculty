using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ToyLanguageInterpreter.Src.Controller;

namespace ToyLanguageInterpreter.Src.Model.Commands
{
    class RunExample : Command
    {
        private ToyProgramController controller;

        public RunExample(string key, string description, ToyProgramController controller) : base(key, description) 
        {
            this.controller = controller;
        }

        public override void Execute()
        {
            try
            {
                Console.WriteLine(controller.ToString());
                controller.AllStep();
                Console.WriteLine(controller.Output);
            }
            catch (Exception e)
            {
                Console.WriteLine("From RunExample" + e.ToString());
            }
        }
    }
}
