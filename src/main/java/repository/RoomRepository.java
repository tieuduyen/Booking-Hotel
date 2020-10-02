package repository;

import entity.RoomEntity;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends CrudRepository<RoomEntity, Integer> {

    @Query(value = "SELECT r FROM RoomEntity r WHERE r.roomType.hotel.name = ?1 group by r.roomType.id")
    List<RoomEntity> findRoomTypeByName(@Param("name") String name);
    
    @Query(value = "select r.*"
            + "from Room r"
            + "Join RoomType rt On r.RoomTypeID=rt.RoomTypeID"
            + "Join Hotel h On rt.hotelID=h.hotelID", nativeQuery = true)
    List<RoomEntity> listRoomByRoomTypeOfCity();
    
    RoomEntity findById(int id);
    RoomEntity findByName(String name);

    @Query(value = "select count(*) from room r  join roomType rt on r.RoomTypeID = rt.RoomTypeID "
            + "join bookingdetails bd on bd.roomID = r.roomID "
            + "where rt.hotelID = ?1 and "
            + "((checkInDate between ?2 and ?3) or(checkOutDate between ?2 and ?3))", nativeQuery = true)
    int getNumberOfRoomUsing(int hotelID, LocalDate checkIn, LocalDate checkOut);
}
