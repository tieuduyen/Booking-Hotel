package controller;

import entity.UsersEntity;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import repository.UsersRepository;


@Controller
public class RegisterController {

    @Autowired
    private UsersRepository usersRepo;

    @Autowired
    private JavaMailSender javaMailSender;
    
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    //@Autowired
    //private UserValidator userValidator;
    //@InitBinder
    //public void initBinder(WebDataBinder dataBinder) {
    // StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
    // dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    //}
    //Register
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showRegisterForm(Model model) {
        model.addAttribute("users", new UsersEntity());
        return "register/registerPage"; //return register.jsp
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String createNewUser(@Valid @ModelAttribute("users") UsersEntity users) {

        
        List<UsersEntity> usersList = usersRepo.getAllUsers();
        for (int i = 0; i < usersList.size(); i++) {
            if (!(users.getPassword().equals(users.getPasswordConfirm()))) {
                return "register/registerPage";
            }
            if (users.getEmail().equals(usersList.get(i).getEmail())) {
                return "register/registerPage";
            }
            if (users.getUsername().equals(usersList.get(i).getUsername())) {
                return "register/registerPage";
            }
        }

        users.setPassword(bCryptPasswordEncoder.encode(users.getPassword()));
        users.setRole("ROLE_USER");
        users.setEnabled(true);
        usersRepo.save(users);

        //send mail
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(users.getEmail());
        msg.setSubject("Booking Hotel Web");
        msg.setText("Congratulations! You have successfully registered for an account.");
        javaMailSender.send(msg);

        return "homepage/home";
    }

    /*
    public String registration(@Valid @ModelAttribute("users") UsersEntity users, BindingResult theBindingResult, Model model) {
        // userValidator.validate(customer, bindingResult);
        userService.saveUser(users);
            // Thực hiện validate dữ liệu
		registerFormValidator.validate(users, bindingResult);
                
        	if (bindingResult.hasErrors()) {
			return "register/registerPage";
		}
        // send mail

        return "user/userHome";

    }*/

 /*
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerCustomerPost(@Valid @ModelAttribute("customer") UsersEntity customer, @RequestParam(name = "rePassword") String rePassword,
            Model model, Errors errors) {

        List<CustomerEntity> customerList = customerRepo.getAllCustomers();
        for (int i = 0; i < customerList.size(); i++) {
            if (!(customer.getPassword().equals(rePassword))) {
\
    fghjkl;'\cvbnm,./cv/errors.rejectValue("rePassword", "notmatch.rePassword");
                return "register/registerPage";
            }
            if (customer.getEmail().equals(customerList.get(i).getEmail())) {
                errors.rejectValue("email", "notmatch.email");
                return "register/registerPage";
            }
            if (customer.getUsername().equals(customerList.get(i).getUsername())) {
                errors.rejectValue("username", "notmatch.username");
                return "register/registerPage";
            }
        }

        customer.setPassword(passwordEncoder.encode(customer.getPassword()));
        customer.setEnabled(true);
        customerRepo.save(customer);

        // send mail
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(customer.getEmail());
        msg.setSubject("Booking Hotel Web");
        msg.setText("Congratulations! You have successfully registered for an account.");
        javaMailSender.send(msg);
    
        return "homepage/home";
    }
     */
}
