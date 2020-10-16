package controller;

import entity.UsersEntity;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

    //Register
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showRegisterForm(Model model) {
        model.addAttribute("users", new UsersEntity());
        return "register/registerPage"; //return register.jsp
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String createNewUser(@Valid @ModelAttribute("users") UsersEntity users, BindingResult result,
            HttpServletRequest request, HttpSession session) {

        List<UsersEntity> usersList = usersRepo.getAllUsers();
        
        users.setNoopPassword(users.getPassword());
        
        if (result.hasErrors()) {
            return "register/registerPage";
        }
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

        users.setEnabled(true);
        users.setRole("ROLE_USER");
        usersRepo.save(users);
        session.setAttribute("users", users);

        //send mail
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(users.getEmail());
        msg.setSubject("Booking Hotel Web");
        msg.setText("Congratulations! You have successfully registered for an account.");
        javaMailSender.send(msg);

        //return "homepage/home";
        return "redirect:/";
    }
}
