package com.spr.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.spr.model.*;
import com.spr.service.ClientService;
import com.spr.service.PetService;
import com.spr.validation.AdoptionValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spr.exception.EmployeeNotFound;
import com.spr.service.EmployeeService;
import com.spr.validation.EmployeeValidator;

@Controller
@RequestMapping(value = "/employee")
public class EmployeeController {

//    @Autowired
//    private EmployeeService employeeService;
//
//    @Autowired
//    private PetService petService;
//
//    @Autowired
//    private ClientService clientService;

//    @Autowired
//    private EmployeeValidator employeeValidator;

    private static final DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

//    @InitBinder
//    private void initBinder(WebDataBinder binder) {
//        binder.setValidator(employeeValidator);
//    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newEmployeePage(HttpSession session, final RedirectAttributes redirectAttributes) {
        if (!session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }
        if (((Employee) session.getAttribute("logedEmployee")).getUsername().equals("admin")) {
            ModelAndView mav = new ModelAndView("employee-new", "employee", new Employee());
            return mav;
        } else {
            redirectAttributes.addFlashAttribute("message", "Unauthorized");
            return new ModelAndView("redirect:/index.html");
        }

    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createNewEmployee(@ModelAttribute @Valid Employee employee,
                                          BindingResult result,
                                          final RedirectAttributes redirectAttributes, HttpSession session) {
        String message;
        if (result.hasErrors())
            return new ModelAndView("employee-new");

        ModelAndView mav = new ModelAndView();
        message = "New employee " + employee.getName() + " was successfully created.";

        //  employeeService.create(employee);

        mav.setViewName("redirect:/admin-page.html");

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }
//
//    @RequestMapping(value = "/list", method = RequestMethod.GET)
//    public ModelAndView employeeListPage(HttpSession session, final RedirectAttributes redirectAttributes) {
//        if (!session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
//            redirectAttributes.addFlashAttribute("message", "Unauthorized");
//            return new ModelAndView("redirect:/index.html");
//        }
//        if (((Employee) session.getAttribute("logedEmployee")).getUsername().equals("admin")) {
//            ModelAndView mav = new ModelAndView("employee-list");
//            List<Employee> employeeList = employeeService.findAll();
//            mav.addObject("employeeList", employeeList);
//            return mav;
//        } else {
//            redirectAttributes.addFlashAttribute("message", "Unauthorized");
//            return new ModelAndView("redirect:/index.html");
//        }
//
//
//    }

//    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
//    public ModelAndView editEmployeePage(@PathVariable Integer id, HttpSession session, final RedirectAttributes redirectAttributes) {
//        if (!session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
//            redirectAttributes.addFlashAttribute("message", "Unauthorized");
//            return new ModelAndView("redirect:/index.html");
//        }
//        if (((Employee) session.getAttribute("logedEmployee")).getUsername().equals("admin")) {
//            ModelAndView mav = new ModelAndView("employee-edit");
//            Employee employee = new Employee("User1","admin","admin","admin");
//            mav.addObject("employee", employee);
//            return mav;
//        } else {
//            redirectAttributes.addFlashAttribute("message", "Unauthorized");
//            return new ModelAndView("redirect:/index.html");
//        }
//
//    }

//    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
//    public ModelAndView editEmployee(@ModelAttribute @Valid Employee employee,
//                                     BindingResult result,
//                                     @PathVariable Integer id,
//                                     final RedirectAttributes redirectAttributes, HttpSession session) throws EmployeeNotFound {
//
//        if (result.hasErrors())
//            return new ModelAndView("employee-edit");
//        ModelAndView mav;
//        String message;
//        Employee e = employeeService.findById(id);
//        if (e.getUsername().equals(employee.getUsername())) {
//            mav = new ModelAndView("employee-edit");
//            message = "Employee was successfully updated.";
//            redirectAttributes.addFlashAttribute("message", message);
//            return mav;
//        }
//        mav = new ModelAndView("redirect:/admin-page.html");
//        message = "Employee was successfully updated.";
//
//        employeeService.update(employee);
//        redirectAttributes.addFlashAttribute("message", message);
//        return mav;
//    }
//
//    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
//    public ModelAndView deleteEmployee(@PathVariable Integer id,
//                                       final RedirectAttributes redirectAttributes, HttpSession session) throws EmployeeNotFound {
//
//        ModelAndView mav = new ModelAndView("redirect:/admin-page.html");
//
//        Employee employee = employeeService.delete(id);
//        String message = "The employee " + employee.getName() + " was successfully deleted.";
//        redirectAttributes.addFlashAttribute("message", message);
//        return mav;
//    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("login", "command", new Employee());
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute("SpringWeb") Employee employee, ModelMap model, final RedirectAttributes redirectAttributes, HttpSession session) {
        model.addAttribute("username", employee.getUsername());
        model.addAttribute("password", employee.getPassword());
        String message = "";
        String page = "";

        if (employee == null) {
            page = "loginFail";
            message = "Login fail!";
        } else {
            if (employee.getUsername().equals("admin") && employee.getPassword().equals("admin")) {
                page = "admin-page";
                message = "Success!";
            } else {
                page = "loginFail";
                message = "Login fail!";
            }
        }
        redirectAttributes.addFlashAttribute("message", message);
        return page;
    }

