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
			nextPark.setParkCode(results.getString("parkcode"));
			nextPark.setParkName(results.getString("parkname"));
			nextPark.setState(results.getString("state"));
			nextPark.setAcreage(results.getInt("acreage"));
			nextPark.setElevationInFeet(results.getInt("elevationinfeet"));
			nextPark.setMilesOfTrail(results.getFloat("milesoftrail"));
			nextPark.setNumberOfCampsites(results.getInt("numberofcampsites"));
			nextPark.setClimate(results.getString("climate"));
			nextPark.setYearFounded(results.getInt("yearfounded"));
			nextPark.setAnnualVisitorCount(results.getInt("annualvisitorcount"));
			nextPark.setInspirationalQuote(results.getString("inspirationalquote"));
			nextPark.setInspirationalQuoteSource(results.getString("inspirationalquotesource"));
			nextPark.setParkDescription(results.getString("parkdescription"));
			nextPark.setMilesOfTrail(results.getInt("entryfee"));
			nextPark.setNumberOfAnimalSpecies(results.getInt("numberofanimalspecies"));
			allParks.add(nextPark);
			
		}
		
		return allParks;
	}

	@Override
	public Park getParkInfoFromId(int parkId) {
		Park park = new Park();
		String sqlGetAllParks = "SELECT * FROM park WHERE parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllParks, parkId);
		
		while(results.next()) {
			park.setParkCode(results.getString("parkcode"));
			park.setParkName(results.getString("parkname"));
			park.setState(results.getString("state"));
			park.setAcreage(results.getInt("acreage"));
			park.setElevationInFeet(results.getInt("elevationinfeet"));
			park.setMilesOfTrail(results.getFloat("milesoftrail"));
			park.setNumberOfCampsites(results.getInt("numberofcampsites"));
			park.setClimate(results.getString("climate"));
			park.setYearFounded(results.getInt("yearfounded"));
			park.setAnnualVisitorCount(results.getInt("annualvisitorcount"));
			park.setInspirationalQuote(results.getString("inspirationalquote"));
			park.setInspirationalQuoteSource(results.getString("inspirationalquotesource"));
			park.setParkDescription(results.getString("parkdescription"));
			park.setMilesOfTrail(results.getInt("entryfee"));
			park.setNumberOfAnimalSpecies(results.getInt("numberofanimalspecies"));
		}
		
		return park;
	}
}