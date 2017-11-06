package Model.Commands;

import Controller.ToyProgramController;

public class RunExample extends Command {
    private ToyProgramController controller;

    public RunExample(String key, String description, ToyProgramController controller){
        super(key, description);
        this.controller = controller;
    }

    @Override
    public void execute() {
        try{
            System.out.println(controller.getProgram().toString());
            controller.allStep();
            System.out.println(controller.getOutput());
        }
        catch(Exception e){
            System.out.println("from RunExample" + e.toString());
        }
    }
}
