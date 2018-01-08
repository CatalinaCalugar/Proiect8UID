package com.spr.controller;

/**
 * Created by cata_ on 12/29/2017.
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NavigationController {

    @RequestMapping(value = {"/", "index"}, method = RequestMethod.GET)
    public ModelAndView index() {
        return new ModelAndView("index");
    }

    @RequestMapping(value = {"/client-page"}, method = RequestMethod.GET)
    public ModelAndView client() {
        return new ModelAndView("client-page");
    }

    @RequestMapping(value = {"/user-page"}, method = RequestMethod.GET)
    public ModelAndView user() {
        return new ModelAndView("user-page");
    }

    @RequestMapping(value = {"/admin-page"}, method = RequestMethod.GET)
    public ModelAndView admin() {
        return new ModelAndView("admin-page");
    }

    @RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
    public ModelAndView contact() {
        return new ModelAndView("contact");
    }
}