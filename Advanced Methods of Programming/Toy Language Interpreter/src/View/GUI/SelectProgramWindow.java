package View.GUI;

import Controller.ToyProgramController;
import View.GUI.Controllers.SelectProgramController;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.List;

public class SelectProgramWindow {
    public ToyProgramController display(List<ToyProgramController> programs) throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("Views/SelectProgramView.fxml"));
        Parent selectProgramWindow = loader.load();
        SelectProgramController controller = loader.getController();
        controller.setPrograms(programs);

        Stage stage = new Stage();
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setTitle("Select Program");
        stage.getIcons().add(new Image("/Assets/selectIcon.png"));

        Scene scene = new Scene(selectProgramWindow, 500, 400 );
        scene.getStylesheets().clear();
        scene.getStylesheets().add(ThemesManager.getInstance().getCurrent());

        stage.setScene(scene);
        stage.showAndWait();

        return controller.getSelectedProgram();
    }
}
