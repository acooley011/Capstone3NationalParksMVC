package com.techelevator.npgeek.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.npgeek.Park;
import com.techelevator.npgeek.ParkDAO;
import com.techelevator.npgeek.SurveyResult;
import com.techelevator.npgeek.SurveyResultDAO;

@Controller
public class FavoriteParksController {
	
	@Autowired
	ParkDAO parkDao;
	
	@Autowired
	SurveyResultDAO surveyResultDao;

	@RequestMapping(path="/favorite-parks", method=RequestMethod.GET)
	public String displayFavoriteParksPage(ModelMap model) {
		
		List<Park> parks = parkDao.getAllParks();		
		model.addAttribute("parks", parks);
		
		List<SurveyResult> surveys = surveyResultDao.allSurveys();
		model.addAttribute("surveys", surveys);
		
		return "/favoriteParks";
	}


}