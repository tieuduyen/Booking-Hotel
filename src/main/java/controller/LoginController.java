package controller;

import entity.UsersEntity;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import repository.UsersRepository;

@Controller
@SessionAttributes("name")
public class LoginController {

    @Autowired
    private UsersRepository usersRepo;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    //Login
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage(ModelMap model) {
        return "login/loginPage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam(name = "email") String email,
                            @RequestParam(name = "password") String password,
		            HttpSession session) {
            
             UsersEntity users = usersRepo.findByEmail(email);
             
		if(users.getPassword().equals(bCryptPasswordEncoder.encode(password))) {
			session.setAttribute("users", users);
			return "redirect:/";
		} else {
			return "login/loginPage";
		}
	}
    
        /*
    @RequestMapping(value = "/login")
    public String validateUser(@RequestParam(name = "email") String email,
            @RequestParam(name = "password") String password) {

        UsersEntity users = usersRepo.findByEmail(email);

        //String encrytedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        //String encrytedPassword = encrytePassword(password);
        
        String encrytedPassword = bCryptPasswordEncoder.encode(password);
        if (users.getPassword().equals(encrytedPassword)) {
            return "user/userPage";
        } else {
            return "login/loginPage";
        }
        //users.getPassword().equals(passwordEncoder.encode(password)) && users.getEmail().equals(email)
    }
*/
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("users");
		return "redirect:/";
	}

}
