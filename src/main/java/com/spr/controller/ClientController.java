package com.spr.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.spr.model.Accessorises;
import com.spr.model.Employee;
import com.spr.service.EmployeeService;
import com.spr.validation.EmployeeValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spr.exception.ClientNotFound;
import com.spr.model.Client;
import com.spr.service.ClientService;
import com.spr.validation.ClientValidator;

@Controller
@RequestMapping(value = "/client")
public class ClientController {

    @Autowired
    private ClientService clientService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private ClientValidator clientValidator;

    @InitBinder
    private void initBinder(WebDataBinder binder) {

        binder.setValidator(clientValidator);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newClientPage(final RedirectAttributes redirectAttributes, HttpSession session) {

        ModelAndView mav = new ModelAndView("client-new");
        mav.addObject("client", new Client());
        return mav;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createNewClient(@ModelAttribute @Valid Client client,
                                        BindingResult result,
                                        final RedirectAttributes redirectAttributes, HttpSession session) {

        if (result.hasErrors())
            return new ModelAndView("client-new");

        ModelAndView mav = new ModelAndView();
        String message = "New client " + client.getEmail() + " was successfully created.";
        Employee emp;

        Client check = clientService.create(client);
        if (session.getAttribute("logedEmployee") == null) {
            emp = employeeService.create(new Employee(client.getFname() + client.getLname(), client.getUsername(), client.getPassword(), "client"));
            session.setAttribute("logedEmployee", emp);
            if (check == null || emp == null)
                message = "FAIL! Try again";

            if (session.getAttribute("idPet") != null) {
                mav.setViewName("redirect:/pet-view.html");
            } else {
                mav.setViewName("basket-view");
                List<Accessorises> accessorisesList = (List<Accessorises>) session.getAttribute("basket");
                mav.addObject("accessorisesList", accessorisesList);
            }
            redirectAttributes.addFlashAttribute("message", message);
            return mav;
        } else {
            if (check == null)
                message = "FAIL: Client already exists!";

            mav.setViewName("redirect:/admin-page.html");
            redirectAttributes.addFlashAttribute("message", message);
            return mav;
        }
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView clientListPage() {
        ModelAndView mav = new ModelAndView("client-list");
        List<Client> clientList = clientService.findAll();
        mav.addObject("clientList", clientList);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editClientPage(@PathVariable Integer id) {
        ModelAndView mav = new ModelAndView("client-edit");
        Client client = clientService.findById(id);
        mav.addObject("client", client);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView editClient(@ModelAttribute @Valid Client client,
                                   BindingResult result,
                                   @PathVariable Integer id,
                                   final RedirectAttributes redirectAttributes, HttpSession session) throws ClientNotFound {

        if (result.hasErrors())
            return new ModelAndView("client-edit");

        ModelAndView mav = new ModelAndView("redirect:/admin-page.html");
        String message = "Client was successfully updated.";

        clientService.update(client);

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteClient(@PathVariable Integer id,
                                     final RedirectAttributes redirectAttributes, HttpSession session) throws ClientNotFound {

        ModelAndView mav = new ModelAndView("redirect:/admin-page.html");

        Client client = clientService.delete(id);
        String message = "The client " + client.getEmail() + " was successfully deleted.";

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

}
