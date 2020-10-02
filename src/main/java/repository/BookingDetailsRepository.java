
package repository;

import entity.BookingDetailsEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

//giao tiep voi database
@Repository
public interface BookingDetailsRepository extends CrudRepository<BookingDetailsEntity,Integer>{
    
}
