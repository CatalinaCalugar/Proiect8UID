package com.spr.controller;

import com.spr.exception.AccesorisesNotFound;
import com.spr.model.Accessorises;
import com.spr.model.Client;
import com.spr.model.Employee;
import com.spr.service.AccesorisesService;
import com.spr.service.ClientService;
import com.spr.validation.AccesorisesValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Catalina on 5/10/2017.
 */
@Controller
@RequestMapping(value = "/accessorises")
public class AccesorisesController {

    @Autowired
    private AccesorisesService accessorisesService;

    @Autowired
    private ClientService clientService;

//    @Autowired
//    private AccesorisesValidator accessorisesValidator;
//
//    @InitBinder
//    private void initBinder(WebDataBinder binder) {
//        binder.setValidator(accessorisesValidator);
//    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newAccesorisesPage(HttpSession session, final RedirectAttributes redirectAttributes) {
        if (session.getAttribute("logedEmployee") == null || !session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
        if (((Employee) session.getAttribute("logedEmployee")).getUsername().equals("admin")
                || ((Employee) session.getAttribute("logedEmployee")).getUsername().equals("user")) {
            ModelAndView mav = new ModelAndView("accessorises-new", "accessorises", new Accessorises());
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createNewAccesorises(@ModelAttribute @Valid Accessorises accessorises,
                                             BindingResult result,
                                             final RedirectAttributes redirectAttributes, HttpSession session) {

        if (result.hasErrors())
            return new ModelAndView("accessorises-new");

        ModelAndView mav = new ModelAndView();
        String message = "New accessorises " + accessorises.getName() + " was successfully created.";

        Accessorises check = accessorisesService.create(accessorises);
        if (check == null)
            message = "FAIL: Accessorises already exists!";

        if (((Employee) session.getAttribute("logedEmployee")).getRole().equals("admin"))
            mav = new ModelAndView("redirect:/admin-page.html");
        else
            mav = new ModelAndView("redirect:/user-page.html");

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView accessorisesListPage() {
        ModelAndView mav = new ModelAndView("accessorises-list");
        List<Accessorises> accessorisesList = accessorisesService.findAll();
        mav.addObject("accessorisesList", accessorisesList);
        return mav;
    }

    @RequestMapping(value = "/buy", method = RequestMethod.GET)
    public ModelAndView viewBacketPage() {
        ModelAndView mav = new ModelAndView("accessorises-buy");
        List<Accessorises> accessorisesList = accessorisesService.findAllInStock();
        mav.addObject("accessorisesList", accessorisesList);
        return mav;
    }

    @RequestMapping(value = "/viewBacket", method = RequestMethod.GET)
    public ModelAndView buyAccessorises(HttpSession session) {
        ModelAndView mav = new ModelAndView("basket-view");
        List<Accessorises> accessorisesList = (List<Accessorises>) session.getAttribute("basket");
        session.setAttribute("jsp", "basket-view");
        mav.addObject("accessorisesList", accessorisesList);
        return mav;
    }

    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public ModelAndView addToBasket(@PathVariable("id") Integer productId, final RedirectAttributes redirectAttributes, HttpSession session) throws AccesorisesNotFound {
        String message = "Item was added";
        ModelAndView mav = new ModelAndView("accessorises-buy");
        List<Accessorises> allAccessorises = accessorisesService.findAll();
        mav.addObject("accessorisesList", allAccessorises);
        Accessorises accessorises = accessorisesService.findById(productId);
        if (accessorises.getStockNumber() <= 0) {
            message = "Out of stock!";
            redirectAttributes.addFlashAttribute("message", message);
            mav.setViewName("redirect:/accessorises-buy.html");
            return mav;
        } else {
            List<Accessorises> accessorisesList = (List<Accessorises>) session.getAttribute("basket");
            if (accessorisesList == null) {
                accessorisesList = new ArrayList<>();
            }
            accessorisesService.addAccessorises(accessorisesList, accessorises);

//            if (!accessorisesService.checkStock(accessorisesList, accessorises)) {
//                message = "Out of stock!";
//                redirectAttributes.addFlashAttribute("message", message);
//                mav.setViewName("accessorises-buy");
//                return mav;
//            }
            session.setAttribute("basket", accessorisesList);
        }
        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public ModelAndView removeFromBasket(@PathVariable("id") Integer productId, final RedirectAttributes redirectAttributes, HttpSession session) throws AccesorisesNotFound {
        String message = "Item was removed";
        ModelAndView mav = new ModelAndView("basket-view");
        List<Accessorises> accessorisesList = (List<Accessorises>) session.getAttribute("basket");
        mav.addObject("accessorisesList", accessorisesList);
        Accessorises accessorises = accessorisesService.findById(productId);

        if (accessorisesList == null) {
            accessorisesList = new ArrayList<>();
        }
        accessorisesService.deleteAccessorises(accessorisesList, accessorises);

        session.setAttribute("basket", accessorisesList);
        System.out.println(accessorisesList);

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/closeTotal", method = RequestMethod.GET)
    public ModelAndView closeTotalBasket(final RedirectAttributes redirectAttributes, HttpSession session) throws AccesorisesNotFound {
        ModelAndView mav;
        if (session.getAttribute("logedEmployee") == null || !((Employee) (session.getAttribute("logedEmployee"))).getRole().equals("client")) {
            mav = new ModelAndView("login-register", "command", new Employee());
            return mav;
        }
        mav = new ModelAndView("redirect:/client-page.html");
        String message = "Accessorises were successfully purchased.";

        List<Accessorises> accessorisesList = (List<Accessorises>) session.getAttribute("basket");

        if (!accessorisesService.modifyStock(accessorisesList)) {
            message = "Error, please try again!";
            redirectAttributes.addFlashAttribute("message", message);
            return mav;
        }

        if (session.getAttribute("logedEmployee") != null && ((Employee) session.getAttribute("logedEmployee")).getRole().equals("client")) {
            Client cl = clientService.findByUsername(((Employee) session.getAttribute("logedEmployee")).getUsername());
            String text = accessorisesService.email(accessorisesList);
            SendGmail.sendEmail(cl.getEmail(),"Payment confirmation", text);
        }

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editAccesorisesPage(@PathVariable Integer id, HttpSession session, final RedirectAttributes redirectAttributes) {
        if (session.getAttribute("logedEmployee") == null || !session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
        if (((Employee) session.getAttribute("logedEmployee")).getUsername().equals("admin")
                || ((Employee) session.getAttribute("logedEmployee")).getUsername().equals("user")) {
            ModelAndView mav = new ModelAndView("accessorises-edit");
            Accessorises accessorises = accessorisesService.findById(id);
            mav.addObject("accessorises", accessorises);
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView editAccesorises(@ModelAttribute @Valid Accessorises accessorises,
                                        BindingResult result,
                                        @PathVariable Integer id,
                                        final RedirectAttributes redirectAttributes, HttpSession session) throws AccesorisesNotFound {
        if (session.getAttribute("logedEmployee") == null || !session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
        if (((Employee) session.getAttribute("logedEmployee")).getUsername().equals("admin")
                || ((Employee) session.getAttribute("logedEmployee")).getUsername().equals("user")) {
            if (result.hasErrors())
                return new ModelAndView("accessorises-edit");

            ModelAndView mav;
            if (((Employee) session.getAttribute("logedEmployee")).getRole().equals("admin"))
                mav = new ModelAndView("redirect:/admin-page.html");
            else
                mav = new ModelAndView("redirect:/user-page.html");

            String message = "Accessorises was successfully updated.";

            accessorisesService.update(accessorises);

            redirectAttributes.addFlashAttribute("message", message);
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteAccesorises(@PathVariable Integer id,
                                          final RedirectAttributes redirectAttributes, HttpSession session) throws AccesorisesNotFound {
        if (session.getAttribute("logedEmployee") == null || !session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
        if (((Employee) session.getAttribute("logedEmployee")).getUsername().equals("admin")
                || ((Employee) session.getAttribute("logedEmployee")).getUsername().equals("user")) {
            ModelAndView mav;
            if (((Employee) session.getAttribute("logedEmployee")).getRole().equals("admin"))
                mav = new ModelAndView("redirect:/admin-page.html");
            else
                mav = new ModelAndView("redirect:/user-page.html");

            Accessorises accessorises = accessorisesService.delete(id);
            String message = "The accessorises " + accessorises.getName() + " was successfully deleted.";

            redirectAttributes.addFlashAttribute("message", message);
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
    }
}
