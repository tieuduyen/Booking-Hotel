
package repository;

import entity.RoomTypeEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomTypeRepository extends CrudRepository<RoomTypeEntity,Integer> {
    RoomTypeEntity findById(int id);
    
    @Query(value = "SELECT rt FROM RoomTypeEntity rt WHERE rt.hotel.name = ?1 ")
    List<RoomTypeEntity> findRoomTypeByName(@Param("name") String name);
    
    @Query(value = "SELECT rt FROM RoomTypeEntity rt WHERE  rt.name = ?1")
    RoomTypeEntity findRoomDetailsByName(@Param("name") String name);
    
     @Query(value = "select * from roomtype  limit 4", nativeQuery = true)
    List<RoomTypeEntity> getAllRoomType();

    @Query(value = "select count(*) "
            + "from roomType rt "
            + "	join room r on rt.roomTypeID = r.roomTypeID "
            + "where rt.hotelID = ?1", nativeQuery = true)
    int getNumberOfRoomOfHotel(int hotelID);
}
