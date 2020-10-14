package repository;

import entity.BookingDetailsEntity;
import entity.BookingEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

//giao tiep voi database
@Repository
public interface BookingDetailsRepository extends CrudRepository<BookingDetailsEntity, Integer> {

    @Query(value = "SELECT b FROM BookingEntity b WHERE b.users.id = ?1")
    List<BookingEntity> findBookingByUserId(@Param("id") int id);

    @Query(value = "SELECT bd FROM BookingDetailsEntity bd WHERE bd.booking.users.id = ?1")
    List<BookingDetailsEntity> findBookingDetailsByBookingId(int id);

    /*
    @Query(value = "select sum(bd.price)"
            + "from bookingdetails bd"
            + "join booking b on bd.BookingID = b.BookingID"
            + "where bd.BookingID = ?1", nativeQuery = true)
    BookingDetailsEntity getTotalPrice(double total);
*/

    //public List<BookingDetailsEntity> findBookingDetailsByBookingId(List<BookingEntity> bookingList);
}
