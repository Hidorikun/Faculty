import Controller.ToyProgramController;
import Model.Commands.ExitCommand;
import Model.Commands.RunExample;

import Util.ProgramGenerator;
import View.CLI.TextMenu;
import View.GUI.MainWindow;

import java.util.List;
import java.util.Scanner;

public class Interpreter {

    public static void main(String[] args) {

        System.out.println("Toy Language Interpreter");
        System.out.println("");
        System.out.println("Choose UI:");
        System.out.println("Options: CLI, GUI");

        Scanner console = new Scanner(System.in);
//        String ui = console.nextLine();
        String ui = "gui";
        //start preferred ui
        ui = ui.toLowerCase().trim();

        if (ui.equals("cli")) {
            startCLI();
        }else if (ui.equals("gui")){
            System.out.println("Starting GUI Application...");
            startGUI();
        }else{
            System.out.println("Invalid option!");
        }
    }

    private static void startGUI(){
        MainWindow gui = new MainWindow();
        gui.show();
    }

    private static void startCLI(){
        try{
            List<ToyProgramController> controllers = ProgramGenerator.generatePrograms();

            TextMenu textMenu = new TextMenu();
            textMenu.addCommand(new ExitCommand("exit", "exit the interpreter" )) ;

            for (Integer i = 1; i < controllers.size(); i++){
                textMenu.addCommand(new RunExample(i.toString(), controllers.get(i).toString(), controllers.get(i)));
            }

            textMenu.show();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
