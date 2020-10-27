package controller;

import component.CartEntity;
import entity.BookingDetailsEntity;
import entity.BookingEntity;
import entity.CityEntity;
import entity.CreditCardEntity;
import entity.HotelEntity;
import entity.RoomEntity;
import entity.RoomTypeEntity;
import entity.UsersEntity;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repository.BookingDetailsRepository;
import repository.BookingRepository;
import repository.CityRepository;
import repository.CreditCardRepository;
import repository.HotelRepository;
import repository.RoomRepository;
import repository.RoomTypeRepository;
import repository.UsersRepository;

@Controller
@Scope(value = "session")
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

    @Autowired
    CreditCardRepository creditCardRepo;

    @Autowired
    private JavaMailSender javaMailSender;

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchCity(@RequestParam(name = "searchText") int cityID, @RequestParam(name = "checkIn") Date checkInDate,
            @RequestParam(name = "checkOut") Date checkOutDate, @RequestParam(name = "rooms") int rooms, @RequestParam(name = "numberOfPeople") int numberOfPeople, Model model) {

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
        cart.setCheckIn(checkIn);
        cart.setCheckOut(checkOut);
        cart.setNumberOfRoom(rooms);
        cart.setNumberOfPeople(numberOfPeople);
        CityEntity city = cityRepo.findById(cityID);

        model.addAttribute("availableHotel", availableHotel);
        model.addAttribute("city", city);

        return "viewpage/view-hotel-by-city";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    //Add to cart
    @RequestMapping(value = "/addToCart/{id}", method = RequestMethod.GET)
    public String addToCarts(@PathVariable(value = "id") int id, Model model) {
        HotelEntity hotel = hotelRepo.findById(id);
        BookingEntity booking = new BookingEntity();
        RoomTypeEntity roomType = (RoomTypeEntity) roomTypeRepo.findById(id);
        cart.addRoomType(hotel, roomType, cart.getNumberOfRoom(), cart.getNumberOfPeople());

        model.addAttribute("booking", booking);
        model.addAttribute("hotel", hotel);
        model.addAttribute("cart", cart);

        return "viewpage/cart"; //Return cart.jsp
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateQuantity(Model model, @RequestParam(name = "id") int id,
            @RequestParam(name = "quantity") int quantity, RoomTypeEntity roomType) {
        List<BookingDetailsEntity> bookingDetailsList = cart.getBookingDetailsList();
        for (int i = 0; i < bookingDetailsList.size(); i++) {
            if (bookingDetailsList.get(i).getRoom().getRoomType().getId() == roomType.getId()) {
                BookingDetailsEntity bookingDetail = bookingDetailsList.get(i);
                bookingDetail.setQuantity(quantity);
                bookingDetailsList.set(i, bookingDetail);
                cart.setBookingDetailsList(bookingDetailsList);
            }
        }
        model.addAttribute("cart", cart);
        return "viewpage/cart";
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String removeItem(@PathVariable(value = "id") int id, Model model) {
        //Get Item
        RoomTypeEntity roomType = (RoomTypeEntity) roomTypeRepo.findById(id);

        //Remove Item
        cart.removeItem(roomType);

        //List lai trang Cart
        model.addAttribute("cart", cart);

        return "viewpage/cart";

    }

    //Continue
    @RequestMapping(value = "/bookingForm", method = RequestMethod.GET)
    public String bookingForm(UsersEntity user, Model model) {
        model.addAttribute("cart", cart);
        /*String userName = getUserName();
        UsersEntity user = userRepo.findByUsername(userName);*/
        model.addAttribute("user", new UsersEntity());
        return "viewpage/bookingPage";
    }

    @RequestMapping(value = "/payment", method = RequestMethod.POST)
    public String payment(UsersEntity user, Model model) {
        model.addAttribute("creditCart", new CreditCardEntity());
        model.addAttribute("user", user);
        model.addAttribute("cart", cart);
        return "viewpage/payment";
    }

    @RequestMapping(value = "/booking", method = RequestMethod.POST)
    public String savebooking(BookingEntity booking, @RequestParam(name = "cardholdersName") String cardholdersName,
            @RequestParam(name = "creditCardNumber") String creditCardNumber,
            @RequestParam(name = "expirationDate") Date expirationDate,
            @RequestParam(name = "cvv") String cvv, Model model, HttpSession session) {
        UsersEntity user = (UsersEntity) session.getAttribute("users");
        
        CreditCardEntity creditCard = creditCardRepo.findByCreditCardNumber(creditCardNumber);
        if (creditCardNumber == "") {
            booking.setBookingDate(LocalDate.now());
            booking.setStatus("Pending");

            booking.setUsers(user);
            BookingEntity newBooking = bookingRepo.save(booking);
            // Save vào bảng BookingDetails
            List<BookingDetailsEntity> bookingDetailsList = cart.getBookingDetailsList();
            for (BookingDetailsEntity bookingDetails : bookingDetailsList) {
                bookingDetails.setBooking(newBooking);
                //find room for booking
                int roomTypeID = bookingDetails.getRoom().getRoomType().getId();
                List<RoomEntity> roomList = roomRepo.findRoomByRoomType(roomTypeID, cart.getCheckIn(), cart.getCheckOut());
                RoomEntity room = roomList.get(0);
                double price = room.getRoomType().getPrice() * bookingDetails.getQuantity();
                bookingDetails.setPrice(price);
                //bookingDetails.setNumberOfPeople();
                bookingDetails.setRoom(room);
                bookingDetails.setCheckInDate(cart.getCheckIn());
                bookingDetails.setCheckOutDate(cart.getCheckOut());
                bookingDetails.setPaymentMethod("payment at the hotel");
                bookingDetailsRepo.save(bookingDetails);
                cart.setBookingDetailsList(new ArrayList<BookingDetailsEntity>());
            
            }
            
            
            return "viewpage/thankPage";
        } else {
            LocalDate expiration = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(expirationDate));
            if (creditCard.getCardholdersName().equals(cardholdersName) && creditCard.getExpirationDate().equals(expirationDate)
                    && creditCard.getCvv().equals(cvv)) {

                return "viewpage/payment";
            } else {
                double moneyBooking = cart.getTotal();
                double surplus = creditCard.getSurplus();

                if (moneyBooking <= surplus) {
                    double balance = surplus - moneyBooking;
                    creditCard.setSurplus(balance);
                    creditCardRepo.save(creditCard);
                } else {
                    if (moneyBooking > surplus) {
                        String erroMessage = "Bạn không đủ tiền";
                        model.addAttribute("erroMesseger", erroMessage);
                        model.addAttribute("creditCard", creditCard);
                        model.addAttribute("user", user);
                        model.addAttribute("cart", cart);
                        return "viewpage/payment";
                    }
                }

                booking.setBookingDate(LocalDate.now());
                booking.setStatus("Pending");

                booking.setUsers(user);
                booking.setCreditCard(user.getCreditCard());
                BookingEntity newBooking = bookingRepo.save(booking);

                //Save vao bang Order Details
                List<BookingDetailsEntity> bookingDetailsList = cart.getBookingDetailsList();
                for (BookingDetailsEntity bookingDetails : bookingDetailsList) {
                    bookingDetails.setBooking(newBooking);
                    //find room for booking
                    int roomTypeID = bookingDetails.getRoom().getRoomType().getId();
                    List<RoomEntity> roomList = roomRepo.findRoomByRoomType(roomTypeID, cart.getCheckIn(), cart.getCheckOut());
                    RoomEntity room = roomList.get(0);
                    double price = room.getRoomType().getPrice() * bookingDetails.getQuantity();
                    bookingDetails.setPrice(price);
                    //bookingDetails.setNumberOfPeople();
                    bookingDetails.setRoom(room);
                    bookingDetails.setCheckInDate(cart.getCheckIn());
                    bookingDetails.setCheckOutDate(cart.getCheckOut());
                    bookingDetails.setPaymentMethod("payment online");
                    bookingDetailsRepo.save(bookingDetails);
                    cart.setBookingDetailsList(new ArrayList<BookingDetailsEntity>());
                }
                SimpleMailMessage msg = new SimpleMailMessage();
                msg.setTo(user.getEmail());
                msg.setSubject("Booking Hotel Web");
                msg.setText("Congratulations! You have successfully registered for an account.");
                javaMailSender.send(msg);

                return "viewpage/thankPage";
            }
        }
    }

}
