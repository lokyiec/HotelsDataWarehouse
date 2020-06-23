package lokyiec.dbUtils;

import lokyiec.dbObjects.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CallableStatementParameter {

    public Connection getDBConnection() {
        Connection conn = null;

        try {
            conn = DriverManager.getConnection("jdbc:postgresql://15.236.216.54:5432/Hotels", "postgres", "");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return conn;
        }
    }

    // REZERWACJE
    public List<String> widokHoteli() throws SQLException {
        List<String> arrayList = new ArrayList<>();
        Statement stmt = null;
        String query = "SELECT hotel_nazwa FROM hotele";

        try {
            Connection con = this.getDBConnection();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                String hotel_nazwa = rs.getString("hotel_nazwa");
                arrayList.add(hotel_nazwa);
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
        String query = "";
        if (hotel_nazwa.equals("Wszystkie")) {
            query =
                    "SELECT H.HOTEL_NAZWA AS \"Nazwa\", date_part('month', r.rez_wymeld) AS \"Miesiac\", SUM(r.rez_koszt) AS \"Zysk\"\n" +
                            "FROM USLUGI_HOTELOWE UH\n" +
                            "JOIN UZYTE_USLUGI UU ON UH.USLUG_ID = UU.USLUG_ID\n" +
                            "JOIN REZERWACJE R ON R.REZ_ID = UU.REZ_ID\n" +
                            "JOIN REZERWACJE_POKOI RP ON RP.REZ_ID = R.REZ_ID\n" +
                            "JOIN POKOJE P ON RP.POK_ID = P.POK_ID\n" +
                            "JOIN HOTELE H ON H.HOTEL_ID = P.HOTEL_ID\n" +
                            "GROUP BY GROUPING SETS ((H.HOTEL_NAZWA, date_part('month', r.rez_wymeld)), H.HOTEL_NAZWA)\n" +
                            "ORDER BY date_part('month', r.rez_wymeld)";
        } else {
            query =
                    "SELECT H.HOTEL_NAZWA AS \"Nazwa\", date_part('month', r.rez_wymeld) AS \"Miesiac\", SUM(r.rez_koszt) AS \"Zysk\"\n" +
                            "FROM USLUGI_HOTELOWE UH\n" +
                            "JOIN UZYTE_USLUGI UU ON UH.USLUG_ID = UU.USLUG_ID\n" +
                            "JOIN REZERWACJE R ON R.REZ_ID = UU.REZ_ID\n" +
                            "JOIN REZERWACJE_POKOI RP ON RP.REZ_ID = R.REZ_ID\n" +
                            "JOIN POKOJE P ON RP.POK_ID = P.POK_ID\n" +
                            "JOIN HOTELE H ON H.HOTEL_ID = P.HOTEL_ID\n" +
                            "WHERE H.HOTEL_NAZWA = '" + hotel_nazwa + "'\n" +
                            "GROUP BY GROUPING SETS ((H.HOTEL_NAZWA, date_part('month', r.rez_wymeld)), H.HOTEL_NAZWA)\n" +
                            "ORDER BY date_part('month', r.rez_wymeld)";
        }

        try {
            Connection conn = this.getDBConnection();
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                String miesiac = rs.getString("Miesiac");
                String nazwa = rs.getString("Nazwa");
                Integer zysk = rs.getInt("Zysk");
                arrayList.add(new ZyskHotel(miesiac, nazwa, zysk));
            }
        } catch (SQLException e) {
            System.out.println("Error ZyskHotelu");
        } finally {
            if (stmt != null) stmt.close();
        }
        return arrayList;
    }

    // USŁUGI
    public List<String> widokListyUslug() throws SQLException {
        List<String> arrayList = new ArrayList<>();
        Statement stmt = null;
        String query = "SELECT uslug_nazwa FROM uslugi_hotelowe";

        try {
            Connection con = this.getDBConnection();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                String usluga_nazwa = rs.getString("uslug_nazwa");
                arrayList.add(usluga_nazwa);
            }

        } catch (SQLException e) {
            System.out.println("Error! widokUslug");
        } finally {
            if (stmt != null)   stmt.close();
        }
        return arrayList;
    }

    public List<ZyskHotel> widokZyskuUslug(String hotel_nazwa) throws SQLException {
        List<ZyskHotel> arrayList = new ArrayList<>();
        Statement stmt = null;
        String query = "";
        if (hotel_nazwa.equals("Wszystkie")) {
            query =
                    "SELECT date_part('month', r.rez_wymeld) AS \"Miesiac\", H.HOTEL_NAZWA, SUM(uh.uslug_koszt) AS \"Zysk\"\n" +
                            "FROM USLUGI_HOTELOWE UH\n" +
                            "JOIN UZYTE_USLUGI UU ON UH.USLUG_ID = UU.USLUG_ID\n" +
                            "JOIN REZERWACJE R ON R.REZ_ID = UU.REZ_ID\n" +
                            "JOIN REZERWACJE_POKOI RP ON RP.REZ_ID = R.REZ_ID\n" +
                            "JOIN POKOJE P ON RP.POK_ID = P.POK_ID\n" +
                            "JOIN HOTELE H ON H.HOTEL_ID = P.HOTEL_ID\n" +
                            "GROUP BY GROUPING SETS ((H.HOTEL_NAZWA, date_part('month', r.rez_wymeld)), H.HOTEL_NAZWA)\n" +
                            "ORDER BY date_part('month', r.rez_wymeld);";
        } else {
            query =
                    "SELECT date_part('month', r.rez_wymeld) AS \"Miesiac\", H.HOTEL_NAZWA, SUM(uh.uslug_koszt) AS \"Zysk\"\n" +
                            "FROM USLUGI_HOTELOWE UH\n" +
                            "JOIN UZYTE_USLUGI UU ON UH.USLUG_ID = UU.USLUG_ID\n" +
                            "JOIN REZERWACJE R ON R.REZ_ID = UU.REZ_ID\n" +
                            "JOIN REZERWACJE_POKOI RP ON RP.REZ_ID = R.REZ_ID\n" +
                            "JOIN POKOJE P ON RP.POK_ID = P.POK_ID\n" +
                            "JOIN HOTELE H ON H.HOTEL_ID = P.HOTEL_ID\n" +
                            "WHERE H.HOTEL_NAZWA = '" + hotel_nazwa + "'\n" +
                            "GROUP BY GROUPING SETS ((H.HOTEL_NAZWA, date_part('month', r.rez_wymeld)), H.HOTEL_NAZWA)\n" +
                            "ORDER BY date_part('month', r.rez_wymeld);";
        }

        try {
            Connection con = this.getDBConnection();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                String miesiac = rs.getString("Miesiac");
                String nazwa = rs.getString("hotel_nazwa");
                Integer zysk = rs.getInt("Zysk");
                arrayList.add(new ZyskHotel(miesiac, nazwa, zysk));
            }

        } catch (SQLException e) {
            System.out.println("Error! widokTopUlug");
        } finally {
            if (stmt != null)   stmt.close();
        }
        return arrayList;
    }

    public List<ZyskHotel> widokUslug(String hotel_nazwa) throws SQLException {
        List<ZyskHotel> arrayList = new ArrayList<>();
        Statement stmt = null;
        String query = "";
        if (hotel_nazwa.equals("Wszystkie")) {
            query =
                    "SELECT date_part('month', r.rez_wymeld) AS \"Miesiac\", H.HOTEL_NAZWA, COUNT(uh.uslug_id) AS \"Zysk\"\n" +
                            "FROM USLUGI_HOTELOWE UH\n" +
                            "JOIN UZYTE_USLUGI UU ON UH.USLUG_ID = UU.USLUG_ID\n" +
                            "JOIN REZERWACJE R ON R.REZ_ID = UU.REZ_ID\n" +
                            "JOIN REZERWACJE_POKOI RP ON RP.REZ_ID = R.REZ_ID\n" +
                            "JOIN POKOJE P ON RP.POK_ID = P.POK_ID\n" +
                            "JOIN HOTELE H ON H.HOTEL_ID = P.HOTEL_ID\n" +
                            "GROUP BY GROUPING SETS ((H.HOTEL_NAZWA, date_part('month', r.rez_wymeld)), H.HOTEL_NAZWA)\n" +
                            "ORDER BY date_part('month', r.rez_wymeld);";
        } else {
            query =
                    "SELECT date_part('month', r.rez_wymeld) AS \"Miesiac\", H.HOTEL_NAZWA, COUNT(uh.uslug_id) AS \"Zysk\"\n" +
                            "FROM USLUGI_HOTELOWE UH\n" +
                            "JOIN UZYTE_USLUGI UU ON UH.USLUG_ID = UU.USLUG_ID\n" +
                            "JOIN REZERWACJE R ON R.REZ_ID = UU.REZ_ID\n" +
                            "JOIN REZERWACJE_POKOI RP ON RP.REZ_ID = R.REZ_ID\n" +
                            "JOIN POKOJE P ON RP.POK_ID = P.POK_ID\n" +
                            "JOIN HOTELE H ON H.HOTEL_ID = P.HOTEL_ID\n" +
                            "WHERE H.HOTEL_NAZWA = '" + hotel_nazwa + "'\n" +
                            "GROUP BY GROUPING SETS ((H.HOTEL_NAZWA, date_part('month', r.rez_wymeld)), H.HOTEL_NAZWA)\n" +
                            "ORDER BY date_part('month', r.rez_wymeld);";
        }

        try {
            Connection con = this.getDBConnection();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                String miesiac = rs.getString("Miesiac");
                String nazwa = rs.getString("hotel_nazwa");
                Integer zysk = rs.getInt("Zysk");
                arrayList.add(new ZyskHotel(miesiac, nazwa, zysk));
            }

        } catch (SQLException e) {
            System.out.println("Error! widokTopUlug");
        } finally {
            if (stmt != null)   stmt.close();
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
