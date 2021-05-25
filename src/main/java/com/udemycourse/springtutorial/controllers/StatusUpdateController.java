package com.udemycourse.springtutorial.controllers;

import com.udemycourse.springtutorial.model.StatusUpdate;
import com.udemycourse.springtutorial.service.StatusUpdateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class StatusUpdateController {

    @Autowired
    private StatusUpdateService statusUpdateService;
    private static Logger logger = LoggerFactory.getLogger(PageController.class);

    @RequestMapping(value = "/viewStatus", method = RequestMethod.GET)
    ModelAndView viewStatus(ModelAndView modelAndView, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

        System.out.println();
        System.out.println("*******************" + pageNumber);
        System.out.println();

        Page<StatusUpdate> page = statusUpdateService.getPage(pageNumber);

        modelAndView.getModel().put("page", page);

        modelAndView.setViewName("app.viewStatus");

        return modelAndView;
    }

    @RequestMapping(value = "/addStatus", method = RequestMethod.GET)
    ModelAndView addStatus(ModelAndView modelAndView, @ModelAttribute("statusUpdate") StatusUpdate statusUpdate) {

        modelAndView.setViewName("app.addStatus");

        StatusUpdate latestStatusUpdate = statusUpdateService.getLatest();

        modelAndView.getModel().put("latestStatusUpdate", latestStatusUpdate);

        return modelAndView;
    }

    @RequestMapping(value = "/addStatus", method = RequestMethod.POST)
    ModelAndView addStatus(ModelAndView modelAndView, @Valid @ModelAttribute("statusUpdate") StatusUpdate statusUpdate, BindingResult result) {
        modelAndView.setViewName("app.addStatus");

        if(!result.hasErrors()) {
            statusUpdateService.save(statusUpdate);
            modelAndView.getModel().put("statusUpdate", new StatusUpdate());
            modelAndView.setViewName("redirect:/viewStatus");
        }
        StatusUpdate latestStatusUpdate = statusUpdateService.getLatest();
        modelAndView.getModel().put("latestStatusUpdate", latestStatusUpdate);
        logger.info("**************************Result:   " + result);

        return modelAndView;
    }

    @RequestMapping(value = "/deleteStatus", method = RequestMethod.GET)
    ModelAndView deleteStatus(ModelAndView modelAndView, @RequestParam(name = "id") Long id) {

        modelAndView.setViewName("redirect:/viewStatus");
        statusUpdateService.delete(id);
        return modelAndView;
    }

    @RequestMapping(value = "/editStatus", method = RequestMethod.GET)
    ModelAndView editStatus(ModelAndView modelAndView, @RequestParam(name = "id") Long id) {

        modelAndView.setViewName("app.editStatus");

        StatusUpdate statusUpdate = statusUpdateService.get(id);
        modelAndView.getModel().put("statusUpdate", statusUpdate);
        statusUpdateService.delete(id);
        return modelAndView;
    }

    @RequestMapping(value = "/editStatus", method = RequestMethod.POST)
    ModelAndView editStatus(ModelAndView modelAndView, @Valid StatusUpdate statusUpdate, BindingResult result) {
        modelAndView.setViewName("app.editStatus");
        if(!result.hasErrors()) {
            statusUpdateService.save(statusUpdate);
            modelAndView.setViewName("redirect:/viewStatus");
        }
        return modelAndView;
    }
}
