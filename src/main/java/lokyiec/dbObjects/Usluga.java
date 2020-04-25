package lokyiec.dbObjects;

public class Usluga {
    String usluga_nazwa;

    public Usluga(String usluga_nazwa) {
        this.usluga_nazwa = usluga_nazwa;
    }

    public String getUsluga_nazwa() {
        return usluga_nazwa;
    }

    public void setUsluga_nazwa(String usluga_nazwa) {
        this.usluga_nazwa = usluga_nazwa;
    }

    @Override
    public String toString() {
        return this.usluga_nazwa;
    }
}

