package com.techelevator.npgeek.JDBC;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.Park;
import com.techelevator.npgeek.ParkDAO;

@Component
public class JDBCParkDAO implements ParkDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCParkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Park> getAllParks() {
		List<Park> allParks = new ArrayList<>();
		String sqlGetAllParks = "SELECT * FROM park";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllParks);
		
		while(results.next()) {
			Park nextPark = new Park();
			nextPark.setParkCode(results.getString("parkCode"));
			nextPark.setParkName(results.getString("parkName"));
			nextPark.setState(results.getString("state"));
			nextPark.setAcreage(results.getInt("acreage"));
			nextPark.setElevationInFeet(results.getInt("elevationInFeet"));
			nextPark.setMilesOfTrail(results.getLong("milesOfTrail"));
			nextPark.setNumberOfCampsites(results.getInt("numberOfCampsites"));
			nextPark.setClimate(results.getString("climate"));
			nextPark.setYearFounded(results.getInt("year"));
			nextPark.setAnualVisitorCount(results.getInt("anualVisitorCount"));
			nextPark.setInspirationalQuote(results.getString("inspirationalQuote"));
			nextPark.setInspirationalQuoteSource(results.getString("inspirationalQuoteSource"));
			nextPark.setParkDescription(results.getString("parkDescription"));
			nextPark.setMilesOfTrail(results.getInt("entryFee"));
			nextPark.setNumberOfAnimalSpecies(results.getInt("numberOfAnimalSpecies"));
			allParks.add(nextPark);
			
		}
		
		return allParks;
	}

	@Override
	public List<String> getWeatherFromParkId(int parkId) {
		// TODO Auto-generated method stub
		return null;
	}

}
