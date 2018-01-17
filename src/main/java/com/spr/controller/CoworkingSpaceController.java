package com.spr.controller;

import com.spr.exception.CoworkingSpaceNotFound;
import com.spr.model.CoworkingSpace;
import com.spr.model.Office;
import com.spr.utils.InitialSpacesFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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

    private int coworkingSpaceId;

    @RequestMapping(value = "/create/message", method = RequestMethod.GET)
    public ModelAndView newCoworkingSpacePage(HttpSession session) {
        ModelAndView mav = new ModelAndView("my-account", "space", new CoworkingSpace());
        String message = "";
        message = "Space added successfully";

        mav.addObject("message", message);
        mav.addObject("username", session.getAttribute("loggedUser"));
        return mav;
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView afterCreateSendMessage(HttpSession session) {
        ModelAndView mav = new ModelAndView("add-space", "coworkingSpace", new CoworkingSpace());
        List<String> amenities = new ArrayList<>();
        amenities.add("coffee machine");
        amenities.add("computer devices");
        amenities.add("projector devices");
        amenities.add("home cinema 5.1");
        amenities.add("whiteboard device");
        amenities.add("colored markers");

        mav.addObject("generalAmenities", amenities);

        List<String> type = new ArrayList<>();
        type.add("open space");
        type.add("private office");

        mav.addObject("type", type);

        List<Integer> officeNr = new ArrayList<>();
        officeNr.add(1);
        officeNr.add(2);
        officeNr.add(3);
        officeNr.add(4);
        officeNr.add(5);
        officeNr.add(6);
        officeNr.add(7);
        officeNr.add(8);
        officeNr.add(9);
        officeNr.add(10);
        mav.addObject("numberOfOffices", officeNr);

        mav.addObject("username", session.getAttribute("loggedUser"));
        return mav;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createNewCoworkingSpace(@ModelAttribute @Valid CoworkingSpace coworkingSpace, HttpServletResponse response,
                                                BindingResult result, @RequestParam("type") Integer id,
                                                final RedirectAttributes redirectAttributes, HttpSession session) {

        if (result.hasErrors())
            return new ModelAndView("add-space");

        String message = "New coworkingSpace " + coworkingSpace.getId() + " was successfully created.";

        ModelAndView mav = new ModelAndView("manage-space", "space", new CoworkingSpace());
        mav.addObject("username", session.getAttribute("loggedUser"));
        List<CoworkingSpace> spaceList;

        try {
            spaceList = (List<CoworkingSpace>) session.getAttribute("loggedUserSpaces");
            session.removeAttribute("loggedUserSpaces");
            session.setAttribute("loggedUserSpaces", spaceList);

            if (spaceList == null) {
                spaceList = new ArrayList<>();
                InitialSpacesFactory spacesFactory = new InitialSpacesFactory();
                spaceList = spacesFactory.getFirstNSpaces(4);
                session.setAttribute("loggedUserSpaces", spaceList);
            } else {
                if (spaceList.size() == 0) {
                    spaceList = new ArrayList<>();
                    InitialSpacesFactory spacesFactory = new InitialSpacesFactory();
                    spaceList = spacesFactory.getFirstNSpaces(4);
                    session.setAttribute("loggedUserSpaces", spaceList);
                }
            }

        } catch (Exception e) {
            spaceList = new ArrayList<>();
            InitialSpacesFactory spacesFactory = new InitialSpacesFactory();
            spaceList = spacesFactory.getFirstNSpaces(4);
            session.setAttribute("loggedUserSpaces", spaceList);
        }

        spaceList.add(coworkingSpace);
        session.removeAttribute("loggedUserSpaces");
        session.setAttribute("loggedUserSpaces", spaceList);

        mav.addObject("message", message);
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
        ModelAndView mav = new ModelAndView("manage-space", "space", new CoworkingSpace());
        mav.addObject("username", session.getAttribute("loggedUser"));
        List<CoworkingSpace> spaceList;

        try {
            spaceList = (List<CoworkingSpace>) session.getAttribute("loggedUserSpaces");
            session.removeAttribute("loggedUserSpaces");
            session.setAttribute("loggedUserSpaces", spaceList);

            if (spaceList == null) {
                spaceList = new ArrayList<>();
                InitialSpacesFactory spacesFactory = new InitialSpacesFactory();
                spaceList = spacesFactory.getFirstNSpaces(4);
                session.setAttribute("loggedUserSpaces", spaceList);
            } else {
                if (spaceList.size() == 0) {
                    spaceList = new ArrayList<>();
                    InitialSpacesFactory spacesFactory = new InitialSpacesFactory();
                    spaceList = spacesFactory.getFirstNSpaces(4);
                    session.setAttribute("loggedUserSpaces", spaceList);
                }
            }

        } catch (Exception e) {
            spaceList = new ArrayList<>();
            InitialSpacesFactory spacesFactory = new InitialSpacesFactory();
            spaceList = spacesFactory.getFirstNSpaces(4);
            session.setAttribute("loggedUserSpaces", spaceList);
        }
        mav.addObject("message", "");
        mav.addObject("spaceList", spaceList);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editCoworkingSpacePage(@PathVariable Integer id, HttpSession session) {
        ModelAndView mav = new ModelAndView("edit-space");
        List<CoworkingSpace> spaceList;
        spaceList = (List<CoworkingSpace>) session.getAttribute("loggedUserSpaces");
        CoworkingSpace spaceToEdit = null;

        for (CoworkingSpace s : spaceList) {
            if (s.getId() == id) {
                spaceToEdit = s;
                break;
            }
        }

        List<String> type = new ArrayList<>();
        type.add("open space");
        type.add("private office");

        mav.addObject("type", type);
        mav.addObject("username", session.getAttribute("loggedUser"));
        mav.addObject("space", spaceToEdit);
        mav.addObject("message", "");
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView editCoworkingSpace(@ModelAttribute @Valid CoworkingSpace coworkingSpace,
                                           BindingResult result,
                                           @PathVariable Integer id,
                                           final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        String message = "";

        if (result.hasErrors()) {
            message = "Error editing space!";
            redirectAttributes.addFlashAttribute("message", message);
            return new ModelAndView("manage-space");
        }

        ModelAndView mav = new ModelAndView("manage-space", "space", new CoworkingSpace());
        mav.addObject("username", session.getAttribute("loggedUser"));
        List<CoworkingSpace> spaceList;
        boolean found = false;
        spaceList = (List<CoworkingSpace>) session.getAttribute("loggedUserSpaces");

        for (CoworkingSpace s : spaceList) {
            if (s.getId() == coworkingSpace.getId()) {
                found = true;
                s.setName(coworkingSpace.getName());
                s.setISBN(coworkingSpace.getISBN());
                s.setClosingHour(coworkingSpace.getClosingHour());
                s.setOpeningHour(coworkingSpace.getOpeningHour());
                s.setWebURL(coworkingSpace.getWebURL());
                s.setOwnerEmail(coworkingSpace.getOwnerEmail());
                s.setDescription(coworkingSpace.getDescription());
                s.setFacebookUrl(coworkingSpace.getFacebookUrl());
                s.setOwnerPhone(coworkingSpace.getOwnerPhone());
                s.setTwitterUrl(coworkingSpace.getTwitterUrl());
                break;
            }
        }

        if (!found) {
            message = "Space requested not found";
        } else {
            message = "Space edited!";
        }
        session.removeAttribute("loggedUserSpaces");
        session.setAttribute("loggedUserSpaces", spaceList);

        mav.addObject("spaceList", spaceList);
        mav.addObject("message", message);
        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteCoworkingSpace(@PathVariable Integer id,
                                             final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        String message = "";

        if (id == null) {
            message = "Error editing space!";
            redirectAttributes.addFlashAttribute("message", message);
            return new ModelAndView("manage-space");
        }

        ModelAndView mav = new ModelAndView("manage-space", "space", new CoworkingSpace());
        mav.addObject("username", session.getAttribute("loggedUser"));
        List<CoworkingSpace> spaceList;
        List<CoworkingSpace> spaceListAfterDelete = new ArrayList<>();

        spaceList = (List<CoworkingSpace>) session.getAttribute("loggedUserSpaces");

        for (CoworkingSpace s : spaceList) {
            if (s.getId() != id) {
                spaceListAfterDelete.add(s);
            }
        }

        session.removeAttribute("loggedUserSpaces");
        session.setAttribute("loggedUserSpaces", spaceListAfterDelete);

        message = "Space deleted!";
        mav.addObject("spaceList", spaceListAfterDelete);
        mav.addObject("message", message);
        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public ModelAndView viewSpace(@PathVariable Integer id,
                                  final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();
        CoworkingSpace cs = coworkingSpaces.get(id - 1);
        ModelAndView mav = new ModelAndView("view-space");
        mav.addObject("cs", cs);

        List<String> userReservations = new ArrayList<>();
        userReservations.add("Grigorescu Team at 16:30 for 4 hours in 20.01.2018");
        userReservations.add("Manastur HUB at 10:30 for 2 hours in 23.01.2018");
        mav.addObject("userReservations", userReservations);

        String message = "";
        boolean isLogged = false;
        String user;
        try {
            user = (String) session.getAttribute("loggedUser");
            if (user != null && user != "") {
                isLogged = true;
                mav.addObject("username", session.getAttribute("loggedUser"));
            }
        } catch (Exception e) {

        }


        mav.addObject("isLogged", isLogged);
        mav.addObject("currentSpID", id);

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/create-office/{id}", method = RequestMethod.POST)
    public ModelAndView createOfiice(@PathVariable Integer id, @ModelAttribute @Valid Office office,
                                     BindingResult result,
                                     final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        ModelAndView mav = new ModelAndView("add-space", "coworkingSpace", new CoworkingSpace());
        List<String> amenities = new ArrayList<>();
        amenities.add("coffee machine");
        amenities.add("computer devices");
        amenities.add("projector devices");
        amenities.add("home cinema 5.1");
        amenities.add("whiteboard device");
        amenities.add("colored markers");

        mav.addObject("generalAmenities", amenities);

        List<String> type = new ArrayList<>();
        type.add("open space");
        type.add("private office");

        mav.addObject("type", type);

        List<Integer> officeNr = new ArrayList<>();
        officeNr.add(1);
        officeNr.add(2);
        officeNr.add(3);
        officeNr.add(4);
        officeNr.add(5);
        officeNr.add(6);
        officeNr.add(7);
        mav.addObject("numberOfOffices", officeNr);
        mav.addObject("username", session.getAttribute("loggedUser"));

        List<Office> offices;
        try {
            offices = (List<Office>) session.getAttribute("addedOfficesList");
            if (offices == null) {
                offices = new ArrayList<>();
                offices.add(office);
                session.removeAttribute("addedOfficesList");
                session.setAttribute("addedOfficesList", offices);
            } else if (offices.size() == 0) {
                offices = new ArrayList<>();
                offices.add(office);
                session.removeAttribute("addedOfficesList");
                session.setAttribute("addedOfficesList", offices);
            }
        } catch (Exception e) {
            offices = new ArrayList<>();
            offices.add(office);
            session.removeAttribute("addedOfficesList");
            session.setAttribute("addedOfficesList", offices);
        }
        return mav;
    }

    @RequestMapping(value = "/messageUs/{id}", method = RequestMethod.GET)
    public ModelAndView messageUs(@PathVariable Integer id,
                                  final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();
        CoworkingSpace cs = coworkingSpaces.get(id - 1);
        ModelAndView mav = new ModelAndView("view-space");
        mav.addObject("cs", cs);

        String message = "Message to space " + cs.getName() + " was successfully sent.";
        boolean isLogged = false;
        String user;
        try {
            user = (String) session.getAttribute("loggedUser");
            if (user != null && user != "") {
                isLogged = true;
                mav.addObject("username", session.getAttribute("loggedUser"));
            }
        } catch (Exception e) {

        }
        List<String> userReservations = new ArrayList<>();
        userReservations.add("Grigorescu Team at 16:30 for 4 hours in 20.01.2018");
        userReservations.add("Manastur HUB at 10:30 for 2 hours in 23.01.2018");
        mav.addObject("userReservations", userReservations);

        mav.addObject("isLogged", isLogged);
        mav.addObject("currentSpID", id);
        mav.addObject("message", message);

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/scheduleTour/{id}", method = RequestMethod.GET)
    public ModelAndView scheduleTour(@PathVariable Integer id,
                                     final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();
        CoworkingSpace cs = coworkingSpaces.get(id - 1);
        ModelAndView mav = new ModelAndView("view-space");
        mav.addObject("cs", cs);

        String message = "Tour was scheduled at space " + cs.getName() + ".";
        boolean isLogged = false;
        String user;
        try {
            user = (String) session.getAttribute("loggedUser");
            if (user != null && user != "") {
                isLogged = true;
                mav.addObject("username", session.getAttribute("loggedUser"));
            }
        } catch (Exception e) {

        }

        List<String> userReservations = new ArrayList<>();
        userReservations.add("Grigorescu Team at 16:30 for 4 hours in 20.01.2018");
        userReservations.add("Manastur HUB at 10:30 for 2 hours in 23.01.2018");
        mav.addObject("userReservations", userReservations);
        mav.addObject("isLogged", isLogged);
        mav.addObject("currentSpID", id);
        mav.addObject("message", message);

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/invite/{id}", method = RequestMethod.GET)
    public ModelAndView invite(@PathVariable Integer id,
                               final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();
        CoworkingSpace cs = coworkingSpaces.get(id - 1);
        ModelAndView mav = new ModelAndView("view-space");
        mav.addObject("cs", cs);

        String message = "Invitation sent!";
        boolean isLogged = false;
        String user;
        try {
            user = (String) session.getAttribute("loggedUser");
            if (user != null && user != "") {
                isLogged = true;
                mav.addObject("username", session.getAttribute("loggedUser"));
            }
        } catch (Exception e) {

        }
        List<String> userReservations = new ArrayList<>();
        userReservations.add("Grigorescu Team at 16:30 for 4 hours in 20.01.2018");
        userReservations.add("Manastur HUB at 10:30 for 2 hours in 23.01.2018");
        mav.addObject("userReservations", userReservations);

        mav.addObject("isLogged", isLogged);
        mav.addObject("currentSpID", id);
        mav.addObject("message", message);

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/pay/{id}", method = RequestMethod.GET)
    public ModelAndView reserve(@PathVariable Integer id,
                                final RedirectAttributes redirectAttributes, HttpSession session) throws CoworkingSpaceNotFound {

        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();
        CoworkingSpace cs = coworkingSpaces.get(id - 1);
        ModelAndView mav = new ModelAndView("view-space");
        mav.addObject("cs", cs);

        String message = "Reservation to " + cs.getName() + " is made and payment is process by an external service";
        boolean isLogged = false;
        String user;
        try {
            user = (String) session.getAttribute("loggedUser");
            if (user != null && user != "") {
                isLogged = true;
                mav.addObject("username", session.getAttribute("loggedUser"));
            }
        } catch (Exception e) {

        }

        List<String> userReservations = new ArrayList<>();
        userReservations.add("Grigorescu Team at 16:30 for 4 hours in 20.01.2018");
        userReservations.add("Manastur HUB at 10:30 for 2 hours in 23.01.2018");
        mav.addObject("userReservations", userReservations);

        mav.addObject("isLogged", isLogged);
        mav.addObject("currentSpID", id);
        mav.addObject("message", message);

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }
}
