package controller;

import entity.UsersEntity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import repository.UsersRepository;


@Controller
@SessionAttributes("name")
public class LoginController {
    //@Autowired
    //private CustomerRepositoryImpl customerRepoImpl;

    @Autowired
    private UsersRepository usersRepo;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    //Login
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage(ModelMap model) {
        return "login/loginPage";
    }

    @RequestMapping(value = "/login")
    public String validateUser(@RequestParam(name = "email") String email,
                               @RequestParam(name = "password") String password ) {
        
        UsersEntity users = usersRepo.findByEmail(email);
        
        bCryptPasswordEncoder.encode(password);
        
        if (users.getPassword().equals(bCryptPasswordEncoder)) {
            return "user/userPage";
        }else{
          return "login/loginPage";
        }
        //users.getPassword().equals(passwordEncoder.encode(password)) && users.getEmail().equals(email)
    }

    //Logout
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "homepage/home";
    }

}
