
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

import DAO.MainDAO;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{
    	      
   
        Parent root = FXMLLoader.load(getClass().getResource("layouts/DB_Page.fxml"));
        primaryStage.setTitle("Connessione");
        primaryStage.setScene(new Scene(root, 400, 400));

        primaryStage.show();
    
    }

    public static void main(String[] args) {
        launch(args);
    }
}
