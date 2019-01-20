package controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import java.util.ArrayList;
import java.util.List;
import static DAO.AdminDAO.*;

public class Admin_Page_Controller {

    private String passUsr;

    @FXML
    private Label message;

    @FXML
    private Label risPass;

    @FXML
    private ComboBox tipoIns;

    @FXML
    private ComboBox tipoArea;

    @FXML
    private TextField nomeArea;

    @FXML
    private TextField usernameArea;

    @FXML
    private TextField nomeIns;

    @FXML
    private TextField cognomeIns;

    @FXML
    private TextField celIns;

    @FXML
    private TextField usernameIns;

    @FXML
    private TextField passIns;

    @FXML
    private TextField usernameMod;

    @FXML
    private TextField passMod;

    @FXML
    private Button saveIns;

    @FXML
    private Button saveArea;

    @FXML
    private Button recuperaMod;

    @FXML
    private Button aggiornaMod;


    @FXML
    void initialize(){
            risPass.setStyle("-fx-text-fill: GREEN; -fx-font-size: 16px;");
            message.setStyle("-fx-text-fill: WHITE; -fx-font-size: 16px; -fx-background-color: #575757");
            List<String> list = new ArrayList<String>();
            list.add("Edifico");
            list.add("Zona");
            list.add("Citta");
            ObservableList obList = FXCollections.observableList(list);
            tipoArea.getItems().clear();
            tipoArea.setItems(obList);
            tipoArea.setValue(list.get(0));

            tipoIns.getItems().clear();
            tipoIns.setItems(obList);
            tipoIns.setValue(list.get(0));



    }

    @FXML
    void salvaArea_Fired(ActionEvent event){
        try {
            updateAreaGestita((String) tipoArea.getValue(), nomeArea.getText(), usernameArea.getText());
            message.setText("L'area " + nomeArea.getText() + " e stata assegnata al gestore " + usernameArea.getText());
        } catch (Exception ex){
            message.setText("Errore: inserire correttamente i dati richiesti");
        }
    }

    @FXML
    void salvaIns_IsFired(ActionEvent event){
        try {
            insertGestore(nomeIns.getText(), cognomeIns.getText(), celIns.getText(), (String) tipoIns.getValue(), usernameIns.getText(), passIns.getText() );
            message.setText("Gestore inserito");
        } catch (Exception ex){
            message.setText("Errore: Inserire tutti i dati");
        }
    }

    @FXML
    void salvaAggPass_Fired(ActionEvent event){
        try {
            passUsr = showPass(usernameMod.getText());
            risPass.setText("PASSWORD: " + passUsr);
            message.setText("La password dell'utente " + usernameMod.getText() + " e: " + passUsr);
        } catch (Exception ex){
            message.setText("Errore: Utente inserito non esistente");
        }
    }

    @FXML
    void salvaModPass_Fired(ActionEvent event){
        try {
            updatePass(usernameMod.getText(), passMod.getText());
            message.setText("Nuova password: " + passMod.getText());
        } catch (Exception ex){
            message.setText("Errore: Utente inserito non esistente");
        }
    }
}
