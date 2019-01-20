package controllers;

import DAO.MainDAO;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class DB_Page_Controller {
	
	@FXML
	private TextField port;
	
	@FXML
	private TextField user;
	
	@FXML
	private TextField pass;
	
	@FXML
	private Button avanti;
	
	@FXML
	void avantiIsFired(ActionEvent event){
		MainDAO.getDB(port.getText(), user.getText(), pass.getText());
		System.out.println(port.getText()+ user.getText()+ pass.getText());
		
		try {
            Parent login_page_parent = FXMLLoader.load(getClass().getResource("/layouts/Login_Page.fxml"));

            // restituisce la finestra che ha generato l'event
            Stage current_page = (Stage) ((Node) event.getSource()).getScene().getWindow();
            current_page.setTitle("Monitoraggio Zona");
            Scene login_page = new Scene(login_page_parent);
            current_page.hide(); // hide chiude la finestra
            current_page.setScene(login_page);
            current_page.show();
        } catch (Exception e) {
            System.out.println("Can't load Login Page");
        }
		
	}

}
