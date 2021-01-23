package com.udemycourse.springtutorial.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthorizationController {

    @RequestMapping("/admin")
    public String admin(){
        return "/WEB-INF/tiles/admin.jsp";
    }
}
