package com.techelevator.npgeek;

import java.util.List;

public interface ParkDAO {
	public List<Park> getAllParks();
	
	public Park getParkInfoFromId(int parkId);
	
	}
