package controllers.priorityController;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;

import DAO.SensorDAO;
import model.Sensore;
import model.Sensore.Tipo;

import static DAO.SensorDAO.sendDati;

public class ExtractData extends Thread implements Serializable {
		 long step;
		 int id;
		 Tipo tipo;
		 double last_data;
		 Connection connessione;
		 public ExtractData(int id, Tipo tipo, Connection connessione){
		  this.id=id;
		  this.tipo=tipo;
		  this.connessione=connessione;
		 }
		 public void run(){
		 while (true) {
		 this.last_data=Sensore.GenerateData(tipo);
		 //System.out.println(id+"  "+last_data);
		 try {
			ExtractData.push(this.last_data, this.id, connessione);
			step = SensorDAO.getTime(this.id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			 //System.out.println(step);
		    sleep(step);
		 } catch (Exception ex){
		 }
		 }
		 }
		 
	     public static boolean push (double last_data, int sensor_id, Connection connessione) throws SQLException {
				boolean risposta = sendDati(last_data, sensor_id, connessione);
				return true;
		}
}


