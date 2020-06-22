package lokyiec.dbObjects;

public class topUslug {
    String uslug_nazwa;
    int mercury;
    int venus;
    int mars;
    int jupiter;
    int saturn;
    int razem;

    public topUslug(String uslug_nazwa, int mercury, int venus, int mars, int jupiter, int saturn, int razem) {
        this.uslug_nazwa = uslug_nazwa;
        this.mercury = mercury;
        this.venus = venus;
        this.mars = mars;
        this.jupiter = jupiter;
        this.saturn = saturn;
        this.razem = razem;
    }

    public String getUslug_nazwa() {
        return uslug_nazwa;
    }

    public int getMercury() {
        return mercury;
    }

    public int getVenus() {
        return venus;
    }

    public int getMars() {
        return mars;
    }

    public int getJupiter() {
        return jupiter;
    }

    public int getSaturn() {
        return saturn;
    }

    public int getRazem() {
        return razem;
    }

    public void setUslug_nazwa(String uslug_nazwa) {
        this.uslug_nazwa = uslug_nazwa;
    }

    public void setMercury(int mercury) {
        this.mercury = mercury;
    }

    public void setVenus(int venus) {
        this.venus = venus;
    }

    public void setMars(int mars) {
        this.mars = mars;
    }

    public void setJupiter(int jupiter) {
        this.jupiter = jupiter;
    }

    public void setSaturn(int saturn) {
        this.saturn = saturn;
    }

    public void setRazem(int razem) {
        this.razem = razem;
    }
}
