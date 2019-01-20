package DAO;

import java.sql.*;

public class MainDAO {
	private static String portaDB;
	private static String username;
	private static String password;
	
	public static void getDB(String porta, String user, String pass){
		portaDB = porta;
		username = user;
		password = pass;		
	}

	public static Connection connessioneDB() {
		
			
		Connection conn = null;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:"+portaDB+"/monitoraggio?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false", username, password);
		}
		catch (SQLException ex)
		{
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("ERROR:" + ex.getErrorCode());
			ex.printStackTrace();
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		
		//System.out.println("Connessione al Database andata a buon fine");
		return conn;
	}

	public static boolean registraCittaDati(int id_citta, String nome, int id_gestore) throws SQLException {


		String query = "Insert into Citta (ID,nome,ID_gestore) values(?,?,?);";

		Connection connessione = MainDAO.connessioneDB();

		PreparedStatement cmd = connessione.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
		cmd.setInt(1, id_citta);
		cmd.setString(2, nome);
		cmd.setInt(3, id_gestore);



		cmd.executeUpdate();
		cmd.close();
		connessione.close();

		return true;
	}

	public static boolean registraEdificioDati(int id_edificio, String nome, int id_gestore, int id_zona) throws SQLException {


		String query = "Insert into Edificio (ID,nome,ID_gestore,ID_zona) values(?,?,?,?);";

		Connection connessione = MainDAO.connessioneDB();

		PreparedStatement cmd = connessione.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
		cmd.setInt(1, id_edificio);
		cmd.setString(2, nome);
		cmd.setInt(3, id_gestore);
		cmd.setInt(4, id_zona);



		cmd.executeUpdate();
		cmd.close();
		connessione.close();

		return true;
	}

	public static boolean registraStanzaDati(int id_stanza, String nome, int piano, int valori_ass, String priorita, int id_edificio) throws SQLException {


		String query = "Insert into Stanza (ID,nome,piano,ID_ValoriAssociati,priorita,ID_edificio) values(?,?,?,?,?,?);";

		Connection connessione = MainDAO.connessioneDB();

		PreparedStatement cmd = connessione.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
		cmd.setInt(1, id_stanza);
		cmd.setString(2, nome);
		cmd.setInt(3, piano);
		cmd.setInt(4,valori_ass);
		cmd.setString(5, priorita);
		cmd.setLong(6, id_edificio);



		cmd.executeUpdate();
		cmd.close();
		connessione.close();

		return true;
	}

	public static boolean registraUtenteDati(int id_utente, String nome, String cognome, String numero_telefono, String tipo, String username, String password) throws SQLException {


		String query = "Insert into Utente (ID,nome,cognome,numero_telefono,tipo,username,pass_word) values(?,?,?,?,?,?,?);";

		Connection connessione = MainDAO.connessioneDB();

		PreparedStatement cmd = connessione.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
		cmd.setInt(1, id_utente);
		cmd.setString(2, nome);
		cmd.setString(3, cognome);
		cmd.setString(4,numero_telefono);
		cmd.setString(5, tipo);
		cmd.setString(6, username);
		cmd.setString(7, password);


		cmd.executeUpdate();
		cmd.close();
		connessione.close();

		return true;
	}

	public static boolean registraZonaDati(int id_zona, String nome, int id_gestore, int id_citta) throws SQLException {


		String query = "Insert into Zona (ID,nome,ID_gestore,ID_citta) values(?,?,?,?);";

		Connection connessione = MainDAO.connessioneDB();

		PreparedStatement cmd = connessione.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
		cmd.setInt(1, id_zona);
		cmd.setString(2, nome);
		cmd.setInt(3, id_gestore);
		cmd.setInt(4, id_citta);



		cmd.executeUpdate();
		cmd.close();

		return true;
	}

	public static boolean registraValoriAssociati(int id,double min_temp, double max_temp, double min_lum, double max_lum, double min_pres, double max_pres,
												  double min_hum, double max_hum) throws SQLException {


		String query = "Insert into Valori_Associati (ID,Min_ValueTemperatura, Max_ValueTemperatura, Min_ValuePressione, Max_ValuePressione, Min_ValueUmidita, Max_ValueUmidita, Min_ValueLuminosita, Max_ValueLuminosita) values(?,?,?,?,?,?,?,?,?);";

		Connection connessione = MainDAO.connessioneDB();
		PreparedStatement cmd = connessione.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
		cmd.setInt(1, id);
		cmd.setDouble(2, min_temp);
		cmd.setDouble(3, max_temp);
		cmd.setDouble(4, min_pres);
		cmd.setDouble(5, max_pres);
		cmd.setDouble(6, min_hum);
		cmd.setDouble(7, max_hum);
		cmd.setDouble(8, min_lum);
		cmd.setDouble(9, max_lum);

		cmd.executeUpdate();
		cmd.close();
		connessione.close();

		return true;
	}


}

