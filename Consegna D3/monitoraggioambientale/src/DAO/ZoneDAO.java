package DAO;

import java.sql.*;
import java.util.ArrayList;

public class ZoneDAO {
    public static String getZonaMonitorata (String username) throws SQLException {

        Connection connessione = MainDAO.connessioneDB();

        String query = "select Zona.nome as nome from Zona join Utente where Zona.ID_gestore = Utente.ID and\n" +
                "\t\t\t\t\t\t\t\t\t\t\tUtente.username = '" + username +"'";

        PreparedStatement st;
        ResultSet rs;

        st = connessione.prepareStatement(query);
        rs = st.executeQuery(query);

        rs.next();

        return rs.getString("nome");
    }

    public static Double avg_edificio_temp(String zona) {

        Double avg_temp = 0.00;

        try {
            Connection connessione = MainDAO.connessioneDB();
            String query = "{CALL avg_edificio_temp(?)}";
            CallableStatement stmt = connessione.prepareCall(query);

            stmt.setString(1, zona);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                avg_temp = rs.getDouble("avg_temp");
            }

            connessione.close();

            return avg_temp;
        } catch (Exception ex) {
            ex.printStackTrace();
            return avg_temp;
        }
    }

    public static Double avg_edificio_um(String zona) {

        Double avg_um = 0.00;

        try {
            Connection connessione = MainDAO.connessioneDB();
            String query = "{CALL avg_edificio_um(?)}";
            CallableStatement stmt = connessione.prepareCall(query);

            stmt.setString(1, zona);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                avg_um = rs.getDouble("avg_um");
            }

            connessione.close();

            return avg_um;
        } catch (Exception ex) {
            ex.printStackTrace();
            return avg_um;
        }
    }

    public static Double avg_edificio_pres(String zona) {

        Double avg_pres = 0.00;

        try {
            Connection connessione = MainDAO.connessioneDB();
            String query = "{CALL avg_edificio_pres(?)}";
            CallableStatement stmt = connessione.prepareCall(query);

            stmt.setString(1, zona);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                avg_pres = rs.getDouble("avg_pres");
            }

            connessione.close();

            return avg_pres;
        } catch (Exception ex) {
            ex.printStackTrace();
            return avg_pres;
        }
    }

    public static Double avg_edificio_lum(String zona) {

        Double avg_lum = 0.00;

        try {
            Connection connessione = MainDAO.connessioneDB();
            String query = "{CALL avg_edificio_lum(?)}";
            CallableStatement stmt = connessione.prepareCall(query);

            stmt.setString(1, zona);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                avg_lum = rs.getDouble("avg_lum");
            }

            connessione.close();

            return avg_lum;
        } catch (Exception ex) {
            ex.printStackTrace();
            return avg_lum;
        }
    }

    public static ArrayList<Integer> conteggio (int id_zona) throws SQLException {

        ArrayList<Integer> list = new ArrayList<Integer>();

        Connection connessione = MainDAO.connessioneDB();
        String query = "CALL conta_edifici ("+id_zona+")";


        CallableStatement st;
        ResultSet rs;


        st = connessione.prepareCall(query);
        rs = st.executeQuery(query);
        while (rs.next()) {
            list.add(rs.getInt("ID"));
        }
        return list;
    }

    public static int getID (String username) throws SQLException {

        int count;

        Connection connessione = MainDAO.connessioneDB();
        String query = "CALL getIdZona ("+"'"+username+"'"+")";


        CallableStatement st;
        ResultSet rs;


        st = connessione.prepareCall(query);
        rs = st.executeQuery(query);
        rs.next();
        count = rs.getInt("ID");
        return count;
    }

    public static String getName (int id_zona) throws SQLException {

        Connection connessione = MainDAO.connessioneDB();

        String query = "SELECT nome FROM Zona WHERE ID=" + id_zona;
        PreparedStatement st;
        ResultSet rs;

        st = connessione.prepareStatement(query);
        rs = st.executeQuery(query);

        rs.next();

        return rs.getString("nome");
    }
}
