package repository;

import entity.HotelEntity;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface HotelRepository extends CrudRepository<HotelEntity, Integer> {

    HotelEntity findById(int id);
    
    HotelEntity findByName(String name);
    
    @Query(value = "SELECT h FROM HotelEntity h WHERE h.city.id = ?1 ")
    List<HotelEntity> findHotleInCity(int cityID);
    
    @Query(value = "SELECT h FROM HotelEntity h WHERE h.city.name = :name")
    List<HotelEntity> findHotelByName(@Param("name") String name);

    @Query(value = "SELECT h FROM HotelEntity h WHERE h.city.name = ?1 ORDER BY h.evaluate DESC")
    List<HotelEntity> sortHotelByEvaluateHighToLow(String name);

    @Query(value = "SELECT h FROM HotelEntity h WHERE h.city.name = ?1 ORDER BY h.evaluate ASC")
    List<HotelEntity> sortHotelByEvaluateLowToHigh(String name);

}
