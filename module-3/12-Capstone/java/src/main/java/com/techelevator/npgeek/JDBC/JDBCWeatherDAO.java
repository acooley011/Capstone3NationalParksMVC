package com.techelevator.npgeek.JDBC;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.Weather;
import com.techelevator.npgeek.WeatherDAO;

@Component
public class JDBCWeatherDAO implements WeatherDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCWeatherDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Weather> getWeatherFromPark(String parkCode) {
		List<Weather> allParkWeather = new ArrayList<>();
		String getParkWeather = "SELECT * FROM weather WHERE parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(getParkWeather, parkCode);
		
		while(results.next()) {
			Weather parkWeather = new Weather();
			parkWeather.setParkCode(results.getString("parkcode"));
			parkWeather.setFiveDayForecastValue(results.getInt("fivedayforecastvalue"));
			parkWeather.setLow(results.getInt("low"));
			parkWeather.setHigh(results.getInt("high"));
			parkWeather.setForecast(results.getString("forecast"));
			allParkWeather.add(parkWeather);
		}
		
		return allParkWeather;
	}

}
