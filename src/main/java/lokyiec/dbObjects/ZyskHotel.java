package lokyiec.dbObjects;

public class ZyskHotel {
    String miesiac;
    String nazwa;
    int zysk;

    public ZyskHotel(String miesiac, String nazwa, int zysk) {
        this.miesiac = miesiac;
        this.nazwa = nazwa;
        this.zysk = zysk;
    }

    public String getMiesiac() {
        return miesiac;
    }

    public String getNazwa() {
        return nazwa;
    }

    public int getZysk() {
        return zysk;
    }

    public void setMiesiac(String miesiac) {
        this.miesiac = miesiac;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public void setZysk(int zysk) {
        this.zysk = zysk;
    }
}
