package com.spr.controller;

import com.spr.exception.ContractNotFound;
import com.spr.model.CoworkingSpace;
import com.spr.validation.ContractValidator;
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
    @Autowired
    private CoworkingSpaceValidator coworkingSpaceValidator;

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.setValidator(coworkingSpaceValidator);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newContractPage() {
        ModelAndView mav = new ModelAndView("add-space", "coworkingSpace", new CoworkingSpace());
//        List<Adoption> adoptionList = adoptionService.findAllWithoutContract();
//        mav.addObject("adoptionList", adoptionList);
//        List<Client> clientList = clientService.findAll();
//        mav.addObject("clientList", clientList);
//        List<Integer> adId = new ArrayList<>();
//        for (Adoption a : adoptionList) {
//            adId.add(a.getId());
//        }
        //mav.addObject("adoptionId", 1);
        return mav;
    }

    private int coworkingSpaceId;

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createNewContract(@ModelAttribute @Valid CoworkingSpace coworkingSpace, HttpServletResponse response,
                                          BindingResult result, @RequestParam("type") Integer id,
                                          final RedirectAttributes redirectAttributes, HttpSession session){

        if (result.hasErrors())
            return new ModelAndView("add-space");

        ModelAndView mav = new ModelAndView();
        String message = "New coworkingSpace " + coworkingSpace.getId() + " was successfully created.";

//       CoworkingSpace check = coworkingSpaceService.create(coworkingSpace);
//        if (check == null)
//            message = "FAIL: CoworkingSpace already exists!";
//        else {
//            Adoption ad = adoptionService.findById(id);
//            ad.setIdUser(((User) session.getAttribute("logedUser")).getId());
//            ad.setIdContract(check.getId());
//            coworkingSpaceId = ad.getIdContract();
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

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editContractPage(@PathVariable Integer id) {
        ModelAndView mav = new ModelAndView("manage-space");

        CoworkingSpace coworkingSpace = new CoworkingSpace();
        mav.addObject("coworkingSpace", coworkingSpace);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView editContract(@ModelAttribute @Valid CoworkingSpace coworkingSpace,
                                     BindingResult result,
                                     @PathVariable Integer id,
                                     final RedirectAttributes redirectAttributes, HttpSession session) throws ContractNotFound {

        if (result.hasErrors())
            return new ModelAndView("manage-space");

        ModelAndView mav = new ModelAndView("redirect:/user-page.html");
        String message = "CoworkingSpace was successfully updated.";


        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public ModelAndView deleteContract(@PathVariable Integer id,
                                       final RedirectAttributes redirectAttributes, HttpSession session) throws ContractNotFound {

        ModelAndView mav = new ModelAndView("redirect:/user-page.html");

        String message = "The coworkingSpace " + id + " was successfully deleted.";

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }
}
