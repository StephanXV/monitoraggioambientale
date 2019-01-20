package DAO;

import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

public class BuildingDAO {
    public static String getEdificioMonitorato (String username) throws SQLException {

        Connection connessione = MainDAO.connessioneDB();

        String query = "select Edificio.nome as nome from Edificio join Utente where Edificio.ID_gestore = Utente.ID and\n" +
                "\t\t\t\t\t\t\t\t\t\t\tUtente.username = '" + username +"'";

        PreparedStatement st;
        ResultSet rs;

        st = connessione.prepareStatement(query);
        rs = st.executeQuery(query);

        rs.next();

        return rs.getString("nome");
    }

    public static ArrayList<Integer> conteggio (int id_edificio) throws SQLException {

        int count;
        ArrayList<Integer> list = new ArrayList<Integer>();

        Connection connessione = MainDAO.connessioneDB();
        String query = "CALL conta_stanze ("+id_edificio+")";


        CallableStatement st;
        ResultSet rs;


        st = connessione.prepareCall(query);
        rs = st.executeQuery(query);
        while (rs.next()) {
            list.add(rs.getInt("ID"));
        }
        return list;
    }

    public static String getName (int id_edificio) throws SQLException {

        Connection connessione = MainDAO.connessioneDB();

        String query = "SELECT nome FROM Edificio WHERE ID=" + id_edificio;
        PreparedStatement st;
        ResultSet rs;

        st = connessione.prepareStatement(query);
        rs = st.executeQuery(query);

        rs.next();

        return rs.getString("nome");
    }

    public static int getID (String username) throws SQLException {

        int count;

        Connection connessione = MainDAO.connessioneDB();
        String query = "CALL getIdEdificio ("+"'"+username+"'"+")";


        CallableStatement st;
        ResultSet rs;


        st = connessione.prepareCall(query);
        rs = st.executeQuery(query);
        rs.next();
        count = rs.getInt("ID");
        return count;
    }

    public static ArrayList<SensoreTabella> creaListSensori(String room_name) throws SQLException {
        //attributi stanza
        int id = 0;
        int idAss = 0;

        //attributi valori
        double min_temp=0.0;
        double max_temp=0.0;
        double min_lum=0.0;
        double max_lum=0.0;
        double min_pres=0.0;
        double max_pres=0.0;
        double min_hum=0.0;
        double max_hum=0.0;
        double min=0.0;
        double max=0.0;

        //attributi sensore
        String codice;
        String type;
        int stato;
        double last_data = 0;
        String anomalia = "";

        SensoreTabella sens1 = null;
        ArrayList<SensoreTabella> listaSens1 = new ArrayList<SensoreTabella>();


        Connection connessione = MainDAO.connessioneDB();

        //prendo la stanza
        String prova = "SELECT ID,ID_valoriAssociati FROM Stanza WHERE nome= '" + room_name + "';";
        PreparedStatement st1;
        ResultSet rs1;


        st1 = connessione.prepareStatement(prova);
        rs1 = st1.executeQuery(prova);

        while (rs1.next() == true) {
            id=rs1.getInt("ID");
            idAss=rs1.getInt("ID_ValoriAssociati");
        }

        //prendo i valori associati
        String query2 = "SELECT Min_ValueTemperatura, Max_ValueTemperatura, Min_ValuePressione, Max_ValuePressione, Min_ValueUmidita, Max_ValueUmidita, Min_ValueLuminosita, Max_ValueLuminosita FROM Valori_Associati WHERE ID = " + idAss;
        PreparedStatement st;
        ResultSet rs;


        st = connessione.prepareStatement(query2);
        rs = st.executeQuery(query2);

        while (rs.next() == true) {
            min_temp=rs.getDouble("Min_ValueTemperatura");
            max_temp=rs.getDouble("Max_ValueTemperatura");
            min_lum=rs.getDouble("Min_ValueLuminosita");
            max_lum=rs.getDouble("Max_ValueLuminosita");
            min_pres=rs.getDouble("Min_ValuePressione");
            max_pres=rs.getDouble("Max_ValuePressione");
            min_hum=rs.getDouble("Min_ValueUmidita");
            max_hum=rs.getDouble("Max_ValueUmidita");
        }

        //prendo i sensori
        String query3 = "SELECT * FROM Sensore WHERE ID_Stanza = " + id + ";";

        PreparedStatement st2;
        ResultSet rs2;
        PreparedStatement st3;
        ResultSet rs3;

        st2 = connessione.prepareStatement(query3);
        rs2 = st2.executeQuery(query3);


        while (rs2.next() == true) {
            int sensor_id =rs2.getInt("ID");
            codice=rs2.getString("codice");
            type=rs2.getString("tipo");
            if (type.equals("temperatura")) {min = min_temp - 1; max = max_temp + 1;}
            else if (type.equals("luminosita")) {min = min_lum - 99; max = max_lum + 99;}
            else if (type.equals("umidita")) {min = min_hum - 9; max = max_hum + 9;}
            else if (type.equals("pressione")) {min = min_pres -49; max = max_pres +49 ;}
            stato=rs2.getInt("stato");

            String query5 = "SELECT valore_percepito FROM Valore WHERE ID_Sensore = " + sensor_id + ";";
            st3 = connessione.prepareStatement(query5);
            rs3 = st3.executeQuery(query5);

            while (rs3.next() == true) {
                last_data = rs3.getDouble("valore_percepito");

                if (stato == 0) anomalia = "Si";
                else if (type.equals("fumo") && (last_data == 1.0)) anomalia = "Si";
                else if (!type.equals("fumo") && last_data < (min) || last_data > (max)) anomalia = "Si";
                else anomalia = "No";
            }

            sens1 = new SensoreTabella (codice, type, stato, last_data, anomalia);
            listaSens1.add(sens1);

        }

        return listaSens1;

    }

