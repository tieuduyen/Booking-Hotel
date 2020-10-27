
package entity;

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
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "booking")
public class BookingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BookingID")
    private int id;
 
    @Column(name = "BookingDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate bookingDate;
    
    @Column(name = "Status")
    private String status;

    @OneToMany(mappedBy = "booking",fetch = FetchType.EAGER)
    List<BookingDetailsEntity> bookingDetailsList;

    // n-1 voi bang users
    @ManyToOne
    @JoinColumn(name = "UserID")//khóa ngoại 
    private UsersEntity users;

    
    // n-1 voi bang Credit
    @ManyToOne
    @JoinColumn(name = "CreditCardID")//khóa ngoại 
    private CreditCardEntity creditCard;

    
    public BookingEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public List<BookingDetailsEntity> getBookingDetailsList() {
        return bookingDetailsList;
    }

    public void setBookingDetailsList(List<BookingDetailsEntity> bookingDetailsList) {
        this.bookingDetailsList = bookingDetailsList;
    }

    public UsersEntity getUsers() {
        return users;
    }

    public void setUsers(UsersEntity users) {
        this.users = users;
    }

    public CreditCardEntity getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(CreditCardEntity creditCard) {
        this.creditCard = creditCard;
    }
    
    public String getBookingDateFormatted(){
        DateTimeFormatter commentDateFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return commentDateFormat.format(bookingDate);
    }
}
