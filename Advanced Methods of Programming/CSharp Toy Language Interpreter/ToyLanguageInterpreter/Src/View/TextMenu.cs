using System;
using System.Collections.Generic;
using ToyLanguageInterpreter.Src.Model.Commands;

namespace ToyLanguageInterpreter.Src.View
{
    class TextMenu
    {
        private Dictionary<string, Command> commands; 

        public TextMenu()
        {
            commands = new Dictionary<string, Command>();
        }

        public void AddCommand(Command c)
        {
            commands.Add(c.Key, c);
        }

        private void PrintMenu()
        {
            foreach (Command com in commands.Values)
            {
                string line = string.Format("{0} : {1}", com.Key, com.Description);
                Console.WriteLine(line);
            }
        }

        public void Show()
        {
            while (true)
            {
                PrintMenu();
                Console.Write("Input the option: ");

                string key = Console.ReadLine();

                Command com;

                if (commands.TryGetValue(key, out com))
                {
                    com.Execute();
                }
                else
                {
                    Console.WriteLine("Invalid Option");
                }
            }
        }
    }
}
