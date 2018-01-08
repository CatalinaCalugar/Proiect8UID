package com.spr.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.spr.exception.UserNotFound;
import com.spr.model.*;

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
        return new ModelAndView("login", "command", new User());
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute @Valid User user, final RedirectAttributes redirectAttributes, HttpSession session, @RequestParam("username") String username, @RequestParam("password") String password, ModelMap model) {
        model.addAttribute("username", username);
        model.addAttribute("password", password);
        String message = "";
        String page = "";

        if (username == null) {
            page = "loginFail";
            message = "Login fail!";
        } else {
            if (username.equals("admin") && password.equals("admin")) {
                page = "home_page_after_login";
                message = "Success!";
                session.setAttribute("loggedUser", username);
            } else {
                page = "loginFail";
                message = "Login fail!";
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
        ;
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
        ModelAndView modelAndView = new ModelAndView("my-account", "command", new User());
        modelAndView.addObject("username", session.getAttribute("loggedUser"));
        return modelAndView;
    }


//    @RequestMapping(value = "/loginReg/{id}", method = RequestMethod.GET)
//    public ModelAndView login1(@PathVariable Integer id, final RedirectAttributes redirectAttributes, HttpSession session) {
//        Pet p = petService.findById(id);
//        ModelAndView mav = null;
//        if (p.isAvailable()) {
//            if (!session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
//                {
//                    session.setAttribute("idPet", id);
//                    return new ModelAndView("login-register", "command", new User());
//                }
//            } else if (session.getAttribute("loggedUser") != null && ((User) session.getAttribute("loggedUser")).getRole().equals("client")) {
//
//                mav = new ModelAndView("adoption-new");
//                Timestamp date = new Timestamp(System.currentTimeMillis());
//                Client cl = clientService.findByUsername(((User) session.getAttribute("loggedUser")).getUsername());
//                Adoption adoption = new Adoption(id, date, cl.getId());
//                mav.addObject("adoption", adoption);
//                List<Pet> petList = new ArrayList<>();
//                petList.add(p);
//                List<String> payment = new ArrayList<>();
//                payment.add("Credit Card");
//                payment.add("Cash");
//                mav.addObject("petList", petList);
//                mav.addObject("searchList", payment);
//
//                return mav;
//
//            } else {
//                session.setAttribute("idPet", id);
//                return new ModelAndView("login-register", "command", new User());
//
//            }
//        } else {
//            mav = new ModelAndView("pet-view");
//            mav.addObject("pet", p);
//        }
//        return mav;
//    }
//
//    @RequestMapping(value = "/loginReg", method = RequestMethod.POST)
//    public ModelAndView loginClient(@ModelAttribute("SpringWeb") User user, ModelMap model,
//                                    final RedirectAttributes redirectAttributes, HttpSession session) {
//        model.addAttribute("username", user.getUsername());
//        model.addAttribute("password", user.getPassword());
//        ModelAndView mav = new ModelAndView();
//
//        Client dBUser = clientService.findByUsername(user.getUsername());
//        String message;
//        String page;
//        message = "Success!";
//        page = session.getAttribute("jsp").toString();
//        if (page.equals("pet-view")) {
//            int id = (Integer) session.getAttribute("idPet");
//            Pet p = petService.findById(id);
//            if (p.isAvailable()) {
//                if (dBUser == null) {
//                    page = "pet-view";
//                    mav = new ModelAndView(page);
//                    mav.addObject("pet", p);
//                    message = "Login fail!";
//                } else {
//                    if (!(dBUser.getPassword().equals(user.getPassword()))) {
//                        message = "Login fail!";
//                        page = "pet-view";
//                        mav.addObject("pet", p);
//                        mav = new ModelAndView(page);
//                    } else {
//                        page = "adoption-new";
//                        mav = new ModelAndView(page);
//                        Timestamp date = new Timestamp(System.currentTimeMillis());
//                        int idUser = dBUser.getId();
//                        Adoption adoption = new Adoption(id, date, idUser);
//                        mav.addObject("adoption", adoption);
//                        List<Pet> petList = new ArrayList<>();
//                        petList.add(p);
//                        List<String> payment = new ArrayList<>();
//                        payment.add("Credit Card");
//                        payment.add("Cash");
//                        mav.addObject("petList", petList);
//                        mav.addObject("searchList", payment);
//
//                    }
//                    User clientLogged = new User(dBUser.getFname() + dBUser.getLname(), user.getUsername(), user.getPassword(), "client");
//                    session.setAttribute("loggedUser", clientLogged);
//                }
//            } else {
//                message = "Pet is unadvailable at the moment.";
//                mav = new ModelAndView(page);
//                mav.addObject("pet", p);
//            }
//        } else {
//            if (dBUser == null) {
//                mav = new ModelAndView(page);
//                message = "Login fail!";
//            } else {
//                if (!(dBUser.getPassword().equals(user.getPassword()))) {
//                    message = "Login fail!";
//                    mav = new ModelAndView(page);
//                } else {
//                    mav = new ModelAndView("basket-view");
//                    List<Accessorises> accessorisesList = (List<Accessorises>) session.getAttribute("basket");
//                    mav.addObject("accessorisesList", accessorisesList);
//                }
//                User clientLogged = new User(dBUser.getFname() + dBUser.getLname(), user.getUsername(), user.getPassword(), "client");
//                session.setAttribute("loggedUser", clientLogged);
//            }
//        }
//        redirectAttributes.addFlashAttribute("message", message);
//        return mav;
//    }

}
