
package entity;

import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
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
@Table(name="bookingDetails")
public class BookingDetailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BookingDetailsID")
    private int id;
    
    @Column(name = "NumberOfPeople")
    private int numberOfPeople;
    
    @Column(name = "Quantity")
    private int quantity;
        
    @Column(name = "Price")
    private Double price;
    
    @Column(name = "CheckInDate")
    private LocalDate checkInDate;
    
    @Column(name = "CheckOutDate")
    private LocalDate checkOutDate;
    
    // n-1 voi bang Booking
    @ManyToOne
    @JoinColumn(name = "BookingID")//khóa ngoại 
    private BookingEntity booking;
    
    // 1-n (BookingDetails-ServiceDetails)
    @OneToMany(mappedBy = "bookingDetails",fetch = FetchType.LAZY)
    List<ServiceDetailsEntity> serviceDetailsList;
    
    // n-1 voi bang Room
    @ManyToOne
    @JoinColumn(name = "RoomID")//khóa ngoại 
    private RoomEntity room;

    
    public BookingDetailsEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }


    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public LocalDate getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(LocalDate checkInDate) {
        this.checkInDate = checkInDate;
    }

    public LocalDate getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(LocalDate checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public BookingEntity getBooking() {
        return booking;
    }

    public void setBooking(BookingEntity booking) {
        this.booking = booking;
    }
    
    public List<ServiceDetailsEntity> getServiceDetailsList() {
        return serviceDetailsList;
    }

    public void setServiceDetailsList(List<ServiceDetailsEntity> serviceDetailsList) {
        this.serviceDetailsList = serviceDetailsList;
    }

    public RoomEntity getRoom() {
        return room;
    }

    public void setRoom(RoomEntity room) {
        this.room = room;
    }  

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public String getPriceFormatted() {
        NumberFormat numberFormatter = NumberFormat.getNumberInstance();
        return numberFormatter.format(price);
    }
    
    public String getCheckInDateFormatted(){
        DateTimeFormatter commentDateFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return commentDateFormat.format(checkInDate);
    }
    
    public String getCheckOutDateFormatted(){
        DateTimeFormatter commentDateFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return commentDateFormat.format(checkOutDate);
    }
        
    public double getTotalPrice(){
        double sum = 0;
        for(int i = 1; i <= getPrice(); i++)
        {
            sum = sum + i;
            //sum += i;
        }
        return getTotalPrice();
    }
}
