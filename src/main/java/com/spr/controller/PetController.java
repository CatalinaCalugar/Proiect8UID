package com.spr.controller;

import com.spr.exception.PetNotFound;
import com.spr.model.Employee;
import com.spr.model.Pet;
import com.spr.service.PetService;
import com.spr.validation.PetValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import static java.lang.System.out;

/**
 * Created by Catalina on 5/10/2017.
 */
@Controller
@RequestMapping(value = "/pet")
public class PetController {

    @Autowired
    private PetService petService;

    @Autowired
    private PetValidator petValidator;

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.setValidator(petValidator);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newPetPage(HttpSession session, final RedirectAttributes redirectAttributes) {
        if (!session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
        if (((Employee) session.getAttribute("logedEmployee")).getUsername().equals("admin")) {
            ModelAndView mav = new ModelAndView("pet-new", "pet", new Pet());
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createNewPet(@ModelAttribute @Valid Pet pet,
                                     BindingResult result,
                                     final RedirectAttributes redirectAttributes, HttpSession session) {

        if (result.hasErrors())
            return new ModelAndView("pet-new");

        ModelAndView mav = new ModelAndView();
        String message = "New pet " + pet.getName() + " was successfully created.";

        Pet check = petService.create(pet);
        if (check == null)
            message = "FAIL: Pet already exists!";

        mav.setViewName("redirect:/admin-page.html");

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/list/{type}", method = RequestMethod.GET)
    public ModelAndView petListPage(@PathVariable String type) {
        ModelAndView mav = new ModelAndView("pet-list");
        List<Pet> petList;
        if (type.equals("cat")) {
            petList = petService.findByType("cat");
        } else if (type.equals("dog")) {
            petList = petService.findByType("dog");
        } else {
            petList = petService.findAll();
        }
        mav.addObject("petList", petList);
        return mav;
    }

    @RequestMapping(value = "/return", method = RequestMethod.GET)
    public ModelAndView returnPet(HttpSession session, final RedirectAttributes redirectAttributes) {

        if (session.getAttribute("logedEmployee") == null || !((Employee) session.getAttribute("logedEmployee")).getRole().equals("user")) {
            ModelAndView mav = new ModelAndView("redirect:/index.html");
            String message = "You must login";
            redirectAttributes.addFlashAttribute("message", message);
            return mav;
        }
        ModelAndView mav = new ModelAndView("pet-unavailable");
        List<Pet> petList = petService.findAllUnavailable();
        mav.addObject("petList", petList);
        return mav;
    }

    @RequestMapping(value = "/listAdmin/{type}", method = RequestMethod.GET)
    public ModelAndView petListPageAdmin(@PathVariable String type) {
        ModelAndView mav = new ModelAndView("pet-listAdmin");
        List<Pet> petList;
        if (type.equals("cat")) {
            petList = petService.findByType("cat");
        } else if (type.equals("dog")) {
            petList = petService.findByType("dog");
        } else {
            petList = petService.findAll();
        }
        mav.addObject("petList", petList);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editPetPage(@PathVariable Integer id) {
        ModelAndView mav = new ModelAndView("pet-edit");
        Pet pet = petService.findById(id);
        mav.addObject("pet", pet);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView editPet(@ModelAttribute @Valid Pet pet,
                                BindingResult result,
                                @PathVariable Integer id,
                                final RedirectAttributes redirectAttributes, HttpSession session) throws PetNotFound {

        if (result.hasErrors())
            return new ModelAndView("pet-edit");
        ModelAndView mav;
        if (((Employee) session.getAttribute("logedEmployee")).getRole().equals("user"))
            mav = new ModelAndView("redirect:/user-page.html");
        else
            mav = new ModelAndView("redirect:/admin-page.html");

        String message = "Pet was successfully updated.";

        petService.update(pet);

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deletePet(@PathVariable Integer id,
                                  final RedirectAttributes redirectAttributes, HttpSession session) throws PetNotFound {

        if (!session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
        if (((Employee) session.getAttribute("logedEmployee")).getUsername().equals("admin")) {
            ModelAndView mav = new ModelAndView("redirect:/admin-page.html");

            Pet pet = petService.delete(id);
            String message = "The pet " + pet.getName() + " was successfully deleted.";

            redirectAttributes.addFlashAttribute("message", message);
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
    }

    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public ModelAndView viewPet(@PathVariable Integer id, HttpSession session) {
        ModelAndView mav = new ModelAndView("pet-view");
        Pet toShow = petService.findById(id);
        session.setAttribute("jsp", "pet-view");
        mav.addObject("pet", toShow);
        return mav;
    }

}
