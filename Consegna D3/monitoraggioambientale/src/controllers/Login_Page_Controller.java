package controllers;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Stage;
import javafx.util.Duration;
import model.Gestore;
import static java.lang.Thread.sleep;
import static DAO.LoginDAO.getUser;

public class Login_Page_Controller {

    private static Gestore utente;
    private int count = 0;

    @FXML   //fx:id="errors:field"
    private Label errors_field;

    @FXML   //fx:id="email_textfield"
    private TextField username_textfield;

    @FXML   //fx:id="password_textfield"
    private PasswordField password_field;

    @FXML   //fx:id="entra_textfield"
    private Button entra_button;

    @FXML
    void initialize() {
    }

    @FXML //Called when the "entra" button is fired
    void entraIsFired(ActionEvent event) {
        /*
         * Al clic del pulsante entra vengono controllati
         * email e password inseriti; nel database quindi
         * si cerca un match esistente altrimenti viene
         * mostrato un errore. A seconda del tipo di gestore
         * verrà mostrata la giusta schermata di monitoraggio
         * popolata con le giuste informazioni.
         */
        String tipo = "";
        try {
            utente = new Gestore(username_textfield.getText(), password_field.getText());
            tipo = getUser(utente.getUsername(), utente.getPass_word());
            System.out.println(tipo);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        if (tipo == "") {
            count++;
            System.out.println(count);
            if (count==5){
                try {
                    count = 0;
                    sleep(60000);
                } catch (Exception ex){
                    ex.getStackTrace();
                }
            }
            else
                errors_field.setText("username e/o password non valide");
        }
        else if (tipo.equals("Citta")) {
            try {
                System.out.println(tipo);
                Parent city_page_parent = FXMLLoader.load(getClass().getResource("/layouts/City_Page.fxml"));

                // restituisce la finestra che ha generato l'event
                Stage current_page = (Stage) ((Node) event.getSource()).getScene().getWindow();
                current_page.setTitle("Monitoraggio Citta");
                Scene city_page = new Scene(city_page_parent);
                current_page.hide(); // hide chiude la finestra
                current_page.setScene(city_page);
                current_page.show();
            } catch (Exception e) {
                System.out.println("Can't load City Page");
            }
        } else if (tipo.equals("Zona")) {
            try {
                System.out.println(tipo);
                Parent zone_page_parent = FXMLLoader.load(getClass().getResource("/layouts/Zone_Page.fxml"));

                // restituisce la finestra che ha generato l'event
                Stage current_page = (Stage) ((Node) event.getSource()).getScene().getWindow();
                current_page.setTitle("Monitoraggio Zona");
                Scene zone_page = new Scene(zone_page_parent);
                current_page.hide(); // hide chiude la finestra
                current_page.setScene(zone_page);
                current_page.show();
            } catch (Exception e) {
                System.out.println("Can't load Zone Page");
            }
        } else if (tipo.equals("Edificio")) {
            try {
                System.out.println(tipo);
                Parent building_page_parent = FXMLLoader.load(getClass().getResource("/layouts/Building_Page.fxml"));
                System.out.println("path caricato");

                // restituisce la finestra che ha generato l'event
                Stage current_page = (Stage) ((Node) event.getSource()).getScene().getWindow();
                current_page.setTitle("Monitoraggio Edificio");
                Scene building_page = new Scene(building_page_parent);
                current_page.hide(); // hide chiude la finestra
                current_page.setScene(building_page);
                current_page.show();
            } catch (Exception e) {
                System.out.println("Can't load Building Page");
            }
        }
        else if (tipo.equals("Amministratore")) {
            try {
                System.out.println(tipo);
                Parent admin_page_parent = FXMLLoader.load(getClass().getResource("/layouts/Admin_Page.fxml"));

                // restituisce la finestra che ha generato l'event
                Stage current_page = (Stage) ((Node) event.getSource()).getScene().getWindow();
                current_page.setTitle("Amministrazione");
                Scene admin_page = new Scene(admin_page_parent);
                current_page.hide(); // hide chiude la finestra
                current_page.setScene(admin_page);
                current_page.show();
            } catch (Exception e) {
                System.out.println("Can't load Admin Page");
            }
        }
    }

    public static String getUtente(){
        return utente.getUsername();
    }
}