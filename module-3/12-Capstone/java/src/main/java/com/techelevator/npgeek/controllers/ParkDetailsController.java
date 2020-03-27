package com.techelevator.npgeek.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.npgeek.Park;
import com.techelevator.npgeek.ParkDAO;
import com.techelevator.npgeek.Weather;
import com.techelevator.npgeek.WeatherDAO;

@Controller
@SessionAttributes
public class ParkDetailsController {
	
	@Autowired
	ParkDAO parkDao;
	
	@Autowired
	WeatherDAO weatherDAO;

	@RequestMapping(path="/park-details/{parkName}", method=RequestMethod.GET)
	public String displayParkDetails(
			@RequestParam(name = "toggleTemp", required = false) Boolean toggleTemp,
			@PathVariable String parkName,
			ModelMap model,
			HttpSession session,
			HttpServletRequest request
			) {
		
		if(toggleTemp != null) {
			session.setAttribute("tempPreference", toggleTemp);
		} else if(session.getAttribute("tempPreference") != null) {
			toggleTemp = (Boolean)session.getAttribute("tempPreference");
		} else {
			toggleTemp = false;
		}
		
		model.put("toggleTemp", toggleTemp);
		
		Park park = parkDao.getParkInfoFromName(parkName);
		model.addAttribute("park", park);
		
		List<Weather> weathers = weatherDAO.getWeatherFromPark(park.getParkCode());
		
		if(!toggleTemp) {
			model.addAttribute("weathers", weathers);

		} else {			
			List<Weather> weathersCelcius = new ArrayList<Weather>();
			
			for(Weather weather : weathers) {
				Weather newWeather = new Weather();
				
				newWeather.setParkCode(weather.getParkCode());
				newWeather.setFiveDayForecastValue(weather.getFiveDayForecastValue());
				newWeather.setLow((int)((weather.getLow()-32F) * (5F/9F)));
				newWeather.setHigh((int)((weather.getHigh()-32F) * (5F/9F)));
				newWeather.setForecast(weather.getForecast());
				
				weathersCelcius.add(newWeather);
				model.addAttribute("weathers", weathersCelcius);
				
			}
			
		}
		
		return "parkDetails";
	}


}
