package component;

import entity.BookingDetailsEntity;
import entity.CreditCardEntity;
import entity.HotelEntity;
import entity.RoomEntity;
import entity.RoomTypeEntity;
import entity.UsersEntity;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import repository.RoomRepository;

@Component
@Scope(value = "session")
public class CartEntity {

    private int booking;
    List<BookingDetailsEntity> bookingDetailsList;
    RoomEntity room;
    RoomTypeEntity roomType;
    CartEntity cart;
    private int numberOfRoom;
    private LocalDate checkIn;
    private LocalDate checkOut;
    private UsersEntity user;
    private int numberOfPeople;

    public CartEntity() {
        bookingDetailsList = new ArrayList<>();
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public int getNumberOfRoom() {
        return numberOfRoom;
    }

    public void setNumberOfRoom(int numberOfRoom) {
        this.numberOfRoom = numberOfRoom;
    }

    public LocalDate getCheckIn() {
        return checkIn;
    }

    public UsersEntity getUser() {
        return user;
    }

    public void setUser(UsersEntity user) {
        this.user = user;
    }

    public void setCheckIn(LocalDate checkIn) {
        this.checkIn = checkIn;
    }

    public LocalDate getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(LocalDate checkOut) {
        this.checkOut = checkOut;
    }

    public int getBooking() {
        return booking;
    }

    public void setBooking(int booking) {
        this.booking = booking;
    }

    public RoomEntity getRoom() {
        return room;
    }

    public void setRoom(RoomEntity room) {
        this.room = room;
    }

    public List<BookingDetailsEntity> getBookingDetailsList() {
        return bookingDetailsList;
    }

    public void setBookingDetailsList(List<BookingDetailsEntity> bookingDetailsList) {
        this.bookingDetailsList = bookingDetailsList;
    }

    public CartEntity getCart() {
        return cart;
    }

    public void setCart(CartEntity cart) {
        this.cart = cart;
    }

    public RoomTypeEntity getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomTypeEntity roomType) {
        this.roomType = roomType;
    }

    //Add Item
    public void addRoomType(HotelEntity hotel, RoomTypeEntity roomType, int numberOfRoom, int numberOfPeople) {
        boolean t = false;
        for (int i = 0; i < bookingDetailsList.size(); i++) {
            if (bookingDetailsList.get(i).getRoom().getRoomType().getHotel().getId() == hotel.getId()) {
                BookingDetailsEntity bookingDetails = bookingDetailsList.get(i);
                bookingDetails.setQuantity(bookingDetails.getQuantity() + 1);
                bookingDetailsList.set(i, bookingDetails);
                t = true;
            }
        }
        if (!t) {
            BookingDetailsEntity bookingDetails = new BookingDetailsEntity();
            RoomEntity room = new RoomEntity();
            room.setRoomType(roomType);
            bookingDetails.setNumberOfPeople(numberOfPeople);
            bookingDetails.setQuantity(numberOfRoom);
            bookingDetails.setRoom(room);
            bookingDetailsList.add(bookingDetails);
        }
    }

    //Remove Item
    public void removeItem(RoomTypeEntity roomType) {
        for (int i = 0; i < bookingDetailsList.size(); i++) {
            if (bookingDetailsList.get(i).getRoom().getRoomType().getId() == roomType.getId()) {
                bookingDetailsList.remove(i);
            }
        }
    }

    //Total Amount
    public double getTotal() {
        double sum = 0;
        for (int i = 0; i < bookingDetailsList.size(); i++) {
                double price = bookingDetailsList.get(i).getRoom().getRoomType().getPrice();
                int quantity = bookingDetailsList.get(i).getQuantity();
                sum = price * quantity;
        }
        return sum;
    }
}
