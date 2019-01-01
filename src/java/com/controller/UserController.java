/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.pojos.Guardian;
import com.pojos.Login;
import com.pojos.NeedyLogin;
import com.pojos.NeedyPerson;
import com.pojos.NeedyPersonHasGuardian;
import com.pojos.ProvinceOfficer;
import com.pojos.Role;
import com.pojos.SecurityQuestion;
import com.pojos.User;
import com.service.LoginService;
import com.service.NeedyService;
import com.service.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rajitha
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private NeedyService needyService;

    @RequestMapping(value = "/newuser", method = RequestMethod.GET)
    public ModelAndView displayForm() {
        ModelAndView modelAndView = new ModelAndView("new_user");
        return modelAndView;
    }

    @RequestMapping(value = "/registerdeo", method = RequestMethod.POST)
    @DateTimeFormat(pattern = "YYYY-MM-dd")
    public String submitUserRegisterForm(@RequestParam Map<String, String> reqPar, Model model) {
        String firstname = reqPar.get("firstname");
        String lastname = reqPar.get("lastname");
        String nic = reqPar.get("nic");
        String dob = reqPar.get("dob");
        String gender = reqPar.get("gender");
        String addressLine1 = reqPar.get("addressline1");
        String addressLine2 = reqPar.get("addressline2");
        String city = reqPar.get("city");
        String postalcode = reqPar.get("postalcode");
        String mobile = reqPar.get("mobile");
        String username = reqPar.get("useremail");

        try {
            if (firstname.length() == 0
                    || lastname.length() == 0 || nic.length() == 0
                    || addressLine1.length() == 0 || city.length() == 0 || postalcode.length() == 0
                    || username.length() == 0) {
                return "redirect:newuser.htm";
            }
            User user = new User();

            user.setFirstName(firstname);
            user.setLastName(lastname);
            //check gender
            if (gender.equals("M")) {
                user.setGender("M");
            } else {
                user.setGender("F");
            }

            String[] split = dob.split("/");
            dob = split[2] + "-" + split[1] + "-" + split[0];
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

            Date birth = df.parse(dob);
            user.setDob(birth.toString());

            user.setNic(nic);
            user.setAddressLine1(addressLine1);
            user.setAddressLine2(addressLine2);
            user.setCity(city);
            user.setPostalCode(postalcode);
            user.setEmail(username);
            user.setMobile(mobile);
            //set user role

            Role role = this.userService.searchUserRole();
            user.setRole(role);

            //set registration date
            Date regDate = new Date();

            Date reg = df.parse(regDate.toString());
            user.setRegDate(reg);

            this.userService.registerUser(user);
        } catch (NullPointerException e) {

        } catch (ParseException e) {
        }

        return "redirect:adminhome.htm";

    }

    @RequestMapping(value = "/submituseraccount", method = RequestMethod.POST)
    public String saveUser(HttpServletRequest request) {
        String nic = request.getParameter("nic");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user = this.userService.searchRegisterUser(nic, email);
            Login login = new Login();
            login.setUser(user);

            SecurityQuestion q = this.userService.searchQuestion();
            login.setSecurityQuestion(q);
            login.setPassword(password);
            login.setNoAttempts(3);
            login.setAnswer("x");

            Set<Login> set = new HashSet<>();
            set.add(login);
            user.setLogins(set);
            this.loginService.saveLogin(login);

        } catch (Exception e) {
            return "redirect:signup.htm";
        }

        return "redirect:login.htm";
    }

    @RequestMapping(value = "/submitneedyaccount", method = RequestMethod.POST)
    public String saveNeedyLogin(HttpServletRequest request) {
        String nic = request.getParameter("rcode");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean flag = false;
        try {

            NeedyPerson np = this.needyService.receiveCode(nic);

            Set<NeedyPersonHasGuardian> set = np.getNeedyPersonHasGuardians();

            if (set.isEmpty()) {
                return "redirect:signupneedy.htm";

            } else {
                for (NeedyPersonHasGuardian guardian : set) {
                    Guardian g = guardian.getGuardian();
                    if (g.getEmail().equalsIgnoreCase(email)) {
                        flag = true;
                        break;
                    }
                }
            }
            if (flag == true) {
                NeedyLogin login = new NeedyLogin();
                SecurityQuestion q = this.userService.searchQuestion();
                login.setSecurityQuestion(q);
                login.setPassword(password);
                login.setNoAttempts("3");
                login.setAnswer("x");
                this.loginService.saveNeedyLogin(login,np);
                Set<NeedyLogin> set2 = new HashSet<>();
                np.setNeedyLogins(set2);
            } else {
                return "redirect:signupneedy.htm";

            }

        } catch (Exception e) {
            return "redirect:signup.htm";
        }

        return "redirect:needylogin.htm";
    }

    @RequestMapping(value = "/searchuser", method = RequestMethod.GET)
    public String SearchNeedy(HttpSession httpSession, @RequestParam Map<String, String> reqPar, HttpServletRequest request, ModelMap map) throws ParseException {
        String key = reqPar.get("keyword");
        String category = reqPar.get("category");

        List<User> searchNeedyPerson = this.userService.searchUserByAdmin(key, key);
        map.addAttribute("needyList", searchNeedyPerson);
        //ModelAndView mav=new ModelAndVie
        //mav.addObject(searchNeedyPerson);
        return "view_user";
    }

    @RequestMapping(value = "/viewuser", method = RequestMethod.GET)

    public ModelAndView displayProfile() {
        ModelAndView modelAndView = new ModelAndView("view_user");
        return modelAndView;
    }

    @RequestMapping(value = "/signupneedy", method = RequestMethod.GET)

    public ModelAndView displayNeedySignup() {
        ModelAndView modelAndView = new ModelAndView("signup_needy");
        return modelAndView;
    }

}
