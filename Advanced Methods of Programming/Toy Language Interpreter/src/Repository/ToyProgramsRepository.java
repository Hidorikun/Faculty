package Repository;

import Model.ToyProgram;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ToyProgramsRepository {
    private List<ToyProgram> toyProgramList;
    private String logFilePath;

    public ToyProgramsRepository(ToyProgram prg, String logFilePath) throws IOException {
        this.logFilePath = logFilePath;
        toyProgramList = new ArrayList<>();
        toyProgramList.add(prg);
    }

    public void add(ToyProgram tp){
        toyProgramList.add(tp);
    }

    public ToyProgram getPrg(){
        return toyProgramList.get(0);
    }

    public void logPrgState(ToyProgram prg) throws IOException {
        StringBuilder logMessage = new StringBuilder("")
            .append("PrgStack:\n")
            .append(prg.getState().getExeStack().toString())
            .append("SymTable:\n")
            .append(prg.getState().getSymLink().toString())
            .append("Out:\n")
            .append(prg.getState().getOutput())
            .append("FileTable:\n")
            .append(prg.getState().getFileTable().toString());

        try(PrintWriter logFile = new PrintWriter(new BufferedWriter(new FileWriter(logFilePath, true)))){
            logFile.println(logMessage.toString());
            logFile.close();
        }
    }

    @Override
    public String toString() {
        return toyProgramList.toString();
    }
}
