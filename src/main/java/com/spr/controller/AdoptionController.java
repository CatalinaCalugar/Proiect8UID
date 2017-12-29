package com.spr.controller;

import com.spr.exception.AdoptionNotFound;
import com.spr.exception.PetNotFound;
import com.spr.model.*;
import com.spr.service.AdoptionService;
import com.spr.service.ClientService;
import com.spr.service.PaymentService;
import com.spr.service.PetService;
import com.spr.validation.AdoptionValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static java.lang.System.out;

/**
 * Created by Catalina on 5/10/2017.
 */
@Controller
@RequestMapping(value = "/adoption")
public class AdoptionController {
    @Autowired
    private AdoptionService adoptionService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private ClientService clientService;


    @Autowired
    private PetService petService;


    @Autowired
    private AdoptionValidator adoptionValidator;

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.setValidator(adoptionValidator);
    }

    @RequestMapping(value = "/create/{id}", method = RequestMethod.GET)
    public ModelAndView newAdoptionPage(@PathVariable Integer id, HttpSession session, final RedirectAttributes redirectAttributes) {

        if (!session.getAttributeNames().hasMoreElements()) {
            redirectAttributes.addFlashAttribute("message", "You must login");
            return new ModelAndView("redirect:/employee/login.html");
        }

        if (session.getAttribute("logedEmployee") == null) {
            redirectAttributes.addFlashAttribute("message", "You must login");
            return new ModelAndView("redirect:/employee/login.html");
        }
        if (((Employee) session.getAttribute("logedEmployee")).getRole().equals("client")) {
            Timestamp date = new Timestamp(System.currentTimeMillis());
            ModelAndView mav = new ModelAndView("adoption-new", "adoption", new Adoption(id, date, ((Employee) session.getAttribute("logedEmployee")).getId()));
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "You must login");
            return new ModelAndView("redirect:/employee/login.html");
        }
    }

    @RequestMapping(value = "/create/{id}", method = RequestMethod.POST)
    public ModelAndView createNewAdoption(@PathVariable Integer id, @ModelAttribute Adoption adoption,
                                          BindingResult result, @RequestParam("type") String payType,
                                          final RedirectAttributes redirectAttributes, HttpSession session) throws PetNotFound {

        if (payType == null || payType.equals("")) {
            Timestamp date = new Timestamp(System.currentTimeMillis());
            ModelAndView mav = new ModelAndView("adoption-new", "adoption", new Adoption(id, date, ((Employee) session.getAttribute("logedEmployee")).getId()));
            mav.addObject("message", "Select payment type!");
            return mav;
        }
        if (result.hasErrors())
            return new ModelAndView("adoption-new");

        ModelAndView mav = new ModelAndView();
        String message = "New adoption was made in: " + adoption.getAdoptionDate();
        Pet p = petService.findById(adoption.getIdPet());
        Payment pay = new Payment(payType, (float) 0.0, p.getPrice());
        paymentService.create(pay);
        adoption.setPaymentId(pay.getId());
        adoption.setIdEmployee(99999);
        adoption.setIdContract(99999);
        Adoption check = adoptionService.create(adoption);

        Client client = clientService.findById(adoption.getIdClient());
        if (check == null)
            message = "FAIL: Adoption already exists!";

        mav.setViewName("redirect:/client-page.html");
        p.setAvailable(false);
        petService.update(p);
        SendGmail.sendEmail(client.getEmail(), "Adoption confirmation", message + " contract ID:" + adoption.getIdContract() + " pet name: " + p.getName() + " " + p.getRace() + " " + p.getPrice());
        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newAdoptionPageAfterLog(HttpSession session, final RedirectAttributes redirectAttributes) {

        if (!session.getAttributeNames().hasMoreElements()) {
            redirectAttributes.addFlashAttribute("message", "You must login");
            return new ModelAndView("redirect:/employee/login.html");
        }

        if (session.getAttribute("logedEmployee") == null) {
            redirectAttributes.addFlashAttribute("message", "You must login");
            return new ModelAndView("redirect:/employee/login.html");
        }
        if (((Employee) session.getAttribute("logedEmployee")).getRole().equals("client")) {
            Timestamp date = new Timestamp(System.currentTimeMillis());

            ModelAndView mav = new ModelAndView("adoption-new", "adoption", new Adoption((Integer) session.getAttribute("idPet"), date, ((Employee) session.getAttribute("logedEmployee")).getId()));
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "You must login");
            return new ModelAndView("redirect:/employee/login.html");
        }
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createNewAdoptionAfterLog(@ModelAttribute Adoption adoption,
                                                  BindingResult result,
                                                  final RedirectAttributes redirectAttributes, HttpSession session) {

        if (result.hasErrors())
            return new ModelAndView("adoption-new");

        ModelAndView mav = new ModelAndView();
        String message = "New adoption " + adoption.getId() + " was successfully created.";

        Adoption check = adoptionService.create(adoption);
        if (check == null)
            message = "FAIL: Adoption already exists!";

        mav.setViewName("redirect:/client-page.html");

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView adoptionListPage() {
        ModelAndView mav = new ModelAndView("adoption-list");
        List<Adoption> adoptionList = adoptionService.findAll();
        mav.addObject("adoptionList", adoptionList);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editAdoptionPage(@PathVariable Integer id) {
        ModelAndView mav = new ModelAndView("adoption-edit");
        Adoption adoption = adoptionService.findById(id);
        mav.addObject("adoption", adoption);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView editAdoption(@ModelAttribute @Valid Adoption adoption,
                                     BindingResult result,
                                     @PathVariable Integer id,
                                     final RedirectAttributes redirectAttributes, HttpSession session) throws AdoptionNotFound {

        if (result.hasErrors())
            return new ModelAndView("adoption-edit");

        ModelAndView mav = new ModelAndView("redirect:/user-page.html");
        String message = "Adoption was successfully updated.";

        adoptionService.update(adoption);

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteAdoption(@PathVariable Integer id,
                                       final RedirectAttributes redirectAttributes, HttpSession session) throws AdoptionNotFound {

        ModelAndView mav = new ModelAndView("redirect:/user-page.html");

        Adoption adoption = adoptionService.delete(id);
        String message = "The adoption " + adoption.getId() + " was successfully deleted.";

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

}
