import Controller.ToyProgramController;
import Model.Commands.ExitCommand;
import Model.Commands.RunExample;
import Model.Expressions.ArithExp;
import Model.Expressions.ConstExp;
import Model.Expressions.VarExp;
import Model.Expressions.rHExp;
import Model.Statements.*;
import Model.ToyProgram;
import Repository.ToyProgramsRepository;
import View.TextMenu;

import javax.xml.soap.Text;

public class Interpreter {

    public static void main(String[] args) {
        try {

            ToyProgram prg1 = new ToyProgram(
                    new CompStmt(
                            new AssignStmt(
                                    "v",
                                    new ConstExp(2)
                            ),
                            new PrintStmt(
                                    new VarExp("v")
                            )
                    )
            );

            ToyProgramsRepository repo1 = new ToyProgramsRepository(prg1, "data/prg1.txt");
            ToyProgramController ctrl1 = new ToyProgramController(repo1);


            ToyProgram prg2 = new ToyProgram(
                    new CompStmt(
                        new AssignStmt(
                                "a",
                                new ArithExp(
                                        "-",
                                        new ConstExp(2),
                                        new ConstExp(2)
                                )
                        ),
                        new CompStmt(
                                new IfStmt(
                                        new VarExp("a"),
                                        new AssignStmt(
                                                "v",
                                                new ConstExp(2)),
                                        new AssignStmt(
                                                "v",
                                                new ConstExp(3)
                                        )
                                ),
                                new PrintStmt(
                                        new VarExp("v")
                                )
                        )
                    )
            );

            ToyProgramsRepository repo2 = new ToyProgramsRepository(prg2, "data/prg2.txt");
            ToyProgramController ctrl2 = new ToyProgramController(repo2);


            ToyProgram prg3 = new ToyProgram(
                    new CompStmt(
                        new AssignStmt(
                                "a",
                                new ArithExp(
                                        "+",
                                        new ConstExp(2),
                                        new ArithExp(
                                                "*",
                                                new ConstExp(3),
                                                new ConstExp(5)
                                        )
                                )
                        ),
                        new CompStmt(
                                new AssignStmt(
                                        "b",
                                        new ArithExp(
                                                "+",
                                                new VarExp("a"),
                                                new ConstExp(1)
                                        )
                                ),
                                new PrintStmt(
                                        new VarExp("b")
                                )
                        )
                    )
            );

            ToyProgramsRepository repo3 = new ToyProgramsRepository(prg3, "data/prg3.txt");
            ToyProgramController ctrl3 = new ToyProgramController(repo3);

            ToyProgram prg4 = new ToyProgram(
                    new CompStmt(
                        new OpenFileStmt(
                                "var_f",
                                "data/test.in"
                        ),
                        new CompStmt(
                                new ReadFileStmt(
                                        new VarExp("var_f"),
                                        "var_c"
                                ),
                                new CompStmt(
                                        new PrintStmt(
                                                new VarExp("var_c")
                                        ),
                                        new CompStmt(
                                                new IfStmt(
                                                        new VarExp("var_c"),
                                                        new CompStmt(
                                                                new ReadFileStmt(
                                                                        new VarExp("var_f"),
                                                                        "var_c"
                                                                ),
                                                                new PrintStmt(
                                                                        new VarExp("var_c")
                                                                )
                                                        ),
                                                        new PrintStmt(
                                                                new ConstExp(0)
                                                        )
                                                ),
                                                new CloseFileStmt(
                                                        new VarExp("var_f")
                                                )
                                        )
                                )
                        )
                    )
            );

            ToyProgramsRepository repo4 = new ToyProgramsRepository(prg4, "data/prg4.txt");
            ToyProgramController ctrl4 = new ToyProgramController(repo4);


            ToyProgram prg5 = new ToyProgram(
                    new CompStmt(
                            new OpenFileStmt(
                                    "var_f",
                                    "data/test.in"
                            ),
                            new CompStmt(
                                    new ReadFileStmt(
                                            new ArithExp(
                                                    "+",
                                                    new VarExp("var_f"),
                                                    new ConstExp(2)
                                            ),
                                            "var_c"
                                    ),
                                    new CompStmt(
                                            new PrintStmt(
                                                    new VarExp("var_c")
                                            ),
                                            new CompStmt(
                                                    new IfStmt(
                                                            new VarExp("var_c"),
                                                            new CompStmt(
                                                                    new ReadFileStmt(
                                                                            new VarExp("var_f"),
                                                                            "var_c"
                                                                    ),
                                                                    new PrintStmt(
                                                                            new VarExp("var_c")
                                                                    )
                                                            ),
                                                            new PrintStmt(
                                                                    new ConstExp(0)
                                                            )
                                                    ),
                                                    new CloseFileStmt(
                                                            new VarExp("var_f")
                                                    )
                                            )
                                    )
                            )
                    )
            );

            ToyProgramsRepository repo5 = new ToyProgramsRepository(prg5, "data/prg5.txt");
            ToyProgramController ctrl5 = new ToyProgramController(repo5);

            ToyProgram prg6 = new ToyProgram(
                new CompStmt(
                        new AssignStmt(
                                "v",
                                new ConstExp(10)
                        ),
                        new CompStmt(
                                new NewStmt(
                                        "v",
                                        new ConstExp(20)
                                ),
                                new CompStmt(
                                        new NewStmt(
                                                "a",
                                                new ConstExp(22)
                                        ),
                                        new CompStmt(
                                                new wHstmt(
                                                        "a",
                                                        new ConstExp(22)
                                                ),
                                                new CompStmt(
                                                        new PrintStmt(
                                                                new VarExp("a")
                                                        ),
                                                        new PrintStmt(
                                                                new rHExp("a")
                                                        )
                                                )

                                        )
                                )
                        )

                )
            );

            ToyProgramsRepository repo6 = new ToyProgramsRepository(prg6, "data/prg6.txt");
            ToyProgramController ctrl6 = new ToyProgramController(repo6);

            TextMenu textMenu = new TextMenu();
            textMenu.addCommand(new ExitCommand("exit", "exit the interpreter" )) ;
            textMenu.addCommand(new RunExample("1", "run program 1", ctrl1));
            textMenu.addCommand(new RunExample("2", "run program 2", ctrl2));
            textMenu.addCommand(new RunExample("3", "run program 3", ctrl3));
            textMenu.addCommand(new RunExample("4", "run program 4", ctrl4));
            textMenu.addCommand(new RunExample("5", "run program 5", ctrl5));
            textMenu.addCommand(new RunExample("6", "run program 6", ctrl6));

            textMenu.show();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
