package com.udemycourse.springtutorial.controllers;

import com.udemycourse.springtutorial.model.StatusUpdate;
import com.udemycourse.springtutorial.service.StatusUpdateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.io.Console;
import java.util.Date;

@Controller
public class PageController {

    @Autowired
    private StatusUpdateService statusUpdateService;

    @RequestMapping("/")
    ModelAndView home(ModelAndView modelAndView) {
        StatusUpdate statusUpdate = statusUpdateService.getLatest();
        modelAndView.getModel().put("statusUpdate", statusUpdate);
        modelAndView.setViewName("app.homepage");
        return modelAndView;
    }

    @RequestMapping("/about")
    String about() {
        return "app.about";
    }

    @RequestMapping("/testPage")
    String testPage() {
        return "/WEB-INF/layouts/test.jsp";
    }

}

