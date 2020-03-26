package com.techelevator.npgeek.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.npgeek.Park;
import com.techelevator.npgeek.ParkDAO;
import com.techelevator.npgeek.SurveyResultDAO;

@Controller
public class FavoriteParksController {
	
	@Autowired
	SurveyResultDAO surveyResultDao;
	
	@Autowired
	ParkDAO parkDAO;

	@RequestMapping(path="/favorite-parks", method=RequestMethod.GET)
	public String displayFavoriteParksPage(ModelMap model) {
		
		Map<Park, Integer> favoritePark = surveyResultDao.favoriteParkCount();		
		model.addAttribute("favoriteParks", favoritePark);
				
		return "/favoriteParks";
	}


}