package com.udemycourse.springtutorial.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthorizationController {

    @RequestMapping("/login")
    public String admin(){
        return "app.login";
    }
}
