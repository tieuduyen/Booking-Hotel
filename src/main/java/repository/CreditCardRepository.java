
package repository;

import entity.CreditCardEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CreditCardRepository extends CrudRepository<CreditCardEntity,Integer>{
    
    @Query("select cr FROM CreditCardEntity cr WHERE id = ?1")
    CreditCardEntity findById(int id);
}
