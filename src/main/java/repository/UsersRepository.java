
package repository;

import entity.UsersEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersRepository extends CrudRepository<UsersEntity,Integer>{
    
    //public UsersEntity login(String username, String password);
    
    @Query("select u FROM UsersEntity u WHERE password = ?1")
    UsersEntity findByPassword(@Param("password") String password);
    
    @Query("select u FROM UsersEntity u WHERE userName = ?1")
    UsersEntity findByUsername(String username);
    
    @Query("select u FROM UsersEntity u WHERE email = ?1")
    UsersEntity findByEmail(String email);

    @Query(value="select * FROM users ", nativeQuery = true)
    List<UsersEntity> getAllUsers();

}
