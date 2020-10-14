package controller;

import entity.BookingDetailsEntity;
import entity.BookingEntity;
import entity.CommentEntity;
import entity.CreditCardEntity;
import entity.UsersEntity;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import repository.BookingDetailsRepository;
import repository.BookingRepository;
import repository.CommentRepository;
import repository.CreditCardRepository;
import repository.UsersRepository;

@Controller
public class ProfileController {

    @Autowired
    private UsersRepository usersRepo;

    @Autowired
    private CreditCardRepository creditCardRepo;
    
    @Autowired
    private BookingRepository bookingRepo;

    @Autowired
    private BookingDetailsRepository bookingDetailsRepo;
    
    @Autowired
    private CommentRepository commentRepo;
    
    
    @RequestMapping(value = "/account/{id}", method = RequestMethod.GET)
    public String showProfilePage(Model model, 
                                 @PathVariable(value = "id") int id ) {

        UsersEntity users = usersRepo.findById(id);
        CreditCardEntity creditCard = creditCardRepo.findById(id);
        List<BookingEntity> bookingList = bookingRepo.findBookingByUserId(id);
        List<BookingDetailsEntity> bookingDetailsList = bookingDetailsRepo.findBookingDetailsByBookingId(id);
        List<CommentEntity> commentList = commentRepo.findCommentByUserId(id);
        //BookingEntity booking = bookingRepo.getTotalBookingDetailsPrice(id);

        //model.addAttribute("booking", booking);
        model.addAttribute("users", users);
        model.addAttribute("creditCard", creditCard);
        model.addAttribute("bookingList", bookingList);
        model.addAttribute("bookingDetailsList", bookingDetailsList);
        model.addAttribute("commentList", commentList);
        model.addAttribute("creditCards", new CreditCardEntity());

        return "profile/accountPage";
    }

    //Save
    @RequestMapping(value = "/update-account/{id}", method = RequestMethod.POST)
    public String updateProfile(@PathVariable(value = "id") int id,
            UsersEntity users, BindingResult result, HttpSession session) {

        if (result.hasErrors()) {
            users.setId(id);
            return "profile/accountPage";
        }

        users.getPassword();
        users.setEnabled(true);
        usersRepo.save(users);

        session.setAttribute("users", users);

        return "redirect:/";
    }

    // add new credit card
    @RequestMapping(value = "/add-creditCard/{id}", method = RequestMethod.POST)
    public String createNewCreditCard(@PathVariable(value = "id") int id,
                                      @Valid @ModelAttribute("creditCards") CreditCardEntity creditCard,
                                      BindingResult result, HttpSession session) {

        creditCard.setId(id);
        creditCardRepo.save(creditCard);
        //session.setAttribute("creditCard", creditCard);

        return "redirect:/";
   }

    //update credit card
    @RequestMapping(value = "/update-creditCard/{id}", method = RequestMethod.POST)
    public String updateCreditCard(@PathVariable(value = "id") int id,
            CreditCardEntity creditCard, BindingResult result, HttpSession session) {

        if (result.hasErrors()) {
            creditCard.setId(id);
            return "profile/creditCardPage";
        }

        creditCard.setId(id);
        creditCardRepo.save(creditCard);

        //session.setAttribute("creditCard", creditCard);

        return "redirect:/";
    }
    
    //cancel booking
    @RequestMapping(value = "/cancel-booking/{id}", method = RequestMethod.POST)
    public String cancelBooking(@PathVariable(value = "id") int id,
                                BookingEntity booking, BindingResult result) {

        if (result.hasErrors()) {
            booking.setId(id);
            return "profile/accountPage";
        }

        booking.setStatus("Cancelled");
        bookingRepo.save(booking);

        return "redirect:/";
    }

}
