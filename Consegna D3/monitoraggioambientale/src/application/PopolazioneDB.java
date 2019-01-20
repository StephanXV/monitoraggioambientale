package application;
import model.Sensore;
import model.Valori;
import model.Sensore.Tipo;

import static DAO.MainDAO.*;

public class PopolazioneDB {
	
public static void main (String[] args) throws Exception {
		
		int i;
		int tot=200; 
		int z=1;
		
		for (i=1;i<=tot;i++) {
		Valori valoriAss = new Valori(i);
		}
		
		System.out.println("valori_associati inseriti");
		
		registraUtenteDati(25, "Lillo", "Brillo", "324567894", "Citta", "utentecitta", "utente");
		
		System.out.println("utente inserito");
		
		registraCittaDati(1, "L'Aquila", 25);
		
		System.out.println("città inserita");
		
		for (i=1;i<=4;i++) {
			registraUtenteDati(i+20, "Mario", "Rossi", ""+(i+20), "Zona", "utente"+(i+20), "utente");
			registraZonaDati(i, "zona"+i, i+20, 1);
		}
		
		System.out.println("zone e utenti inseriti");
		
		for (i=1;i<=20;i++) {
			registraUtenteDati(i, "Mario", "Rossi", ""+i, "Edificio", "utente"+i, "utente");
			registraEdificioDati(i, "edificio"+i, i, z);
			if (i % 5 == 0) z++;
		}
		
		System.out.println("edifici e utenti inseriti");
        z=1;
		for (i=1;i<=tot;i++) {
		    if (i % 4 == 0) {
		    	registraStanzaDati(i, "stanza"+i, (i-1) % 2, i, "high", z );
		    }
		    else {
			    registraStanzaDati(i, "stanza"+i, (i-1) % 2, i, "low", z );
		    }
			if (i % 10 == 0) z++;
		}
		
		System.out.println("stanze inseriti");
		z=1;
		for (i=0;i<tot;i++) {
			Sensore sensore1 = new Sensore(i*3+(i+1), "S"+(i*3+(i+1)), Tipo.temperatura, i+1, 1);                  
			Sensore sensore2 = new Sensore(i*3+(i+2), "S"+(i*3+(i+2)), Tipo.pressione, i+1, 1);                    
			Sensore sensore3 = new Sensore(i*3+(i+3), "S"+(i*3+(i+3)), Tipo.luminosita, i+1, 1);                   
			Sensore sensore4 = new Sensore(i*3+(i+4), "S"+(i*3+(i+4)), Tipo.umidita, i+1, 1);
		}
		
		for (i=801; i<=950; i++) {
			Sensore sensore5 = new Sensore(i, "S"+i, Tipo.temperatura, i-800, 1);
		} 
		
		z=951;
		for (i=1; i<=200; i++) {
			if (i % 4 == 0) {
				Sensore sensore6 = new Sensore(z, "S"+(i+950), Tipo.fumo, i, 1);
				z++;
			}
		}
		
		System.out.println("sensori inseriti");
		
		
	}

}
