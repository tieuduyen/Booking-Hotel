package entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import repository.UsersRepository;

@Entity
@Table(name = "users")
@Scope("session")
public class UsersEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "UserID")
    private int id;

    @Column(name = "Email")
    @Email
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "Sex")
    private String sex;

    @Column(name = "Birthdate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthdate;

    @Column(name = "Password")
    private String password;
    
    @Column(name = "NoopPassword")
    private String noopPassword;

    @Transient
    private String passwordConfirm;
    
    @Column(name = "Role")
    private String role;

    @Column(name = "username")
    @Size(min = 3, max = 20)
    private String username;

    @Column(name = "enabled")
    private boolean enabled;

    //Implement relationships with CreditCard 1-1
    @OneToOne(mappedBy = "users")
    private CreditCardEntity creditCard;

    //Setup relationshipss with CreditCard
    @OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
    List<BookingEntity> bookingList;

    @OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
    List<CommentEntity> comment;
    
    public UsersEntity() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public LocalDate getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(LocalDate birthdate) {
        this.birthdate = birthdate;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNoopPassword() {
        return noopPassword;
    }

    public void setNoopPassword(String noopPassword) {
        this.noopPassword = noopPassword;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public CreditCardEntity getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(CreditCardEntity creditCard) {
        this.creditCard = creditCard;
    }

    public List<BookingEntity> getBookingList() {
        return bookingList;
    }

    public void setBookingList(List<BookingEntity> bookingList) {
        this.bookingList = bookingList;
    }

    public List<CommentEntity> getComment() {
        return comment;
    }

    public void setComment(List<CommentEntity> comment) {
        this.comment = comment;
    }

    public String getBirthDateFormatted() {
        DateTimeFormatter birthDateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return birthDateFormat.format(birthdate);
    } 

}
