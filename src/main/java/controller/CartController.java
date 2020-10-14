package controller;

import component.CartEntity;
import entity.BookingDetailsEntity;
import entity.BookingEntity;
import entity.HotelEntity;
import entity.RoomEntity;
import entity.RoomTypeEntity;
import entity.UsersEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repository.BookingDetailsRepository;
import repository.BookingRepository;
import repository.CityRepository;
import repository.HotelRepository;
import repository.RoomRepository;
import repository.RoomTypeRepository;
import repository.UsersRepository;

@Controller
@Scope(value =  "session")
public class CartController {
    
    @Autowired
    UsersRepository userRepo;
    
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
        UsersEntity user = new UsersEntity();
        HotelEntity hotel = hotelRepo.findById(id);
       
        RoomTypeEntity roomType =(RoomTypeEntity) roomTypeRepo.findById(id);
        cart.addRoomType(roomType);
        
        model.addAttribute("user",user);
        model.addAttribute("hotel", hotel);
        model.addAttribute("cart", cart);
        
        return "viewpage/bookingPage"; //Return cart.jsp
    }
    @RequestMapping(value="/update", method = RequestMethod.POST)
    public String updateQuantity(Model model,@RequestParam(name= "id")int id,
        @RequestParam(name= "quantity")int quantity, RoomTypeEntity roomType){
        List<BookingDetailsEntity> bookingDetailsList = cart.getBookingDetailsList();
        for(int i= 0; i<bookingDetailsList.size();i++){
            if(bookingDetailsList.get(i).getRoom().getRoomType().getId() == roomType.getId()){
                BookingDetailsEntity bookingDetail = bookingDetailsList.get(i);
                bookingDetail.setQuantity(quantity);
                bookingDetailsList.set(i, bookingDetail);
                cart.setBookingDetailsList(bookingDetailsList);
            }
        }
        model.addAttribute("cart", cart);
        return "viewpage/bookingPage";
    }
    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String removeItem(@PathVariable(value = "id") int id, Model model) {
        //Get Item
        RoomTypeEntity roomType =(RoomTypeEntity) roomTypeRepo.findById(id);
        
        //Remove Item
        cart.removeItem(roomType);
        
        //List lai trang Cart
        model.addAttribute("cart", cart);
        
        return "viewpage/bookingPage";
        
    }
    //Continue
    @RequestMapping(value = "/continue", method = RequestMethod.POST)
    public String next(UsersEntity user,Model model){
        cart.setUser(user);
        
       // model.addAttribute("cart", cart);
        return "viewpage/continue";     
    }
    
    /*@RequestMapping(value = "/saveBooking", method = RequestMethod.POST) //update ben action ben editBook.jsp
    public String saveCheckout(BookingEntity booking,  Model model) {
        //Save vao bang Orders
        booking.setBookingDate(LocalDate.now());       
        BookingEntity newBooking = bookingRepo.save(booking);
        
        //Save vao bang Order Details
        List<BookingDetailsEntity> bookingDetailsList = cart.getBookingDetailsList();
        for(BookingDetailsEntity bookingDetails : bookingDetailsList){
            bookingDetails.setBooking(newBooking);
            bookingDetailsRepo.save(bookingDetails);
        }
        
        //Save vào bảng room
        List<RoomEntity> roomList = cart.getRoomList();
        for(RoomEntity room : roomList){
            room.setBookingDetailsList(bookingDetailsList);
            roomRepo.save(room);
        }
        return "homepage/home"; //goi lai home.jsp
    }*/
    
        @RequestMapping(value = "/payment", method = RequestMethod.POST)
    public String payment(BookingEntity booking,Model model){

        return "viewpage/payment";     
    }
}
