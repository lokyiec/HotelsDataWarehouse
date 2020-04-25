package lokyiec.dbObjects;

public class Hotel {
    String hotel_nazwa;

    public Hotel(String hotel_nazwa) {
        this.hotel_nazwa = hotel_nazwa;
    }

    public String getHotel_nazwa() {
        return hotel_nazwa;
    }

    public void setHotel_nazwa(String hotel_nazwa) {
        this.hotel_nazwa = hotel_nazwa;
    }

    @Override
    public String toString() {
        return this.hotel_nazwa;
    }
}
