import Controller.ToyProgramController;
import Model.Commands.ExitCommand;
import Model.Commands.RunExample;
import Model.Expressions.Arithmetic.Addition;
import Model.Expressions.Arithmetic.Subtraction;
import Model.Expressions.Boolean.Greater;
import Model.Expressions.Constant;
import Model.Expressions.Variable;
import Model.Expressions.ReadHeap;
import Model.Statements.*;
import Model.Statements.FileManipulation.CloseFile;
import Model.Statements.FileManipulation.OpenFile;
import Model.Statements.FileManipulation.ReadFile;
import Model.ToyProgram;
import Repository.ToyProgramsRepository;
import View.TextMenu;

public class Interpreter {

    public static void main(String[] args) {
        try {

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

            ToyProgramsRepository repo1 = new ToyProgramsRepository(prg1, "data/prg1.txt");
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

            ToyProgramsRepository repo2 = new ToyProgramsRepository(prg2, "data/prg2.txt");
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

            ToyProgramsRepository repo3 = new ToyProgramsRepository(prg3, "data/prg3.txt");
            ToyProgramController ctrl3 = new ToyProgramController(repo3);

            ToyProgram prg4 = new ToyProgram(
                    new Composite(
                        new OpenFile(
                                "var_f",
                                "data/test.in"
                        ),
                        new Composite(
                                new ReadFile(
                                        new Variable("var_f"),
                                        "var_c"
                                ),
                                new Composite(
                                        new Print(
                                                new Variable("var_c")
                                        ),
                                        new Composite(
                                                new If(
                                                        new Variable("var_c"),
                                                        new Composite(
                                                                new ReadFile(
                                                                        new Variable("var_f"),
                                                                        "var_c"
                                                                ),
                                                                new Print(
                                                                        new Variable("var_c")
                                                                )
                                                        ),
                                                        new Print(
                                                                new Constant(0)
                                                        )
                                                ),
                                                new CloseFile(
                                                        new Variable("var_f")
                                                )
                                        )
                                )
                        )
                    )
            );

            ToyProgramsRepository repo4 = new ToyProgramsRepository(prg4, "data/prg4.txt");
            ToyProgramController ctrl4 = new ToyProgramController(repo4);


            ToyProgram prg5 = new ToyProgram(
                    new Composite(
                            new OpenFile(
                                    "var_f",
                                    "data/test.in"
                            ),
                            new Composite(
                                    new ReadFile(
                                            new Addition(
                                                    new Variable("var_f"),
                                                    new Constant(2)
                                            ),
                                            "var_c"
                                    ),
                                    new Composite(
                                            new Print(
                                                    new Variable("var_c")
                                            ),
                                            new Composite(
                                                    new If(
                                                            new Variable("var_c"),
                                                            new Composite(
                                                                    new ReadFile(
                                                                            new Variable("var_f"),
                                                                            "var_c"
                                                                    ),
                                                                    new Print(
                                                                            new Variable("var_c")
                                                                    )
                                                            ),
                                                            new Print(
                                                                    new Constant(0)
                                                            )
                                                    ),
                                                    new CloseFile(
                                                            new Variable("var_f")
                                                    )
                                            )
                                    )
                            )
                    )
            );

            ToyProgramsRepository repo5 = new ToyProgramsRepository(prg5, "data/prg5.txt");
            ToyProgramController ctrl5 = new ToyProgramController(repo5);

            ToyProgram prg6 = new ToyProgram(
                new Composite(
                        new Assignment(
                                "v",
                                new Constant(10)
                        ),
                        new Composite(
                                new New(
                                        "v",
                                        new Constant(20)
                                ),
                                new Composite(
                                        new New(
                                                "a",
                                                new Constant(22)
                                        ),
                                        new Composite(
                                                new WriteHeap(
                                                        "a",
                                                        new Constant(22)
                                                ),
                                                new Composite(
                                                        new Print(
                                                                new Variable("a")
                                                        ),
                                                        new Print(
                                                                new ReadHeap("a")
                                                        )
                                                )
                                        )
                                )
                        )

                )
            );

            ToyProgramsRepository repo6 = new ToyProgramsRepository(prg6, "data/prg6.txt");
            ToyProgramController ctrl6 = new ToyProgramController(repo6);

            ToyProgram prg7 = new ToyProgram(
                    new Composite(
                            new Assignment(
                                 "v",
                                    new Constant(10)
                            ),
                            new While(
                                new Greater(
                                        new Variable("v"),
                                        new Constant(0)
                                ),
                                new Composite(
                                        new Print(
                                                new Variable("v")
                                        ),
                                        new Assignment(
                                                "v",
                                                new Subtraction(
                                                        new Variable("v"),
                                                        new Constant(1)
                                                )
                                        )
                                )
                            )
                    )
            );

            ToyProgramsRepository repo7 = new ToyProgramsRepository(prg7, "data/prg7.txt");
            ToyProgramController ctrl7 = new ToyProgramController(repo7);

            ToyProgram prg8 = new ToyProgram(
                    new Composite(
                            new Assignment(
                                    "v",
                                    new Constant(10)
                            ),
                            new Composite(
                                    new New(
                                            "a",
                                            new Constant(22)
                                    ),
                                    new Composite(
                                            new Fork(
                                                    new Composite(
                                                            new WriteHeap(
                                                                    "a",
                                                                    new Constant(30)
                                                            ),
                                                            new Composite(
                                                                    new Assignment(
                                                                            "v",
                                                                            new Constant(32)
                                                                    ),
                                                                    new Composite(
                                                                            new Print(
                                                                                    new Variable("v")
                                                                            ),
                                                                            new Print(
                                                                                    new ReadHeap("a")
                                                                            )
                                                                    )
                                                            )

                                                    )

                                            ),
                                            new Composite(
                                                    new Print(
                                                            new Variable("v")
                                                    ),
                                                    new Print(
                                                            new ReadHeap("a")
                                                    )
                                            )

                                    )
                            )
                    )
            );

            ToyProgramsRepository repo8 = new ToyProgramsRepository(prg8, "data/prg8.txt");
            ToyProgramController ctrl8 = new ToyProgramController(repo8);

            TextMenu textMenu = new TextMenu();
            textMenu.addCommand(new ExitCommand("exit", "exit the interpreter" )) ;
            textMenu.addCommand(new RunExample("1", "run program 1", ctrl1));
            textMenu.addCommand(new RunExample("2", "run program 2", ctrl2));
            textMenu.addCommand(new RunExample("3", "run program 3", ctrl3));
            textMenu.addCommand(new RunExample("4", "run program 4", ctrl4));
            textMenu.addCommand(new RunExample("5", "run program 5", ctrl5));
            textMenu.addCommand(new RunExample("6", "run program 6", ctrl6));
            textMenu.addCommand(new RunExample("7", "run program 7", ctrl7));
            textMenu.addCommand(new RunExample("8", "run program 8", ctrl8));

            textMenu.show();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
