package controller;

import entity.AdvantagesEntity;
import entity.CityEntity;
import entity.CommentEntity;
import entity.HotelEntity;
import entity.RateEntity;
import entity.RoomEntity;
import entity.RoomTypeEntity;
import entity.SlideEntity;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repository.AdvantagesRepository;
import repository.CityRepository;
import repository.CommentRepository;
import repository.HotelRepository;
import repository.RateRepository;
import repository.RoomRepository;
import repository.SlideRepository;
import repository.RoomTypeRepository;

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

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

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
        //List<RoomEntity> roomList = (List<RoomEntity>) roomRepo.findRoomTypeByName(name);
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

    //search
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchCity(@RequestParam(name = "searchText") int cityID, @RequestParam(name = "checkIn") Date checkInDate,
            @RequestParam(name = "checkOut") Date checkOutDate, @RequestParam(name = "rooms") int rooms, Model model) {

        LocalDate checkIn = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(checkInDate));
        LocalDate checkOut = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(checkOutDate));

        List<HotelEntity> hotelList = (List<HotelEntity>) hotelRepo.findHotleInCity(cityID);
        List<HotelEntity> availableHotel = new ArrayList<>();

        for (HotelEntity h : hotelList) {
            int numberRoomOfHotel = roomTypeRepo.getNumberOfRoomOfHotel(h.getId());
            int numberOfRoomUsing = roomRepo.getNumberOfRoomUsing(h.getId(), checkIn, checkOut);
            if (numberRoomOfHotel - numberOfRoomUsing >= rooms) {
                availableHotel.add(h);
            }
        }

        CityEntity city = cityRepo.findById(cityID);

        model.addAttribute("availableHotel", availableHotel);
        model.addAttribute("city", city);

        return "viewpage/view-hotel-by-city";
    }
}
