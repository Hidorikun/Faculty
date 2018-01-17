package View.GUI;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;

public class MainWindow extends Application {

    public void show(){
        launch();
    }

    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent mainWindow = FXMLLoader.load(getClass().getResource("Views/MainWindowView.fxml"));

        primaryStage.setTitle("Toy Language Interpreter");
        primaryStage.getIcons().add(new Image("/Assets/mainIcon.png"));

        Scene scene = new Scene(mainWindow, 1000, 800 );

        scene.getStylesheets().clear();
        scene.getStylesheets().add(ThemesManager.getInstance().getCurrent());

        primaryStage.setScene(scene);
        primaryStage.show();
    }
}
