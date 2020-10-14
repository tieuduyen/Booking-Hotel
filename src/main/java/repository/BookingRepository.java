
package repository;

import entity.BookingDetailsEntity;
import entity.BookingEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends CrudRepository<BookingEntity,Integer>{
    
    @Query(value = "SELECT b FROM BookingEntity b WHERE b.users.id = ?1")
    List<BookingEntity> findBookingByUserId(@Param("id") int id);
    
        
    @Query(value = "select sum(bd.price)"
            + "from booking b"
            + "join bookingDetails bd on b.BookingID = bd.BookingID"
            + "where bd.BookingID = ?1", nativeQuery = true)
    BookingEntity getTotalBookingDetailsPrice(int bookingId);
    
    @Query(value = "SELECT b FROM BookingEntity b WHERE b.users.id = ?1")
    List<BookingEntity> findUserByBooking(@Param("id") int id);
    
    BookingEntity findById(int id);
}
