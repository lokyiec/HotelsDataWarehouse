package lokyiec.dbObjects;

public class topCity {
    String adres_miasto;
    int ilosc_gosci;

    public topCity(String adres_miasto, int ilosc) {
        this.adres_miasto = adres_miasto;
        this.ilosc_gosci = ilosc;
    }

    public String getAdres_miasto() {
        return adres_miasto;
    }

    public int getIlosc() {
        return ilosc_gosci;
    }

    public void setAdres_miasto(String adres_miasto) {
        this.adres_miasto = adres_miasto;
    }

    public void setIlosc(int ilosc) {
        this.ilosc_gosci = ilosc;
    }
}
