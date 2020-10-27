package controller;

import entity.AdvantagesEntity;
import entity.CityEntity;
import entity.CommentEntity;
import entity.HotelEntity;
import entity.RateEntity;
import entity.RoomTypeEntity;
import entity.SlideEntity;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import repository.AdvantagesRepository;
import repository.CityRepository;
import repository.CommentRepository;
import repository.HotelRepository;
import repository.RateRepository;
import repository.RoomRepository;
import repository.RoomTypeRepository;
import repository.SlideRepository;



@Controller
public class HotelController {

    @Autowired
    CityRepository cityRepo;

    @Autowired
    AdvantagesRepository advantagesRepo;

    @Autowired
    HotelRepository hotelRepo;

    @Autowired
    RoomTypeRepository roomTypeRepo;

    @Autowired
    RoomRepository roomRepo;

    @Autowired
    RateRepository rateRepo;
    
    @Autowired
    CommentRepository commentRepo;

    @Autowired
    SlideRepository slideRepo;

    

    //View City
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showAllCity(Model model, HttpSession session) {

        List<SlideEntity> slideList = (List<SlideEntity>) slideRepo.findAll();
        List<CityEntity> cityList = (List<CityEntity>) cityRepo.getAllCity();
        List<CityEntity> optionCityList = (List<CityEntity>) cityRepo.findAll();
        List<RoomTypeEntity> roomTypeList = (List<RoomTypeEntity>) roomTypeRepo.getAllRoomType();
        List<AdvantagesEntity> advantagesList = (List<AdvantagesEntity>) advantagesRepo.findAll();

        model.addAttribute("slideList", slideList);
        model.addAttribute("cityList", cityList);
        model.addAttribute("optionCityList", optionCityList);
        model.addAttribute("roomTypeList", roomTypeList);
        model.addAttribute("advantagesList", advantagesList);

        return "homepage/home";

    }

    //1 city có nhieu hotel(1-n)
    @RequestMapping(value = "/city/{name}", method = RequestMethod.GET)
    public String showHotelByCity(@PathVariable(value = "name") String name, Model model,HttpSession session) {
        List<HotelEntity> availableHotel = (List<HotelEntity>) hotelRepo.findHotelByName(name);
        List<RateEntity> rateList = (List<RateEntity>) rateRepo.findAll();
        CityEntity city = cityRepo.findByNameLike(name);

        model.addAttribute("availableHotel", availableHotel);
        model.addAttribute("city", city);
        model.addAttribute("rateList", rateList);

        return "viewpage/view-hotel-by-city";
    }

    
    // List TypeRoom By Hotel
    @RequestMapping(value = "/hotel/{name}", method = RequestMethod.GET)
    public String showRoomTypeByHotel(@PathVariable(value = "name") String name, Model model,HttpSession session) {

        model.addAttribute("comment", new CommentEntity());
        List<CommentEntity> commentList = (List<CommentEntity>) commentRepo.findCommentByHotelName(name);
        HotelEntity hotel = hotelRepo.findByName(name);
        List<RoomTypeEntity> roomTypeList = (List<RoomTypeEntity>) roomTypeRepo.findRoomTypeByName(name);

        model.addAttribute("commentList", commentList);
        model.addAttribute("roomTypeList", roomTypeList);
        model.addAttribute("hotel", hotel);
        return "viewpage/view-room-by-hotel";
    }

    // List TypeRoomDetails By Hotel
    @RequestMapping(value = "/room/{name}", method = RequestMethod.GET)
    public String showRoomDetailsByHotel(@PathVariable(value = "name") String name, Model model,HttpSession session) {

        RoomTypeEntity roomType = roomTypeRepo.findRoomDetailsByName(name);

        model.addAttribute("roomType", roomType);

        return "viewpage/view-room-details";
    }

}
