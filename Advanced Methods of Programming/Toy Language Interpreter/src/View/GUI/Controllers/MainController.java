package View.GUI.Controllers;

import Controller.ToyProgramController;
import Model.ToyProgram;
import Util.Pair;
import Util.ProgramGenerator;
import View.GUI.SelectProgramWindow;
import View.GUI.ThemesManager;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.BorderPane;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

public class MainController implements Initializable{

    @FXML
    public TextField prgStatesNr;
    @FXML
    public TableView<Pair<Integer, Integer>> heapView;
    @FXML
    public TableView<Pair<String, Integer>> symTableView;
    @FXML
    public TableView<Pair<Integer, String>> fileTableView;
    @FXML
    public ListView<String> outputView;
    @FXML
    public ListView<String> programView;
    @FXML
    public ListView<Integer> threadView;
    @FXML
    public ListView<String> stackView;
    @FXML
    public TableColumn<Pair<String, Integer>, String> symVarColumn;
    @FXML
    public TableColumn<Pair<String, Integer>, Integer> symValueColumn;
    @FXML
    public TableColumn<Pair<Integer, Integer>, Integer> heapAddrColumn;
    @FXML
    public TableColumn<Pair<Integer, Integer>, Integer> heapValueColumn;
    @FXML
    public TableColumn<Pair<Integer, String>, Integer> fileHandleColumn;
    @FXML
    public TableColumn<Pair<Integer, String>, Integer> fileNameColumn;
    @FXML
    public Menu changeTheme;
    @FXML
    public BorderPane borderPane;

    private List<ToyProgramController> toyProgramControllers = new ArrayList<>();
    private ToyProgramController current;
    private List<ToyProgram> programs;
    private int currentThread;

    public MainController() {

        try{
            toyProgramControllers = ProgramGenerator.generatePrograms();
            current = toyProgramControllers.get(0);
            programs = current.getPrograms();
            currentThread = current.getAnyThreadId();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        symVarColumn.setCellValueFactory(new PropertyValueFactory<>("first"));
        symValueColumn.setCellValueFactory(new PropertyValueFactory<>("second"));

        heapAddrColumn.setCellValueFactory(new PropertyValueFactory<>("first"));
        heapValueColumn.setCellValueFactory(new PropertyValueFactory<>("second"));

        fileHandleColumn.setCellValueFactory(new PropertyValueFactory<>("first"));
        fileNameColumn.setCellValueFactory(new PropertyValueFactory<>("second"));

        threadView.getSelectionModel().select(0);
        selectTheme();
        updateGUI();
    }

    public void runOneStep(){
        try {
            current.oneStepFOrAllPrograms(programs);
            programs = current.getPrograms();
            updateGUI();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateGUI(){
        prgStatesNr.setText(current.getPrgStatesNr());
        programView.setItems(FXCollections.observableArrayList(current.getThread(currentThread).toString().split("\n")));
        outputView.setItems(FXCollections.observableArrayList(current.getOutput().split("\n")));
        threadView.setItems(FXCollections.observableArrayList(current.getThreadIds()));
        stackView.setItems(FXCollections.observableArrayList(current.getStack(currentThread)));
        heapView.setItems(FXCollections.observableArrayList(current.getHeap()));
        symTableView.setItems(FXCollections.observableArrayList(current.getSymTable(currentThread)));
        fileTableView.setItems(FXCollections.observableArrayList(current.getFileTable()));
    }

    private void updateTheme(){
        Scene scene = borderPane.getScene();
        scene.getStylesheets().clear();

        if (ThemesManager.getInstance().getCurrent().endsWith("default")){
            return;
        }

        try{
            scene.getStylesheets().add(ThemesManager.getInstance().getCurrent());
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void selectThread(){
        currentThread = threadView.getSelectionModel().getSelectedItems().get(0);
        updateGUI();
    }

    public void selectProgram() throws IOException {
        SelectProgramWindow selectProgramWindow = new SelectProgramWindow();
        ToyProgramController selectedProgram = selectProgramWindow.display(toyProgramControllers);
        if (selectedProgram != null){
            current = selectedProgram;
            currentThread = current.getAnyThreadId();
            programs = current.getPrograms();
            updateGUI();
        }
    }

    public void selectTheme(){
        changeTheme.getItems().clear();

        MenuItem defaultItem = new MenuItem("default");
        defaultItem.setOnAction(e -> {
            ThemesManager.getInstance().setTheme(defaultItem.getText());
            updateTheme();
        });
        changeTheme.getItems().add(defaultItem);

        for (String theme : ThemesManager.getInstance().getThemes()){
            MenuItem themeItem = new MenuItem(theme);
            themeItem.setOnAction(e -> {
                ThemesManager.getInstance().setTheme(themeItem.getText());
                updateTheme();
            });
            changeTheme.getItems().add(themeItem);
        }
    }
}