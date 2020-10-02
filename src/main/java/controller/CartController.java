package controller;

import component.CartEntity;
import entity.HotelEntity;
import entity.RoomTypeEntity;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import repository.BookingDetailsRepository;
import repository.BookingRepository;
import repository.CityRepository;
import repository.HotelRepository;
import repository.RoomRepository;
import repository.RoomTypeRepository;

@Controller
@Scope(value =  "session")
public class CartController {
    
    @Autowired
    CityRepository cityRepo;

    @Autowired
    HotelRepository hotelRepo;
    
    @Autowired
    RoomRepository roomRepo;
    
    @Autowired
    RoomTypeRepository roomTypeRepo;
    
    @Autowired
    BookingDetailsRepository bookingDetailsRepo;
    
    
    @Autowired
    BookingRepository bookingRepo;
    
    @Autowired
    CartEntity cart;
    
    //Add to cart
    @RequestMapping(value = "/addToCart/{id}", method = RequestMethod.GET)
    public String addToCarts(@PathVariable(value = "id") int id, Model model){
        //RoomEntity room = roomRepo.findByName(name);
       // cart.addRoomType(room);
        HotelEntity hotel = hotelRepo.findById(id);
       
        RoomTypeEntity roomType =(RoomTypeEntity) roomTypeRepo.findById(id);
        cart.addRoomType(roomType);
        
        model.addAttribute("hotel", hotel);
        model.addAttribute("cart", cart);
        
        return "viewpage/bookingPage"; //Return cart.jsp
    }
}
