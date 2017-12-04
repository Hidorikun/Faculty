package Controller;

import Model.Exceptions.ProgramCompletedException;
import Model.ProgramState;
import Model.ToyProgram;
import Repository.ToyProgramsRepository;

import java.util.*;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;

public class ToyProgramController {
    private ToyProgramsRepository repo;
    private ExecutorService executor;
    private String output;
    private int globalID;

    public ToyProgramController(ToyProgramsRepository repo){
        this.repo = repo;
        this.globalID = 1;
    }

    private void oneStepFOrAllPrograms(List<ToyProgram> toyPrograms) throws InterruptedException {

        List<Callable<ToyProgram>> callList = toyPrograms.stream()
                .map((ToyProgram p) -> (Callable<ToyProgram>)(p::oneStep))
                .collect(Collectors.toList());

        System.out.println("list size: " + callList.size());

        List<ToyProgram> newToyPrograms = executor.invokeAll(callList).stream()
                .map(future -> {
                    try{
                        return future.get();
                    }
                    catch( Exception e ){
                        return null;
                    }
                })
                .filter(Objects::nonNull)
                .collect(Collectors.toList());

        newToyPrograms.forEach(prg -> prg.setID(++globalID));
        toyPrograms.addAll(newToyPrograms);

//        toyPrograms = toyPrograms.stream()
//                .map(prg1 -> {
//                    try {
//                        return prg1.oneStep();
//                    } catch (ProgramCompletedException e) {
//                        return null;
//                    }
//                })
//                .collect(Collectors.toList());

        toyPrograms.forEach(prg -> repo.logPrgState(prg));

        repo.setPrgList(toyPrograms);
    }
    public void allStep() throws RuntimeException {
        executor = Executors.newFixedThreadPool(2);
        List<ToyProgram> programs = removeCompletedPrograms(repo.getPrgList());

        while(programs.size() > 0 ){
            try {
                oneStepFOrAllPrograms(programs);
                this.output = repo.first().getOutput();
                programs = removeCompletedPrograms(repo.getPrgList());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        executor.shutdownNow();
        repo.setPrgList(programs);

    }

    private List<ToyProgram> removeCompletedPrograms(List<ToyProgram> programs){
        return programs.stream()
                .filter(p -> !p.completed())
                .collect(Collectors.toList());
    }


     private Map<Integer,Integer> conservativeGarbageCollector(Collection<Integer> symTableValues, Map<Integer, Integer> heap){
        return heap.entrySet().stream()
                .filter(e->symTableValues.contains(e.getKey()))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
    }

    public String getOutput(){
        return this.output;
    }

    public String toString(){
        return repo.first().toString();
    }
}