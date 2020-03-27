package com.techelevator.npgeek.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.npgeek.Park;
import com.techelevator.npgeek.ParkDAO;

@Controller
public class HomePageController {
	
	@Autowired
	ParkDAO parkDao;

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayHomePage(ModelMap model) {
		
		List<Park> parks = parkDao.getAllParks();
		
		boolean temperatureC = false;
		
		model.addAttribute("temperatureC", temperatureC);
		model.addAttribute("parks", parks);
		
		return "homePage";
	}


}
