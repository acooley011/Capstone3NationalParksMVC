package com.techelevator.npgeek;

import java.util.List;

public interface SurveyResultDAO {
	
	public void insertNewSurvey(String parkCode, String emailAddress, String state, String activityLevel);
	
	public List<SurveyResult> allSurveys();

}
