package com.techelevator.npgeek.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String displayParkDetails(HttpServletRequest request, 
			@RequestParam(name = "toggleTemp", defaultValue = "false") Boolean toggleTemp,
			@PathVariable String parkName, ModelMap model) {
		
		Park park = parkDao.getParkInfoFromName(parkName);
		model.addAttribute("park", park);
		
		List<Weather> weathers = weatherDAO.getWeatherFromPark(park.getParkCode());
		
		if(toggleTemp == false) {
			model.addAttribute("weathers", weathers);
		} else {			
			List<Weather> weathersCelcius = new ArrayList<Weather>();
			
			for(Weather weather : weathers) {
				Weather newWeather = new Weather();
				
				newWeather.setParkCode(weather.getParkCode());
				newWeather.setFiveDayForecastValue(weather.getFiveDayForecastValue());
				newWeather.setLow((weather.getLow()-32) * (5/9));
				newWeather.setHigh((weather.getHigh()-32) * (5/9));
				newWeather.setForecast(weather.getForecast());
				
				weathersCelcius.add(newWeather);
				model.addAttribute("weathers", weathersCelcius);
			}
			
		}

		toggleTemp = !toggleTemp;					
		
		return "parkDetails";
	}


}
