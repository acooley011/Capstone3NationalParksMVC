package com.techelevator.npgeek.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.npgeek.Park;
import com.techelevator.npgeek.ParkDAO;
import com.techelevator.npgeek.SurveyResult;
import com.techelevator.npgeek.SurveyResultDAO;

@Controller
public class SurveyPageController {
	
	static final String MODEL_KEY_PREFIX = "surveyResult";
	
	@Autowired
	ParkDAO parkDao;
	
	@Autowired
	SurveyResultDAO surveyResultDao;

	@RequestMapping(path="/survey", method=RequestMethod.GET)
	public String displaySurveyPage(ModelMap model) {
		
		if(!model.containsAttribute("surveyResult")) { 
			model.put("surveyResult", new SurveyResult());
		}
		
		List<Park> parks = parkDao.getAllParks();		
		model.addAttribute("parks", parks);
		
		return "survey";
	}
	
	@RequestMapping(path="/survey", method=RequestMethod.POST)
	public String submitSurveyResults(@Valid @ModelAttribute("surveyResult") 
			SurveyResult surveyFormValues, BindingResult result,
			RedirectAttributes flash, ModelMap model) {
		
		if(result.hasErrors()) {
	        flash.addFlashAttribute("surveyResult", surveyFormValues);

	        flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + 
	                "surveyResult", result);
	        
			List<Park> parks = parkDao.getAllParks();		
			model.addAttribute("parks", parks);
	        
	        return "redirect:/survey";
	    }
		
		flash.addFlashAttribute("message", "You have successfully registered");
		
		return "redirect:/favorite-parks";
	}

}
