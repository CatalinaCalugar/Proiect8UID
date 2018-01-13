package com.spr.controller;

import com.spr.exception.CoworkingSpaceNotFound;
import com.spr.model.CoworkingSpace;
import com.spr.model.User;
import com.spr.utils.InitialSpacesFactory;
import com.spr.validation.CoworkingSpaceValidator;
import com.spr.validation.CoworkingSpaceValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cata_ on 1/5/2018.
 */
@Controller
@RequestMapping(value = "/space")
public class CoworkingSpaceController {
//    @Autowired
//    private CoworkingSpaceValidator coworkingSpaceValidator;
//
//    @InitBinder
//    private void initBinder(WebDataBinder binder) {
//        binder.setValidator(coworkingSpaceValidator);
//    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newCoworkingSpacePage(HttpSession session) {
        ModelAndView mav = new ModelAndView("add-space", "coworkingSpace", new CoworkingSpace());
        List<String> amenities = new ArrayList<>();
        amenities.add("coffee machine");
        amenities.add("computer devices");
        amenities.add("projector devices");
        amenities.add("home cinema 5.1");
        amenities.add("whiteboard device");
        amenities.add("colored markers");

        mav.addObject("generalAmenities", amenities);
        List<Integer> numbers = new ArrayList<>();
        numbers.add(1);
        numbers.add(2);
        numbers.add(3);
        numbers.add(4);
        numbers.add(5);
        numbers.add(6);
        numbers.add(7);
        numbers.add(8);
        numbers.add(9);
        numbers.add(10);
        mav.addObject("officeNumbers", numbers);

        mav.addObject("username", session.getAttribute("loggedUser"));
        return mav;
    }

    private int coworkingSpaceId;

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createNewCoworkingSpace(@ModelAttribute @Valid CoworkingSpace coworkingSpace, HttpServletResponse response,
                                                BindingResult result, @RequestParam("type") Integer id,
                                                final RedirectAttributes redirectAttributes, HttpSession session) {

        if (result.hasErrors())
            return new ModelAndView("add-space");

        ModelAndView mav = new ModelAndView();
        String message = "New coworkingSpace " + coworkingSpace.getId() + " was successfully created.";

//       CoworkingSpace check = coworkingSpaceService.create(coworkingSpace);
//        if (check == null)
//            message = "FAIL: CoworkingSpace already exists!";
//        else {
//            Adoption ad = adoptionService.findById(id);
//            ad.setIdUser(((User) session.getAttribute("loggedUser")).getId());
//            ad.setIdCoworkingSpace(check.getId());
//            coworkingSpaceId = ad.getIdCoworkingSpace();
//            adoptionService.update(ad);
//            Client cl = clientService.findById(ad.getIdClient());
//            Pet adoptedPet = petService.findById(ad.getIdPet());
//            adoptedPet.setAvailable(false);
//            petService.update(adoptedPet);
//            Report r = new PdfReport();
//            r.generate(coworkingSpace, ad, cl, adoptedPet.getPrice());
//        }
        mav.setViewName("coworkingSpace-download");

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView coworkingSpaceListPage() {
        ModelAndView mav = new ModelAndView("coworkingSpace-list");
        List<CoworkingSpace> coworkingSpaceList = new ArrayList<>();

        mav.addObject("coworkingSpaceList", coworkingSpaceList);
        return mav;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView manageSpace(HttpSession session) {
        ModelAndView mav = new ModelAndView("manage-space", "command", new CoworkingSpace());
        mav.addObject("username", session.getAttribute("loggedUser"));
        List<CoworkingSpace> spaceList = new ArrayList<>();
        InitialSpacesFactory spacesFactory = new InitialSpacesFactory();
        spaceList = spacesFactory.getFirstNSpaces(4);

        mav.addObject("spaceList", spaceList);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editCoworkingSpacePage(@PathVariable Integer id, HttpSession session) {
        ModelAndView mav = new ModelAndView("edit-space");

        InitialSpacesFactory spacesFactory = new InitialSpacesFactory();
        CoworkingSpace space = spacesFactory.getSpaceByID(id);
        mav.addObject("username", session.getAttribute("loggedUser"));
        mav.addObject("space", space);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView editCoworkingSpace(@ModelAttribute @Valid CoworkingSpace coworkingSpace,
                                           BindingResult result,
                                           @PathVariable Integer id,
                                           final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        if (result.hasErrors())
            return new ModelAndView("manage-space");

        ModelAndView mav = new ModelAndView("redirect:/user-page.html");
        String message = "CoworkingSpace was successfully updated.";


        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public ModelAndView deleteCoworkingSpace(@PathVariable Integer id,
                                             final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        ModelAndView mav = new ModelAndView("redirect:/user-page.html");

        String message = "The coworkingSpace " + id + " was successfully deleted.";

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public ModelAndView viewSpace(@PathVariable Integer id,
                                  final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        ModelAndView mav = new ModelAndView("view-space");

        String message = "The coworkingSpace " + id + " was successfully deleted.";

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }


}
