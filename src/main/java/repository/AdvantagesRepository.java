package repository;

import entity.AdvantagesEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdvantagesRepository extends CrudRepository<AdvantagesEntity,Integer>{
    
}
