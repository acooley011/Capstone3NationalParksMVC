package com.techelevator.npgeek;

import java.util.Map;

public interface SurveyResultDAO {
	
	public void insertNewSurvey(String parkCode, String emailAddress, String state, String activityLevel);
		
	public Map<Park, Integer> favoriteParkCount();


}
