package Controller;

import Model.Exceptions.ProgramCompletedException;
import Model.Statements.IStmt;
import Model.ToyProgram;
import Repository.ToyProgramsRepository;

import java.io.IOException;

public class ToyProgramController {
    private ToyProgramsRepository repo;

    public ToyProgramController(ToyProgramsRepository repo){
        this.repo = repo;
    }

    private void oneStep(ToyProgram prg) throws ProgramCompletedException{
        if(prg.getState().getExeStack().empty()){
            throw new ProgramCompletedException("All steps executed");
        }
        IStmt currentStatement = prg.getState().getExeStack().pop();
        System.out.println(currentStatement);
        currentStatement.exec(prg.getState());
    }

    public void allStep() throws RuntimeException {
        ToyProgram prg = repo.getPrg();
        try{
            while(true){
                oneStep(prg);
                repo.logPrgState(prg);
            }
        }
        catch(ProgramCompletedException e){

        } catch (IOException e) {
            throw new RuntimeException("IOException: " + e.toString());
        }

    }

    public ToyProgram getProgram()
    {
        return repo.getPrg();
    }
    public String getOutput(){
        return repo.getPrg().getOutput();
    }
}
