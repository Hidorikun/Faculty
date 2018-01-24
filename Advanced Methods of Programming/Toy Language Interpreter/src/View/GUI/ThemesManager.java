package View.GUI;

import javafx.scene.Scene;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ThemesManager
{
    private static ThemesManager obj;

    private String currentTheme;
    private String themesPath;

    private ThemesManager(){
        themesPath = "View/GUI/Themes";
        currentTheme = "snow.css";
    }

    public static ThemesManager getInstance(){
        if (obj == null){
            obj = new ThemesManager();
        }
        return obj;
    }

    public List<String> getThemes(){
        File themesFolder = new File("src/"+ themesPath);
        File[] files = themesFolder.listFiles();
        List<String> themes = new ArrayList<>();

        if (files != null ){
            for (File file : files) {
                themes.add(file.getName());
            }
        }

        return themes;
    }

    public void setTheme(String theme){
        currentTheme = theme;
    }

    public String getCurrentTheme(){
        return themesPath +  "/" + currentTheme;
    }
}
