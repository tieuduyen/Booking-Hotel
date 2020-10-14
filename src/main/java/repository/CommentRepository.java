package repository;

import entity.CommentEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository extends CrudRepository<CommentEntity,Integer>{
    @Query(value = "SELECT cm FROM CommentEntity cm WHERE cm.hotel.name = :name")
    List<CommentEntity> findCommentByHotelName(@Param("name") String name);
    
    @Query(value = "SELECT cm FROM CommentEntity cm WHERE cm.users.id = ?1")
    List<CommentEntity> findCommentByUserId(@Param("id") int id);
}