//    @RequestMapping(value = "/loginReg/{id}", method = RequestMethod.GET)
//    public ModelAndView login1(@PathVariable Integer id, final RedirectAttributes redirectAttributes, HttpSession session) {
//        Pet p = petService.findById(id);
//        ModelAndView mav = null;
//        if (p.isAvailable()) {
//            if (!session.getAttributeNames().hasMoreElements() || session.getAttributeNames().nextElement().length() > 20) {
//                {
//                    session.setAttribute("idPet", id);
//                    return new ModelAndView("login-register", "command", new Employee());
//                }
//            } else if (session.getAttribute("logedEmployee") != null && ((Employee) session.getAttribute("logedEmployee")).getRole().equals("client")) {
//
//                mav = new ModelAndView("adoption-new");
//                Timestamp date = new Timestamp(System.currentTimeMillis());
//                Client cl = clientService.findByUsername(((Employee) session.getAttribute("logedEmployee")).getUsername());
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
//                return new ModelAndView("login-register", "command", new Employee());
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
//    public ModelAndView loginClient(@ModelAttribute("SpringWeb") Employee employee, ModelMap model,
//                                    final RedirectAttributes redirectAttributes, HttpSession session) {
//        model.addAttribute("username", employee.getUsername());
//        model.addAttribute("password", employee.getPassword());
//        ModelAndView mav = new ModelAndView();
//
//        Client dBEmployee = clientService.findByUsername(employee.getUsername());
//        String message;
//        String page;
//        message = "Success!";
//        page = session.getAttribute("jsp").toString();
//        if (page.equals("pet-view")) {
//            int id = (Integer) session.getAttribute("idPet");
//            Pet p = petService.findById(id);
//            if (p.isAvailable()) {
//                if (dBEmployee == null) {
//                    page = "pet-view";
//                    mav = new ModelAndView(page);
//                    mav.addObject("pet", p);
//                    message = "Login fail!";
//                } else {
//                    if (!(dBEmployee.getPassword().equals(employee.getPassword()))) {
//                        message = "Login fail!";
//                        page = "pet-view";
//                        mav.addObject("pet", p);
//                        mav = new ModelAndView(page);
//                    } else {
//                        page = "adoption-new";
//                        mav = new ModelAndView(page);
//                        Timestamp date = new Timestamp(System.currentTimeMillis());
//                        int idEmployee = dBEmployee.getId();
//                        Adoption adoption = new Adoption(id, date, idEmployee);
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
//                    Employee clientLogged = new Employee(dBEmployee.getFname() + dBEmployee.getLname(), employee.getUsername(), employee.getPassword(), "client");
//                    session.setAttribute("logedEmployee", clientLogged);
//                }
//            } else {
//                message = "Pet is unadvailable at the moment.";
//                mav = new ModelAndView(page);
//                mav.addObject("pet", p);
//            }
//        } else {
//            if (dBEmployee == null) {
//                mav = new ModelAndView(page);
//                message = "Login fail!";
//            } else {
//                if (!(dBEmployee.getPassword().equals(employee.getPassword()))) {
//                    message = "Login fail!";
//                    mav = new ModelAndView(page);
//                } else {
//                    mav = new ModelAndView("basket-view");
//                    List<Accessorises> accessorisesList = (List<Accessorises>) session.getAttribute("basket");
//                    mav.addObject("accessorisesList", accessorisesList);
//                }
//                Employee clientLogged = new Employee(dBEmployee.getFname() + dBEmployee.getLname(), employee.getUsername(), employee.getPassword(), "client");
//                session.setAttribute("logedEmployee", clientLogged);
//            }
//        }
//        redirectAttributes.addFlashAttribute("message", message);
//        return mav;
//    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpSession session) {
        session.removeAttribute("logedEmployee");
        ModelAndView mav = new ModelAndView("redirect:/index.html");
        return mav;
    }
}
