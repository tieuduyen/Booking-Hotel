package component;

import entity.BookingDetailsEntity;
import entity.RoomEntity;
import entity.RoomTypeEntity;
import entity.UsersEntity;
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
    List<RoomEntity> roomList;
    RoomTypeEntity roomType;
    RoomRepository roomRepo;
    CartEntity cart;
    UsersEntity user;
    
    public CartEntity() {
        bookingDetailsList = new ArrayList<>();
        roomList = new ArrayList<>();
    }

    public UsersEntity getUser() {
        return user;
    }

    public void setUser(UsersEntity user) {
        this.user = user;
    }

    
    public int getBooking() {
        return booking;
    }

    public void setBooking(int booking) {
        this.booking = booking;
    }

    public List<RoomEntity> getRoomList() {
        return roomList;
    }
    public List<BookingDetailsEntity> getBookingDetailsList() {
        return bookingDetailsList;
    }

    public void setBookingDetailsList(List<BookingDetailsEntity> bookingDetailsList) {
        this.bookingDetailsList = bookingDetailsList;
    }

    public RoomRepository getRoomRepo() {
        return roomRepo;
    }

    public void setRoomRepo(RoomRepository roomRepo) {
        this.roomRepo = roomRepo;
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
    public void addRoomType(RoomTypeEntity roomType) {
        boolean t = false;
        for (int i = 0; i < bookingDetailsList.size(); i++) {
            if (bookingDetailsList.get(i).getRoom().getRoomType().getId() == roomType.getId()) {
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
            bookingDetails.setQuantity(1);
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
}
