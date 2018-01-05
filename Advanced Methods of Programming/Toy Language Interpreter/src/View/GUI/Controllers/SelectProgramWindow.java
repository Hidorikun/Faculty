package View.GUI.Controllers;

import Controller.ToyProgramController;
import Model.ProgramState;
import Model.ToyProgram;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.stage.Stage;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

public class SelectProgramWindow implements Initializable{

    @FXML
    private ListView<String> programsView;
    @FXML
    private Button cancelButton;
    @FXML
    private Button selectButton;

    private ToyProgramController selectedProgram;

    private List<ToyProgramController> programs;

    public SelectProgramWindow(){
        programs = new ArrayList<>();
        selectButton = null;
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle){
    }

    public void cancelButtonAction(){
        Stage stage = (Stage) cancelButton.getScene().getWindow();
        stage.close();
    }

    public void selectButtonAction() {
        int index = programsView.getSelectionModel().getSelectedIndex();
        selectedProgram = programs.get(index);
        Stage stage = (Stage) cancelButton.getScene().getWindow();
        stage.close();
    }

    public void setPrograms(List<ToyProgramController> programs) {
        this.programs = programs;
        programsView.setItems(FXCollections.observableArrayList(programs.stream().map(ToyProgramController::toString).collect(Collectors.toList())));
    }

    public ToyProgramController getSelectedProgram() {
        return selectedProgram;
    }
}