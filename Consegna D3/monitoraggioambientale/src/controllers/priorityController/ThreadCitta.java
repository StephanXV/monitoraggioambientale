package controllers.priorityController;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;
import java.util.TreeMap;


import static DAO.CityDAO.conteggio;
import static DAO.ZoneDAO.getName;


public class ThreadCitta  {
	ArrayList<Integer> list = new ArrayList<Integer>();
    int id_citta;
	Map<String, Integer> mappa_zone = new TreeMap<String,Integer>();
    public ThreadCitta (int id_citta) {
    	this.id_citta=id_citta;
    }
    
	public Map<String,Integer> run() {
	  try {
		list=conteggio(id_citta);
		  
		  for (Integer i : list) {
		     ThreadZona apri_edifici = new ThreadZona(i);
	         Map<String, Integer> mappa_edifici = apri_edifici.run();
			 int priorita_zona = Collections.max(mappa_edifici.entrySet(), Comparator.comparingInt(Map.Entry::getValue)).getValue();
	         mappa_zone.put(getName(i), priorita_zona);
		  }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return mappa_zone;

	}
}
