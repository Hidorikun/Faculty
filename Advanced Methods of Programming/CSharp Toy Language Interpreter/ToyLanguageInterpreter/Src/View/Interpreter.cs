using System;
using ToyLanguageInterpreter.Src.Controller;
using ToyLanguageInterpreter.Src.Model;
using ToyLanguageInterpreter.Src.Model.Commands;
using ToyLanguageInterpreter.Src.Model.Expressions.Arithmetic;
using ToyLanguageInterpreter.Src.Model.Statements;
using ToyLanguageInterpreter.Src.Repository;

namespace ToyLanguageInterpreter.Src.View
{
    class Interpreter
    {
        static void Main(string[] args)
        {
            ToyProgram prg1 = new ToyProgram(
                   new Composite(
                           new Assignment(
                                   "v",
                                   new Constant(2)
                           ),
                           new Print(
                                   new Variable("v")
                           )
                   )
           );

            ToyProgramRepository repo1 = new ToyProgramRepository(prg1, "data/prg1.txt");
            ToyProgramController ctrl1 = new ToyProgramController(repo1);


            ToyProgram prg2 = new ToyProgram(
                    new Composite(
                        new Assignment(
                                "a",
                                new Subtraction(
                                        new Constant(2),
                                        new Constant(2)
                                )
                        ),
                        new Composite(
                                new If(
                                        new Variable("a"),
                                        new Assignment(
                                                "v",
                                                new Constant(2)),
                                        new Assignment(
                                                "v",
                                                new Constant(3)
                                        )
                                ),
                                new Print(
                                        new Variable("v")
                                )
                        )
                    )
            );

            ToyProgramRepository repo2 = new ToyProgramRepository(prg2, "data/prg2.txt");
            ToyProgramController ctrl2 = new ToyProgramController(repo2);


            ToyProgram prg3 = new ToyProgram(
                    new Composite(
                        new Assignment(
                                "a",
                                new Addition(
                                        new Constant(2),
                                        new Addition(
                                                new Constant(3),
                                                new Constant(5)
                                        )
                                )
                        ),
                        new Composite(
                                new Assignment(
                                        "b",
                                        new Addition(
                                                new Variable("a"),
                                                new Constant(1)
                                        )
                                ),
                                new Print(
                                        new Variable("b")
                                )
                        )
                    )
            );

            ToyProgramRepository repo3 = new ToyProgramRepository(prg3, "data/prg3.txt");
            ToyProgramController ctrl3 = new ToyProgramController(repo3);

            TextMenu textMenu = new TextMenu();
            textMenu.AddCommand(new ExitCommand("exit", "exit the interpreter"));
            textMenu.AddCommand(new RunExample("1", "run program 1", ctrl1));
            textMenu.AddCommand(new RunExample("2", "run program 2", ctrl2));
            textMenu.AddCommand(new RunExample("3", "run program 3", ctrl3));
   

            textMenu.Show();

            Console.Write("Press <ENTER> to continue.");
            Console.ReadLine();
        }
    }
}
