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
    @FXML
    public TableView<Pair<Integer, Integer>> lockView;
    @FXML
    public TableColumn<Pair<Integer, Integer>, Integer> lockLocationColumn;
    @FXML
    public TableColumn<Pair<Integer, Integer>, Integer> lockValueColumn;
    @FXML
    public TableView<Pair<Integer, Pair<List<Integer>, Integer>>> barrierView;
    @FXML
    public TableColumn<Pair<Integer, Pair<List<Integer>, Integer>>, Pair<List<Integer>, Integer>> barrierValueColumn;
    @FXML
    public TableColumn<Pair<Integer, Pair<List<Integer>, Integer>>, Integer> barrierAddrColumn;

    private List<ToyProgramController> toyProgramControllers = new ArrayList<>();
    private ToyProgramController currentProgram;
    private List<ToyProgram> programs;
    private int currentThread;

    public MainController() {

        try{
            toyProgramControllers = ProgramGenerator.generatePrograms();
            currentProgram = toyProgramControllers.get(0);
            programs = currentProgram.getPrograms();
            currentThread = currentProgram.getAnyThreadId();
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

        lockLocationColumn.setCellValueFactory(new PropertyValueFactory<>("first"));
        lockValueColumn.setCellValueFactory(new PropertyValueFactory<>("second"));

        barrierAddrColumn.setCellValueFactory(new PropertyValueFactory<>("first"));
        barrierValueColumn.setCellValueFactory(new PropertyValueFactory<>("second"));

        threadView.getSelectionModel().select(0);
        selectTheme();
        updateGUI();
    }

    public void runOneStep(){
        try {
            currentProgram.oneStepFOrAllPrograms(programs);
            programs = currentProgram.getPrograms();
            updateGUI();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateGUI(){
        prgStatesNr.setText(currentProgram.getPrgStatesNr());
        outputView.setItems(FXCollections.observableArrayList(currentProgram.getOutput().split("\n")));
        threadView.setItems(FXCollections.observableArrayList(currentProgram.getThreadIds()));
        programView.setItems(FXCollections.observableArrayList(currentProgram.getThread(currentThread).toString().split("\n")));
        stackView.setItems(FXCollections.observableArrayList(currentProgram.getStack(currentThread)));
        heapView.setItems(FXCollections.observableArrayList(currentProgram.getHeap(currentThread)));
        symTableView.setItems(FXCollections.observableArrayList(currentProgram.getSymTable(currentThread)));
        fileTableView.setItems(FXCollections.observableArrayList(currentProgram.getFileTable(currentThread)));
        lockView.setItems(FXCollections.observableArrayList(currentProgram.getLockTable(currentThread)));
        barrierView.setItems(FXCollections.observableArrayList(currentProgram.getBarrierTable(currentThread)));
    }

    private void updateTheme(){
        Scene scene = borderPane.getScene();
        scene.getStylesheets().clear();

        if (ThemesManager.getInstance().getCurrentTheme().endsWith("default")){
            return;
        }

        try{
            scene.getStylesheets().add(ThemesManager.getInstance().getCurrentTheme());
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void selectThread(){
        currentThread = threadView.getSelectionModel().getSelectedItems().get(0);
        System.out.println("thread" + currentProgram.toString());
        updateGUI();
    }

    public void selectProgram() throws IOException {
        SelectProgramWindow selectProgramWindow = new SelectProgramWindow();
        ToyProgramController selectedProgram = selectProgramWindow.display(toyProgramControllers);
        if (selectedProgram != null){
            currentProgram = selectedProgram;
            currentThread = currentProgram.getAnyThreadId();
            programs = currentProgram.getPrograms();
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