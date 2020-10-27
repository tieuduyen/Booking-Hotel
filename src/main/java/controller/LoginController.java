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
            @RequestParam(name = "noopPassword") String noopPassword,
            HttpSession session,Model model) {

        UsersEntity users = usersRepo.findByEmail(email);

        if (users.getNoopPassword().equals(noopPassword) && users.getRole().equals("ROLE_USER")) {
            session.setAttribute("users", users);
            return "redirect:/";
        } else {
            String erroMessage = "Account or password is incorrect";
                model.addAttribute("erroMesseger", erroMessage);
            return "login/loginPage";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("users");
        return "redirect:/";
    }
}
