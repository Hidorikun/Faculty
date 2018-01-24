package Controller;

import Model.Containers.MyIStack;
import Model.Containers.MyStack;
import Model.Exceptions.ProgramCompletedException;
import Model.ProgramState;
import Model.Statements.IStatement;
import Model.ToyProgram;
import Repository.ToyProgramsRepository;
import Util.Pair;
import org.omg.PortableInterceptor.INACTIVE;

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
        this.output = "";
        executor = Executors.newFixedThreadPool(2);
    }

    public void oneStepFOrAllPrograms(List<ToyProgram> toyPrograms) throws InterruptedException {
        List<Callable<ToyProgram>> callList = toyPrograms.stream()
                .map((ToyProgram p) -> (Callable<ToyProgram>)(p::oneStep))
                .collect(Collectors.toList());

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

        toyPrograms.forEach(prg -> repo.logPrgState(prg));

        repo.setPrgList(toyPrograms);
        this.output = repo.first().getOutput();
    }

    public void allStep() throws RuntimeException {
        List<ToyProgram> programs = removeCompletedPrograms(repo.getPrgList());

        while(programs.size() > 0 ){
            try {
                oneStepFOrAllPrograms(programs);
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

    public String getOutput(){
        return this.output;
    }

    public String toString(){
        return repo.first().toString();
    }

    public String getPrgStatesNr() {
        return String.valueOf(repo.getPrgList().size());
    }

    public List<Integer> getThreadIds(){
        List<Integer> result = new ArrayList<>();
        for (ToyProgram p : repo.getPrgList()){
            result.add(p.getID());
        }
        return result;
    }

    public Integer getAnyThreadId(){
        return repo.getPrgList().stream().map(ToyProgram::getID).findFirst().get();
    }

    public ToyProgram getThread(int threadID){
        return repo.getPrgList().stream().filter(e -> e.getID() == threadID).findFirst().get();
    }

    public List<String> getStack(int currentThread) {
        MyIStack<IStatement> stack = getThread(currentThread).getState().getExeStack();
        return stack.values().stream().map(IStatement::toString).collect(Collectors.toList());
    }

    public List<Pair<Integer, Integer>> getHeap(int currentThread) {
        List<Pair<Integer, Integer>> result = new ArrayList<>();
        ToyProgram thread = getThread(currentThread);
        for (Integer key : thread.getState().getHeap().keySet()){
            result.add(new Pair<>(key, thread.getState().getHeap().get(key)));
        }

        return result;
    }

    public List<Pair<String, Integer>> getSymTable(int currentThread) {
        List<Pair<String, Integer>> result = new ArrayList<>();
        ToyProgram thread = getThread(currentThread);
        for(String key : thread.getState().getSymTable().keySet()){
            result.add(new Pair<>(key, thread.getState().getSymTable().get(key)));
        }

        return result;
    }

    public List<Pair<Integer, String>> getFileTable(int currentThread) {
        List<Pair<Integer, String>> result = new ArrayList<>();
        ToyProgram thread = getThread(currentThread);
        for (Integer key : thread.getState().getFileTable().keySet()){
            result.add(new Pair<>(key, thread.getState().getFileTable().get(key).toString()));
        }

        return result;
    }

    public List<Pair<Integer, Integer>> getLockTable(int currentThread) {
        List<Pair<Integer, Integer>> result = new ArrayList<>();
        ToyProgram thread = getThread(currentThread);
        for (Integer key : thread.getState().getLockTable().keySet()){
            result.add(new Pair<>(key, thread.getState().getLockTable().get(key)));
        }

        return result;
    }

    public List<Pair<Integer, Pair<List<Integer>, Integer>>> getBarrierTable(int currentThread){
        List<Pair<Integer, Pair<List<Integer>, Integer>>> result = new ArrayList<>();
        ToyProgram thread = getThread(currentThread);
        for (Integer key : thread.getState().getBarrierTable().keySet()){
            result.add(new Pair<>(key, thread.getState().getBarrierTable().get(key)));
        }

        return result;
    }
    public List<ToyProgram> getPrograms(){
        return repo.getPrgList();
    }
}