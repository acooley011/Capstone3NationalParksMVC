package com.techelevator.npgeek.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.techelevator.npgeek.Park;
import com.techelevator.npgeek.ParkDAO;
import com.techelevator.npgeek.Weather;
import com.techelevator.npgeek.WeatherDAO;

@Controller
public class ParkDetailsController {
	
	@Autowired
	ParkDAO parkDao;
	
	@Autowired
	WeatherDAO weatherDAO;

	@RequestMapping(path="/park-details/{parkName}", method=RequestMethod.GET)
	public String displayParkDetails(HttpServletRequest request, @PathVariable String parkName, ModelMap model) {
		
		Park park = parkDao.getParkInfoFromName(parkName);
		List<Weather> weathers = weatherDAO.getWeatherFromPark(park.getParkCode());
		
		model.addAttribute("park", park);
		model.addAttribute("weathers", weathers);
		
		return "parkDetails";
	}


}
