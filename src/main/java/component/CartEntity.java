package component;

import entity.BookingDetailsEntity;
import entity.RoomEntity;
import entity.RoomTypeEntity;
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
    RoomRepository roomRepo;
    CartEntity cart;
    
    public CartEntity() {
        bookingDetailsList = new ArrayList<>();
    }

    public int getBooking() {
        return booking;
    }

    public void setBooking(int booking) {
        this.booking = booking;
    }

    public List<BookingDetailsEntity> getBookingDetailsList() {
        return bookingDetailsList;
    }

    public void setBookingDetailsList(List<BookingDetailsEntity> bookingDetailsList) {
        this.bookingDetailsList = bookingDetailsList;
    }

    public RoomEntity getRoom() {
        return room;
    }

    public void setRoom(RoomEntity room) {
        this.room = room;
    }

    public RoomTypeEntity getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomTypeEntity roomType) {
        this.roomType = roomType;
    }
    
    //Add Item
    public void addRoomType(RoomTypeEntity roomType) {
            BookingDetailsEntity bookingDetails = new BookingDetailsEntity();
            RoomEntity room = new RoomEntity();
            room.setRoomType(roomType);
            bookingDetails.setId(1);
            bookingDetails.setRoom(room);
            bookingDetailsList.add(bookingDetails);

    }

    
}
