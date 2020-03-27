package com.techelevator.npgeek.JDBC;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.Park;
import com.techelevator.npgeek.ParkDAO;
import com.techelevator.npgeek.SurveyResultDAO;

@Component
public class JDBCSurveyResultDAO implements SurveyResultDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	ParkDAO parkDAO;

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
	public Map<Park, Integer> favoriteParkCount() {
		Map<Park, Integer> favoriteParkCount = new LinkedHashMap<>();
		String sqlGetParkCount = "SELECT park.parkname, survey_result.parkcode, COUNT(survey_result.parkcode) FROM survey_result JOIN park ON park.parkcode = survey_result.parkcode " + 
				"GROUP BY park.parkname, survey_result.parkcode ORDER BY COUNT(survey_result.parkcode) DESC, park.parkname ASC";
	
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetParkCount);
		
		while(results.next()) {
			String parkName = results.getString("parkname");
			Integer parkCount = results.getInt("count");
			
			Park park = parkDAO.getParkInfoFromName(parkName);
			favoriteParkCount.put(park, parkCount);
		}
		
		return favoriteParkCount;
	}

	
}