    public static StanzaTabella average (ArrayList<SensoreTabella> lista, String nomeStanza) throws SQLException {

        int temp=0;
        int lum=0;
        int pres=0;
        int um=0;
        double avT=0;
        double avL=0;
        double avP=0;
        double avU=0;
        int pianoS = 0;

        for (SensoreTabella X : lista) {
            if (X.getTipo1().equals("temperatura")) {temp++; avT+=X.getLast_data1();}
            else if (X.getTipo1().equals("luminosita")) {lum++; avL+=X.getLast_data1();}
            else if (X.getTipo1().equals("pressione")) {pres++; avP+=X.getLast_data1();}
            else if (X.getTipo1().equals("umidita")) {um++; avU+=X.getLast_data1();}
        }

        avT=avT/temp;
        avL=avL/lum;
        avP=avP/pres;
        avU=avU/um;

        Connection connessione = MainDAO.connessioneDB();
        String prova = "SELECT piano FROM Stanza WHERE nome= '" + nomeStanza + "';";
        PreparedStatement st9;
        ResultSet rs9;

        st9 = connessione.prepareStatement(prova);
        rs9 = st9.executeQuery(prova);

        while (rs9.next() == true) {
            pianoS=rs9.getInt("piano");
            System.out.println(pianoS);
        }


        StanzaTabella st = new StanzaTabella(avT, avU, avP, avL, pianoS);
        System.out.println(st);

        return st;


    }

