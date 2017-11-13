package Controller;

import Model.Exceptions.ProgramCompletedException;
import Model.Statements.IStmt;
import Model.ToyProgram;
import Repository.ToyProgramsRepository;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

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
        currentStatement.exec(prg.getState());
    }

    public void allStep() throws RuntimeException {
        ToyProgram prg = repo.getPrg();
        try{
            while(true){
                oneStep(prg);
                prg.getState().getHeap().setContent(conservativeGarbageCollector(
                        prg.getState().getSymLink().getContent().values(),
                        prg.getState().getHeap().getContent()));

                repo.logPrgState(prg);
            }
        }
        catch(ProgramCompletedException e){

        }
        catch (IOException e) {
            throw new RuntimeException("IOException: " + e.toString());
        }

    }

     private Map<Integer,Integer> conservativeGarbageCollector(Collection<Integer> symTableValues, Map<Integer, Integer> heap){
        return heap.entrySet().stream()
                .filter(e->symTableValues.contains(e.getKey()))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
    }

    public ToyProgram getProgram()
    {
        return repo.getPrg();
    }
    public String getOutput(){
        return repo.getPrg().getOutput();
    }
}
