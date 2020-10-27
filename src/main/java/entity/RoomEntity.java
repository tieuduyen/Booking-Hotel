
package entity;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="room")
public class RoomEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "RoomID")
    private int id;   
    
    @Column(name = "RoomName")
    private String name;
    
    // n-1 voi bang RoomType
    @ManyToOne
    @JoinColumn(name="RoomTypeID")//khóa ngoại 
    private RoomTypeEntity roomType;

    
    @OneToMany(mappedBy = "room",fetch = FetchType.EAGER)
    List<BookingDetailsEntity> bookingDetailsList;
    
    
    public RoomEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<BookingDetailsEntity> getBookingDetailsList() {
        return bookingDetailsList;
    }

    public void setBookingDetailsList(List<BookingDetailsEntity> bookingDetailsList) {
        this.bookingDetailsList = bookingDetailsList;
    }

    public RoomTypeEntity getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomTypeEntity roomType) {
        this.roomType = roomType;
    }


}
