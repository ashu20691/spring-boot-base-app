package com.example.controller;


import com.example.model.Location;
import com.example.repository.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.*;
import java.util.List;


@Controller
public class LocationController {

    @Autowired
    private LocationRepository locationRepository;


    @Autowired
    public LocationController(LocationRepository locationRepository) {
        this.locationRepository = locationRepository;
    }

    @RequestMapping(value = "/locations/pages", method = RequestMethod.GET)
    public String showPages(Model model, @PageableDefault(page = 0, size = 20) Pageable pg) {
        Page<Location> results = this.locationRepository.findAll(pg);
        model.addAttribute("listemp", results);
        return "/locations/page";
    }

    @RequestMapping(value = "/locations", method = RequestMethod.GET)
    public ResponseEntity<List<Location>> getlocationsList() {
        List<Location> results = this.locationRepository.findAll();
        ModelAndView model1 = new ModelAndView("locations");
        model1.addObject("listemp", results);
        return new ResponseEntity<List<Location>>(results, HttpStatus.OK);
    }


    @RequestMapping(value = "/locations/add", method = RequestMethod.GET)
    public ModelAndView addForm() {
        return new ModelAndView("locations/add", "location", new Location());
    }

    @RequestMapping(value = "/locations/save", method = RequestMethod.POST)
    public String processAdd(@Valid @ModelAttribute("location") Location location,
                             BindingResult result, ModelMap model) {
        System.out.println("sdfssdfsd   ");
        if (result.hasErrors()) {
            System.out.println(result.getAllErrors());
            return "locations/add";
        }
        this.locationRepository.save(location);
        return "redirect:/locations/pages";
    }


    @RequestMapping(value = "/locations/edit/{empNo}", method = RequestMethod.GET)
    public String editForm(@PathVariable("empNo") Integer empNo, Model model) {
        Location location = this.locationRepository.findOne(empNo);
        model.addAttribute(location);
        return "locations/edit";
    }

    @RequestMapping(value = "/locations/update", method = RequestMethod.POST)
    public String processUpdate(@Valid @ModelAttribute("location") Location location,
                                BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            return "locations/edit";
        }
        this.locationRepository.save(location);
        return "redirect:/locations";
    }
}