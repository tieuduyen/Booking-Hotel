
package repository;

import entity.CityEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityRepository extends CrudRepository<CityEntity,Integer>{
    
    @Query(value="select * from city limit 3", nativeQuery = true)
    List<CityEntity> getAllCity();
     
    @Query(value = "SELECT c FROM CityEntity c WHERE c.name = ?1 ")
    CityEntity findCityByName(String name);
    
    CityEntity findByNameLike(String name);
    
    @Query(value = "SELECT h FROM HotelEntity h WHERE h.city.name = ?1")
    CityEntity findHotelByName(String name);
    
    CityEntity findById(int id);
}

