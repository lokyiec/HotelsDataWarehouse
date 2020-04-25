package lokyiec.dbObjects;

public class ZyskHotel {
    int miesiac;
    int zysk;

    public ZyskHotel(int miesiac, int zysk) {
        this.miesiac = miesiac;
        this.zysk = zysk;
    }

    public int getMiesiac() {
        return miesiac;
    }

    public int getZysk() {
        return zysk;
    }

    public void setMiesiac(int miesiac) {
        this.miesiac = miesiac;
    }

    public void setZysk(int zysk) {
        this.zysk = zysk;
    }
}
