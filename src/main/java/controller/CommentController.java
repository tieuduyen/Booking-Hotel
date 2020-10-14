package controller;

import entity.CommentEntity;
import entity.HotelEntity;
import entity.UsersEntity;
import java.time.LocalDate;
import java.util.Optional;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repository.CommentRepository;
import repository.HotelRepository;
import repository.UsersRepository;

@Controller
public class CommentController {
    
    @Autowired
    private CommentRepository commentRepo;
    
    @Autowired
    private UsersRepository usersRepo;
    
    @Autowired
    private HotelRepository hotelRepo;
    
     //Save
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public String postComment(@RequestParam(name = "hotel.id") int hotelID,
                              @RequestParam(name = "users.id") int userID,
                              @Valid @ModelAttribute("comment") CommentEntity comment) {
        
        //Save Comment
        comment.getHotel().setId(hotelID);
        comment.getUsers().setId(userID);
        comment.setCommentDate(LocalDate.now());
        commentRepo.save(comment);

        return "redirect:/";
    } 
    
    //viewpage/view-room-by-hotel
    //Edit
    /*@RequestMapping(value = "/comment/{id}", method = RequestMethod.POST)
    public String postComment(//@RequestParam(name = "hotel.id") int hotelID,
                              //@RequestParam(name = "users.id") int userID,
                              @PathVariable(value = "id") int id,
                              @Valid @ModelAttribute("comment") CommentEntity comment,
                              Model model,HttpSession session) {
        //HotelEntity hotel = hotelRepo.findById(id);
        //UsersEntity users = comment.getUsers( );
        
        //Save Comment
        //comment.getHotel().setId(hotelID);
       // comment.getUsers().setId(userID);
        HotelEntity hotel = hotelRepo.findById(id);
        //model.addAttribute("hotel", hotel);
        
        comment.setHotel(hotel);
        //comment.getUsers().getId();
        comment.setCommentDate(LocalDate.now());
        commentRepo.save(comment);

        return "redirect:/";
    } */
}
