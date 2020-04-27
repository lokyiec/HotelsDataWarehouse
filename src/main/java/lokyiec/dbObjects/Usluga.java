package lokyiec.dbObjects;

public class Usluga {
    String usluga_nazwa;
    int ilosc;

    public Usluga(String usluga_nazwa, int ilosc) {
        this.usluga_nazwa = usluga_nazwa;
        this.ilosc = ilosc;
    }

    public String getUsluga_nazwa() {
        return usluga_nazwa;
    }

    public int getIlosc() {
        return ilosc;
    }

    public void setUsluga_nazwa(String usluga_nazwa) {
        this.usluga_nazwa = usluga_nazwa;
    }

    public void setIlosc(int ilosc) {
        this.ilosc = ilosc;
    }

}

