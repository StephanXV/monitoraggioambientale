package DAO;

import java.util.Map;
import java.util.TreeMap;

public class TestMostraMappa {
	/*public static void main(String[] args) {
        TreeMap<String, Integer> map = new TreeMap<String, Integer>();

        map.put("A", 4);
        map.put("B", 2);
        map.put("C", 4);
        map.put("D", 1);
        
        TreeMap<String, Integer> new_mappa = mappaPericolo(map);

        System.out.println("map: " + map);
        System.out.println("new map: " + new_mappa);
    }*/
	
	public static Map<String, Integer> mappaPericolo(Map<String, Integer> mappa){
		Map<String, Integer> new_map = new TreeMap<>();
		
		for (Map.Entry<String, Integer> entry : mappa.entrySet()) {
			if (entry.getValue()==4) new_map.put(entry.getKey(), 4);
		}
		
		return new_map;
	}
}
