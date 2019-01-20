package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SetValuesDAO {

    public static ArrayList<String> getValoriAssociati(String stanza) {
        try {
            String query = "SELECT Min_ValueTemperatura, Max_ValueTemperatura, Min_ValueUmidita, Max_ValueUmidita,\n" +
                    "\t   Min_ValuePressione, Max_ValuePressione, Min_ValueLuminosita, Max_ValueLuminosita FROM Stanza join Valori_Associati \n" +
                    "where Stanza.ID_ValoriAssociati = Valori_Associati.ID and Stanza.nome = '" + stanza + "';";

            Connection connessione = MainDAO.connessioneDB();
            PreparedStatement cmd = connessione.prepareStatement(query);
            ResultSet rs;
            rs = cmd.executeQuery(query);
            ArrayList<String> list = new ArrayList<String>();
            rs.next();
            list.add(rs.getString("Min_ValueTemperatura"));
            list.add(rs.getString("Max_ValueTemperatura"));
            list.add(rs.getString("Min_ValueUmidita"));
            list.add(rs.getString("Max_ValueUmidita"));
            list.add(rs.getString("Min_ValuePressione"));
            list.add(rs.getString("Max_ValuePressione"));
            list.add(rs.getString("Min_ValueLuminosita"));
            list.add(rs.getString("Max_ValueLuminosita"));

            cmd.close();
            connessione.close();
            return list;
        } catch (Exception ex) {
            ex.getStackTrace();
            return null;
        }
    }

    public static boolean updateValue(String nomeStanza, String variabileAmb, double newValue) throws SQLException {


        String sql = "(select ID_ValoriAssociati from Stanza where nome = '" + nomeStanza + "');";
        String up = "Update Valori_Associati Set " + variabileAmb + " = " + newValue + " where ID = " + sql + ";";

        Connection connessione = MainDAO.connessioneDB();

        PreparedStatement cmd = connessione.prepareStatement(up);

        cmd.executeUpdate();
        cmd.close();



        connessione.close();

        return true;
    }

}

