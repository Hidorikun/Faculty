package View.CLI;

import Model.Commands.Command;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class TextMenu {

    private Map<String, Command> commands;
    public TextMenu(){
        commands=new HashMap<>();
    }

    public void addCommand(Command c){
        commands.put(c.getKey(),c);
    }

    private void printMenu(){
        for(Command com : commands.values()){
            String line=String.format("%4s : %s", com.getKey(), com.getDescription());
            System.out.println(line);
        }
    }
    public void show(){
        Scanner scanner=new Scanner(System.in);

        while(true){
            //prompt user with possibilities
            printMenu();
            System.out.printf("Input the option: ");

            //wait user input
            String key=scanner.nextLine();

            //execute command given
            Command com = commands.get(key);

            if (com==null){
                System.out.println("Invalid Option");
                continue;
            }

            com.execute();
        }
    }
}