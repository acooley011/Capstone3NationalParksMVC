package com.techelevator.npgeek.JDBC;

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
	public Weather getWeatherFromPark(int parkId) {
		Weather parkWeather = new Weather();
		String getParkWeather = "SELECT * FROM park WHERE parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(getParkWeather, parkId);
		
		parkWeather.setParkCode(results.getString("parkcode"));
		parkWeather.setFiveDayForcastValue(results.getInt("fivedayforecastvalue"));
		parkWeather.setLow(results.getInt("low"));
		parkWeather.setHigh(results.getInt("high"));
		parkWeather.setForecast(results.getString("forcast"));
		
		return parkWeather;
	}

}
