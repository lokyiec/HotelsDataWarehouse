package lokyiec.dbUtils;

import lokyiec.dbObjects.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CallableStatementParameter {

    public Connection getDBConnection() {
        Connection conn = null;

        try {
            conn = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/Hotels", "postgres", "changeme");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return conn;
        }
    }

    // REZERWACJE
    public List<Hotel> widokHoteli() throws SQLException {
        List<Hotel> arrayList = new ArrayList<>();
        Statement stmt = null;
        String query = "SELECT hotel_nazwa FROM hotele";

        try {
            Connection con = this.getDBConnection();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                String hotel_nazwa = rs.getString("hotel_nazwa");
                arrayList.add(new Hotel(hotel_nazwa));
            }

        } catch (SQLException e) {
            System.out.println("Error! widokHoteli");
        } finally {
            if (stmt != null)   stmt.close();
        }
        return arrayList;
    }

    public List<ZyskHotel> widokZyskuHotelu(String hotel_nazwa) throws SQLException {
        List<ZyskHotel> arrayList = new ArrayList<>();
        Statement stmt = null;
        String query =
                "SELECT date_part('month', r.rez_wymeld) AS \"Miesiac\", SUM(r.rez_koszt) AS \"Zysk\"\n" +
                        "FROM REZERWACJE R\n" +
                        "JOIN REZERWACJE_POKOI RP ON R.REZ_ID = RP.REZ_ID\n" +
                        "JOIN POKOJE P ON P.POK_ID = RP.POK_ID\n" +
                        "JOIN HOTELE H ON H.HOTEL_ID = P.HOTEL_ID\n" +
                        "WHERE H.HOTEL_NAZWA = '" + hotel_nazwa + "'\n" +
                        "GROUP BY GROUPING SETS ((date_part('month', r.rez_wymeld)))\n" +
                        "ORDER BY date_part('month', r.rez_wymeld);";

        try {
            Connection conn = this.getDBConnection();
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Integer miesiac = rs.getInt("Miesiac");
                Integer zysk = rs.getInt("Zysk");
                arrayList.add(new ZyskHotel(miesiac, zysk));
            }
        } catch (SQLException e) {
            System.out.println("Error ZyskHotelu");
        } finally {
            if (stmt != null) stmt.close();
        }
        return arrayList;
    }

    // USŁUGI
    public List<Usluga> widokUslug(String hotel_nazwa) throws SQLException {
        List<Usluga> arrayList = new ArrayList<>();
        Statement stmt = null;
        String query = "" +
                "SELECT UH.USLUG_NAZWA, COUNT(UU.USLUG_ID) AS \"Ilosc\"\n" +
                "FROM USLUGI_HOTELOWE UH\n" +
                "JOIN UZYTE_USLUGI UU ON UH.USLUG_ID = UU.USLUG_ID\n" +
                "JOIN REZERWACJE R ON UU.REZ_ID = R.REZ_ID\n" +
                "JOIN REZERWACJE_POKOI RP ON R.REZ_ID = RP.REZ_ID\n" +
                "JOIN POKOJE P ON RP.POK_ID = P.POK_ID\n" +
                "JOIN HOTELE H ON P.HOTEL_ID = H.HOTEL_ID\n" +
                "WHERE H.HOTEL_NAZWA = '" + hotel_nazwa + "'\n" +
                "GROUP BY UH.USLUG_NAZWA;";

        try {
            Connection con = this.getDBConnection();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                String uslug_nazwa = rs.getString("uslug_nazwa");
                Integer ilosc = rs.getInt("Ilosc");
                arrayList.add(new Usluga(uslug_nazwa, ilosc));
            }

        } catch (SQLException e) {
            System.out.println("Error! widokTopUlug");
        } finally {
            if (stmt != null)   stmt.close();
        }
        return arrayList;
    }

    public List<ZyskUslug> widokZyskuUslug(String hotel_nazwa) throws SQLException {
        List<ZyskUslug> arrayList = new ArrayList<>();
        Statement stmt = null;
        String query =
                "SELECT date_part('month', r.rez_wymeld) AS \"Miesiac\", SUM(r.rez_koszt) AS \"Zysk\"\n" +
                        "FROM USLUGI_HOTELOWE UH\n" +
                        "JOIN UZYTE_USLUGI UU ON UH.USLUG_ID = UU.USLUG_ID\n" +
                        "JOIN REZERWACJE R ON R.REZ_ID = UU.REZ_ID\n" +
                        "JOIN REZERWACJE_POKOI RP ON RP.REZ_ID = R.REZ_ID\n" +
                        "JOIN POKOJE P ON RP.POK_ID = P.POK_ID\n" +
                        "JOIN HOTELE H ON H.HOTEL_ID = P.HOTEL_ID\n" +
                        "WHERE H.HOTEL_NAZWA = '" + hotel_nazwa + "'\n" +
                        "GROUP BY GROUPING SETS ((date_part('month', r.rez_wymeld)))\n" +
                        "ORDER BY date_part('month', r.rez_wymeld);";

        try {
            Connection conn = this.getDBConnection();
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Integer miesiac = rs.getInt("Miesiac");
                Integer zysk = rs.getInt("Zysk");
                arrayList.add(new ZyskUslug(miesiac, zysk));
            }
        } catch (SQLException e) {
            System.out.println("Error ZyskHotelu");
        } finally {
            if (stmt != null) stmt.close();
        }
        return arrayList;
    }

    // MIASTA
    public List<topCity> widokMiast(int ilosc) throws SQLException {
        List<topCity> arrayList = new ArrayList<>();
        Statement stmt = null;
        String query =
                "SELECT A.ADRES_MIASTO, COUNT(A.ADRES_MIASTO) AS \"Ilosc\"\n" +
                        "FROM ADRESY A\n" +
                        "JOIN GOSCIE G ON A.ADRES_ID = G.ADRES_ID\n" +
                        "GROUP BY A.ADRES_MIASTO\n" +
                        "ORDER BY COUNT(A.ADRES_MIASTO) DESC\n" +
                        "LIMIT " + ilosc;

        try {
            Connection conn = this.getDBConnection();
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                String adres_miasto = rs.getString("adres_miasto");
                Integer ilosc_gosci = rs.getInt("Ilosc");
                arrayList.add(new topCity(adres_miasto, ilosc_gosci));
            }
        } catch (SQLException e) {
            System.out.println("Error topMiasta");
        } finally {
            if (stmt != null)   stmt.close();
        }
        return arrayList;
    }



}
