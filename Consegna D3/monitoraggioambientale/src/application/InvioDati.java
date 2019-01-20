package application;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DAO.MainDAO;
import controllers.priorityController.ExtractData;

import model.Sensore.Tipo;

public class InvioDati {
	
 public static void main (String[] args) throws SQLException {
	int tot=200;
	int i;
	
	List<ExtractData> eList = new ArrayList<ExtractData>();
	Connection connessione = MainDAO.connessioneDB();
	
	for (i=0;i<tot;i++) {
		          
		
		ExtractData e1 = new ExtractData(i*3+(i+1), Tipo.temperatura, connessione);
		eList.add(e1);
		
		ExtractData e2 = new ExtractData(i*3+(i+2), Tipo.pressione, connessione);
		eList.add(e2);
		
		ExtractData e3 = new ExtractData(i*3+(i+3), Tipo.luminosita, connessione);
		eList.add(e3);
		
		ExtractData e4 = new ExtractData(i*3+(i+4), Tipo.umidita, connessione);
		eList.add(e4);
		
	}
	
	for (i=801; i<=950; i++) {
		ExtractData e5 = new ExtractData(i, Tipo.temperatura, connessione);
		eList.add(e5);
	} 
	
	
	for (i=951; i<=1000; i++) {
		if (i % 10 == 0) {
			ExtractData e6 = new ExtractData(i, Tipo.fumo, connessione);
			eList.add(e6);
		}
	}
	eList.parallelStream().forEach(ExtractData::start);
 }

}
