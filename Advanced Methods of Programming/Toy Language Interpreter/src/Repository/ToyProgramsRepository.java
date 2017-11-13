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

    public ToyProgram getPrg(){
        return toyProgramList.get(0);
    }

    public void logPrgState(ToyProgram prg) throws IOException {
        try(PrintWriter logFile = new PrintWriter(new BufferedWriter(new FileWriter(logFilePath, true)))){
            logFile.println(prg.getState().toString()+"\n");
            logFile.close();
        }
    }

    @Override
    public String toString() {
        return toyProgramList.toString();
    }
}
