package com.techelevator.npgeek.JDBC;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.Park;
import com.techelevator.npgeek.SurveyResult;
import com.techelevator.npgeek.SurveyResultDAO;

@Component
public class JDBCSurveyResultDAO implements SurveyResultDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCSurveyResultDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void insertNewSurvey(String parkCode, String emailAddress, String state, String activityLevel) {
		String insertSurvey = "INSERT INTO survey_result (parkcode, emailaddress, state, activitylevel) "
				+ "VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(insertSurvey, parkCode, emailAddress, state, activityLevel);
		
	}

	@Override
	public List<SurveyResult> allSurveys() {
		List<SurveyResult> allSurveys = new ArrayList<>();
		String sqlGetAllSurveys = "SELECT * FROM survey_result GROUP BY parkcode, "
				+ "surveyid";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllSurveys);
		
		while(results.next()) {
			SurveyResult nextSurvey = new SurveyResult();
			nextSurvey.setSurveyId(results.getInt("surveyid"));
			nextSurvey.setParkCode(results.getString("parkcode"));
			nextSurvey.setEmailAddress(results.getString("emailaddress"));
			nextSurvey.setState(results.getString("state"));
			nextSurvey.setActivityLevel(results.getString("activitylevel"));
			allSurveys.add(nextSurvey);
			
		}
		
		return allSurveys;
	}

	@Override
	public Map<Park, Integer> favoriteParkCount(String parkCode) {
		Map<Park, Integer> favoriteParkCount = new HashMap<>();
		String sqlGetParkCount = "SELECT parkcode, COUNT(parkcode) FROM survey_result GROUP BY parkcode";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetParkCount);
		
		while(results.next()) {
			favoriteParkCount.put(key, value)
		}
		
		return null;
	}

	
}
