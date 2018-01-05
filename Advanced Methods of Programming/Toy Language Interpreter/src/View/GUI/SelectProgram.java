package View.GUI;

import Controller.ToyProgramController;
import Model.ProgramState;
import Model.ToyProgram;
import View.GUI.Controllers.SelectProgramWindow;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.List;

public class SelectProgram  {
    public ToyProgramController display(List<ToyProgramController> programs) throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("Views/SelectProgram.fxml"));
        Parent selectProgramWindow = loader.load();
        SelectProgramWindow controller = loader.getController();
        controller.setPrograms(programs);

        Stage stage = new Stage();
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setTitle("Select Program");
        stage.setScene(new Scene(selectProgramWindow, 500, 400 ));
        stage.showAndWait();

        return controller.getSelectedProgram();
    }
}
