package View.GUI;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main extends Application {

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent mainWindow = FXMLLoader.load(getClass().getResource("Views/MainWindow.fxml"));


        primaryStage.setTitle("Toy Language Interpreter");
        primaryStage.setScene(new Scene(mainWindow, 1000, 800 ));
        primaryStage.show();
    }
}
