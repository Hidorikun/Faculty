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

    public List<ToyProgram> getPrgList(){ return toyProgramList; }

    public void setPrgList( List<ToyProgram> prgList){ this.toyProgramList = prgList;}

    public void logPrgState(ToyProgram prg)  {
        try(PrintWriter logFile = new PrintWriter(new BufferedWriter(new FileWriter(logFilePath, true)))){
            logFile.println(prg.getID().toString() + "\n");
            logFile.println(prg.getState().toString()+"\n");
            logFile.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public ToyProgram first(){
        return this.toyProgramList.get(0);
    }

    @Override
    public String toString() {
        return toyProgramList.toString();
    }
}