    public static Stanza getStanza (int id_stanza) throws SQLException {

        //attributo stanza
        String room_name;
        int floor;
        ArrayList<Sensore> listaSens = new ArrayList<Sensore>();
        String priority;
        Map<String, Double> valoriAs = new TreeMap<String, Double>();
        Stanza stanza = null;

        //attributi valori
        double min_temp;
        double max_temp;
        double min_lum;
        double max_lum;
        double min_pres;
        double max_pres;
        double min_hum;
        double max_hum;
        Valori valori = null;

        //attributi sensore
        int sensor_id;
        String codice;
        String type;
        int stanza_id;
        int state;
        double last_data = 0;
        Sensore sens = null;


        try {


            Connection connessione = MainDAO.connessioneDB();

            //creo i valori associati
            String query1 = "SELECT ID_ValoriAssociati FROM Stanza WHERE ID = " + id_stanza;
            String query2 = "SELECT Min_ValueTemperatura, Max_ValueTemperatura, Min_ValuePressione, Max_ValuePressione, Min_ValueUmidita, Max_ValueUmidita, Min_ValueLuminosita, Max_ValueLuminosita FROM Valori_Associati WHERE ID = (" + query1 + ") ;";



            PreparedStatement st;
            ResultSet rs;


            st = connessione.prepareStatement(query2);
            rs = st.executeQuery(query2);

            while (rs.next() == true) {
                min_temp=rs.getDouble("Min_ValueTemperatura");
                max_temp=rs.getDouble("Max_ValueTemperatura");
                min_lum=rs.getDouble("Min_ValueLuminosita");
                max_lum=rs.getDouble("Max_ValueLuminosita");
                min_pres=rs.getDouble("Min_ValuePressione");
                max_pres=rs.getDouble("Max_ValuePressione");
                min_hum=rs.getDouble("Min_ValueUmidita");
                max_hum=rs.getDouble("Max_ValueUmidita");
                valori = new Valori (min_temp,max_temp,min_lum,max_lum,min_pres,max_pres,min_hum,max_hum); }

            //System.out.println();
            //System.out.println(valori);



            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //creo i sensori e la lista di sensori la assegno alla stanza
            String query3 = "SELECT ID,codice,tipo,stato,ID_Stanza FROM Sensore WHERE ID_Stanza = " + id_stanza + ";";

            PreparedStatement st1;
            ResultSet rs1;
            PreparedStatement st3;
            ResultSet rs3;

            st1 = connessione.prepareStatement(query3);
            rs1 = st1.executeQuery(query3);

            Sensore.Tipo tipo;





            while (rs1.next() == true) {
                sensor_id=rs1.getInt("ID");
                codice=rs1.getString("codice");
                state=rs1.getInt("stato");
                stanza_id=rs1.getInt("ID_Stanza");
                type=rs1.getString("tipo");
                tipo = Sensore.Tipo.valueOf(type);

                String query5 = "SELECT valore_percepito FROM Valore WHERE ID_Sensore = " + sensor_id + ";";
                st3 = connessione.prepareStatement(query5);
                rs3 = st3.executeQuery(query5);
                while (rs3.next() == true) {
                    last_data = rs3.getDouble("valore_percepito");
                }


                sens = new Sensore (sensor_id, codice, tipo, stanza_id, state, last_data);
                listaSens.add(sens);


            }

            //System.out.println("a");
            //System.out.println();
            //System.out.println(listaSens);


            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //creo la stanza e gli assegno i valori associati
            String query4 = "SELECT * FROM Stanza WHERE ID=" + id_stanza;
            PreparedStatement st2;
            ResultSet rs2;

            st2 = connessione.prepareStatement(query4);
            rs2 = st2.executeQuery(query4);
            Stanza.Priority pr;

            while (rs2.next() == true) {
                room_name=rs2.getString("nome");
                floor=rs2.getInt("piano");
                priority=rs2.getString("priorita"); //da mettere nel db
                pr = Stanza.Priority.valueOf(priority);

                stanza = new Stanza (room_name, floor, listaSens, pr, valori);

            }

            //System.out.println();
            //System.out.println(stanza);

			   /*CheckPriorityRoom priorita = new CheckPriorityRoom();
			   int priorita1=priorita.priorityCheck(stanza);
			   System.out.println();
			   System.out.println(stanza.getL1().get(0).toString());
				System.out.println(stanza.getL1().get(1).toString());
				System.out.println(stanza.getL1().get(2).toString());
				System.out.println(stanza.getL1().get(3).toString());
				System.out.println(stanza.getL1().get(4).toString());
				System.out.println();
		        System.out.println("La priorit� della " + stanza.getRoom_name() + " � "+priorita1);*/


            connessione.close();

            return stanza;
        } catch (Exception e) {
            return stanza;
        }


    }
}
