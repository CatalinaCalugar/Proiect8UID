package com.spr.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.spr.exception.UserNotFound;
import com.spr.model.*;

import com.spr.utils.InitialSpacesFactory;
import com.spr.validation.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "/user")
public class UserController {

//    @Autowired
//    private UserValidator userValidator;

    private static final DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//
//    @InitBinder
//    private void initBinder(WebDataBinder binder) {
//        binder.setValidator(userValidator);
//    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newUserPage(HttpSession session, final RedirectAttributes redirectAttributes) {
        if (!session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
        if (((User) session.getAttribute("loggedUser")).getUsername().equals("admin")) {
            ModelAndView mav = new ModelAndView("user-new", "user", new User());
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }

    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createNewUser(@ModelAttribute @Valid User user,
                                      BindingResult result,
                                      final RedirectAttributes redirectAttributes, HttpSession session) {
        String message;
        if (result.hasErrors())
            return new ModelAndView("user-new");

        ModelAndView mav = new ModelAndView();
        message = "New user " + user.getName() + " was successfully created.";

        //  userService.create(user);

        mav.setViewName("redirect:/admin-page.html");

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {

        ModelAndView mav = new ModelAndView("index", "command", new User());
        return mav;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute @Valid User user, final RedirectAttributes redirectAttributes, HttpSession session, @RequestParam("username") String username, @RequestParam("password") String password, ModelMap model) {
        model.addAttribute("username", username);
        String message = "";
        String page = "";
        List<User> registeredUsers;
        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();
        model.addAttribute("cowSp", coworkingSpaces);

        try {
            registeredUsers = (List<User>) session.getAttribute("registeredUsersList");
        } catch (Exception e) {
            registeredUsers = new ArrayList<>();
        }

        if (username == null) {
            page = "index";
            message = "Login fail!";
            model.addAttribute("message", message);
        } else {
            if (username.equals("admin") && password.equals("admin")) {
                page = "home_page_after_login";
                message = "Success!";
                session.setAttribute("loggedUser", username);
            } else {
                if (registeredUsers != null) {
                    if (registeredUsers.size() > 0) {
                        for (User u : registeredUsers) {
                            if (u.getUsername().equals(username) && u.getPassword().equals(password)) {
                                page = "home_page_after_login";
                                message = "Success!";
                                session.setAttribute("loggedUser", username);
                            }
                        }
                    }
                } else {
                    page = "index";
                    message = "Login fail!";
                    model.addAttribute("message", message);
                }
            }
        }
        redirectAttributes.addFlashAttribute("message", message);
        return page;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpSession session) {
        session.removeAttribute("loggedUser");
        ModelAndView mav = new ModelAndView("redirect:/index.html");
        return mav;
    }

    @RequestMapping(value = "/addSpace", method = RequestMethod.GET)
    public ModelAndView addSpace() {
        return new ModelAndView("login", "command", new User());
    }

    @RequestMapping(value = "/addSpace", method = RequestMethod.POST)
    public String addSpace(@ModelAttribute @Valid User user, final RedirectAttributes redirectAttributes, HttpSession session, @RequestParam("username") String username, @RequestParam("password") String password, ModelMap model) {
        String message = "";
        String page = "";

        redirectAttributes.addFlashAttribute("message", message);
        return page;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView userListPage(HttpSession session, final RedirectAttributes redirectAttributes) {
        if (!session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
        if (((User) session.getAttribute("loggedUser")).getUsername().equals("admin")) {
            ModelAndView mav = new ModelAndView("user-list");
            //List<User> userList = userService.findAll();
            //mav.addObject("userList", userList);
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }


    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editUserPage(@PathVariable Integer id, HttpSession session, final RedirectAttributes redirectAttributes) {
        if (!session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
        if (((User) session.getAttribute("loggedUser")).getUsername().equals("admin")) {
            ModelAndView mav = new ModelAndView("user-edit");
            User user = new User("User1", "admin", "admin", "admin");
            mav.addObject("user", user);
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }

    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView editUser(@ModelAttribute @Valid User user,
                                 BindingResult result,
                                 @PathVariable Integer id,
                                 final RedirectAttributes redirectAttributes, HttpSession session) throws UserNotFound {

        if (result.hasErrors())
            return new ModelAndView("user-edit");
        ModelAndView mav = new ModelAndView("user-edit");
        String message = "";

//        User e = userService.findById(id);
//        if (e.getUsername().equals(user.getUsername())) {
//            mav = new ModelAndView("user-edit");
//            message = "User was successfully updated.";
//            redirectAttributes.addFlashAttribute("message", message);
//            return mav;
//        }
//        mav = new ModelAndView("redirect:/admin-page.html");
//        message = "User was successfully updated.";
//
//        userService.update(user);
        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteUser(@PathVariable Integer id,
                                   final RedirectAttributes redirectAttributes, HttpSession session) throws UserNotFound {

        ModelAndView mav = new ModelAndView("redirect:/admin-page.html");

        String message = "The user " + id + " was successfully deleted.";
        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public ModelAndView myAccount(HttpSession session, final RedirectAttributes redirectAttributes) {
        ModelAndView modelAndView = new ModelAndView("my-account", "user", new User());
        modelAndView.addObject("username", session.getAttribute("loggedUser"));
        return modelAndView;
    }

    @RequestMapping(value = "/edit-account", method = RequestMethod.GET)
    public ModelAndView editAccount(HttpSession session, final RedirectAttributes redirectAttributes) {

        ModelAndView mav = new ModelAndView("edit-account", "user", new User());
        mav.addObject("username", session.getAttribute("loggedUser"));
        mav.addObject("name", "John Doe");
        return mav;
    }

    @RequestMapping(value = "/edit-account", method = RequestMethod.POST)
    public ModelAndView editAccount(@ModelAttribute User user,
                                    BindingResult result,
                                    final RedirectAttributes redirectAttributes, HttpSession session) throws UserNotFound {

        if (result.hasErrors())
            return new ModelAndView("edit-account");

        ModelAndView mav = new ModelAndView();

        String message = "";


        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(@ModelAttribute User user,
                                 BindingResult result,
                                 final RedirectAttributes redirectAttributes, HttpSession session) throws UserNotFound {

        if (result.hasErrors())
            return new ModelAndView("redirect:/index.html");

        ModelAndView mav = new ModelAndView("redirect:/index.html");
        String message = "";

        List<User> registeredUsers;

        try {
            registeredUsers = (List<User>) session.getAttribute("registeredUsersList");
            registeredUsers.add(user);
            session.setAttribute("registeredUsersList", registeredUsers);
        } catch (Exception e) {
            registeredUsers = new ArrayList<>();
            registeredUsers.add(user);
            session.setAttribute("registeredUsersList", registeredUsers);
        }

        message = "Check email for confirming your account!";

        //send confirmation Email

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

}
