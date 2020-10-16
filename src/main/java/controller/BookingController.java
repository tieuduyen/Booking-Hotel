package controller;

import entity.CityEntity;
import entity.HotelEntity;
import entity.RateEntity;
import entity.RoomTypeEntity;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import repository.CityRepository;
import repository.HotelRepository;
import repository.RateRepository;
import repository.RoomRepository;
import repository.RoomTypeRepository;
import repository.SlideRepository;

@Controller
public class BookingController {

    @Autowired
    CityRepository cityRepo;

    @Autowired
    HotelRepository hotelRepo;

    @Autowired
    RoomTypeRepository roomTypeRepo;

    @Autowired
    RoomRepository roomRepo;

    @Autowired
    RateRepository rateRepo;

    @Autowired
    SlideRepository slideRepo;

    // List TypeRoomDetails By Hotel
    @RequestMapping(value = "/booking/{name}", method = RequestMethod.GET)
    public String showRoomDetailsByHotel(@PathVariable(value = "name") String name, Model model) {

        List<HotelEntity> hotelList = (List<HotelEntity>) hotelRepo.findHotelByName(name); 
        CityEntity city = cityRepo.findByNameLike(name);
        model.addAttribute("hotelList", hotelList);
        model.addAttribute("city", city);
        
        RoomTypeEntity roomType = roomTypeRepo.findRoomDetailsByName(name);
        model.addAttribute("roomType", roomType);
        return "viewpage/bookingPage";
    }
}
