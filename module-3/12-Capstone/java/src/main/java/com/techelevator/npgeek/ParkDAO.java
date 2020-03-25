package com.techelevator.npgeek;

import java.util.List;

public interface ParkDAO {
	public List<Park> getAllParks();
	
	public List<String> getWeatherFromParkId(int parkId);
	
	}
