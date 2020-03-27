<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="body-content">
	<div>
		<div>
			<c:url value="/img/parks/${park.parkCode.toLowerCase()}.jpg" var="parkPic" />
		    	<img class="park-picture-details" src="${parkPic}">
	    </div>	
	    <div class="description">
	    	
    		<h1 class="home-name details-block">${park.parkName}</h1>
    		<p class="home-description details-block">${park.parkDescription}</p>
    		
	    	<div class="flex-details">
	    	
	    		<div class="flex">
	    		
		    		<p class="home-description det"><b>State:</b> ${park.state}</p>
		    		<p class="home-description det"><b>Acres:</b> ${park.acreage}</p>
		    		<p class="home-description det"><b>Elevation (ft):</b> ${park.elevationInFeet}</p>
		    		<p class="home-description det"><b>Miles of Trail:</b> ${park.milesOfTrail}</p>
		    		<p class="home-description det"><b>Number of Campsites:</b> ${park.numberOfCampsites}</p>
	    		
	    		</div>
	    		
	    		<div class="flex">
	    		
		    		<p class="home-description det"><b>Climate:</b> ${park.climate}</p>
		    		<p class="home-description det"><b>Year Founded:</b> ${park.yearFounded}</p>
		    		<p class="home-description det"><b>Annual Visitor Count:</b> ${park.annualVisitorCount}</p>
		    		<p class="home-description det"><b>Entry Fee:</b> $${park.entryFee}</p>
		    		<p class="home-description det"><b>Number of Animal Species:</b> ${park.numberOfAnimalSpecies}</p>
		    	
		    	</div>
		    		
    		</div>		
     		    		
    		<p class="home-description quote">${park.inspirationalQuote}<br>&mdash;${park.inspirationalQuoteSource}</p>
	   
	    </div>
	    
	    
    	<div class="weather">
    	
    		<c:if test="${empty toggleTemp || toggleTemp == false}">
				<c:set var="temp" value="F"/>
				<c:set var="fChecked" value="checked" />
			</c:if>
    	
			<c:if test="${toggleTemp == true}">
				<c:set var="temp" value="C"/>
				<c:set var="cChecked" value="checked" />
			</c:if>
    	
    		<div class="weather-toggle-today">  
    		

				<c:forEach var= "weather" items="${weathers }">
		    		<c:if test="${weather.fiveDayForecastValue == 1}">    			
    			
    			<h2>Today: ${weather.forecast }</h2>
    			 	
    			<div class="today-temp-info">

   						<c:url value="/img/weather/${weather.forecast }.png" var="forecastpic" />
   						<img class="forecast-picture-today" src="${forecastpic}">
   					
   					<div class="high-low">
	    					
	    					<p>High: ${weather.high }&#176;${temp} Low: ${weather.low }&#176;${temp}<br></p>
	    					
   					</div>
	    					
    			</div>
    			
    			<div class="forecast-advisory">
    				
    				<c:set var="sn" value="snow" />
    				<c:set var="r" value="rain" />
    				<c:set var="t" value="thunderstorms" />
    				<c:set var="su" value="sunny" />
    				<c:set var="freezingC" value="-6"/>
    			
		    			<c:choose>
		   					<c:when test="${weather.forecast == sn }">
		   						<p>Pack snowshoes!</p>
		   					</c:when>
		   					<c:when test="${weather.forecast == r }">
		   						<p>Pack rain gear and wear waterproof shoes!</p>
		   					</c:when>
		   					<c:when test="${weather.forecast == t }">
		   						<p>Seek shelter and avoid hiking on exposed ridges!</p>
		   					</c:when>
		   					<c:when test="${weather.forecast == su }">
		   						<p>Pack sunblock!</p>
		   					</c:when>
	   					</c:choose>
	   					
	   					<c:choose>
	   						<c:when test="${toggleTemp == false && weather.high > 75}">
	   							<p>Bring an extra gallon of water!</p>
	   						</c:when>
	   						<c:when test="${weather.high - weather.low > 20 && toggleTemp == false }">
	   							<p>Wear breathable layers!</p>
	   						</c:when>
	   						<c:when test="${weather.low < 20 && toggleTemp == false}">
	   							<p class="errors">Warning: Exposure to frigid temperatures is dangerous.</p>
	   						</c:when>
	   						
	   						<c:when test="${toggleTemp == true && weather.high > 23}">
	   							<p>Bring an extra gallon of water!</p>
	   						</c:when>
	   						<c:when test="${weather.high - weather.low > 6 && toggleTemp == true }">
	   							<p>Wear breathable layers!</p>
	   						</c:when>
	   						<c:when test="${weather.low < freezingC && toggleTemp == true}">
	   							<p class="errors">Warning: Exposure to frigid temperatures is dangerous.</p>
	   						</c:when>
	   						
	   					</c:choose>
	   					
    			</div>
    			
    				</c:if>
 				</c:forEach>
    			
    		
    			<div class="toggle-buttons">
    			
		    		<c:url value="/park-details/${park.parkName}" var="parkDetails" />
		    		<form method="GET" action="${parkDetails}" class="formmm">
		    		<div>
		    			<label for="F">
		    				<input type="radio" id="F" name="toggleTemp"  value="false" ${fChecked }/>Fahrenheit
		    			</label>
		    			
		    			 <label for="C">
		    				<input type="radio" id="C" name="toggleTemp" value="true" ${cChecked }/>Celcius
		    			</label>
	    			</div>
					<br>
	    			<button type="submit" class="submit-temp">Change Temperature Unit</button>
		    			
		    		</form>
    			</div>
    			
    		</div>
    		 	
    		<div class="other-days">
    		
    			<div class="other"> 	
    				
		    		<c:forEach var= "weather" items="${weathers }">
		    			<c:choose>
		   					<c:when test="${weather.fiveDayForecastValue == 2 }">								
								<div class="other-info">
			    					<c:url value="/img/weather/${weather.forecast }.png" var="forecastpic" />
			    					<img class="forecast-picture" src="${forecastpic}">	 
			    					<p>High: ${weather.high }&#176;${temp}</p>
									<p>Low: ${weather.low }&#176;${temp}</p>
			    					<p>Forecast: ${weather.forecast }</p>
		    					</div>   					
		    				</c:when>
		   					<c:when test="${weather.fiveDayForecastValue == 3 }">
		   						<div class="other-info">
			    					<c:url value="/img/weather/${weather.forecast }.png" var="forecastpic" />
			    					<img class="forecast-picture" src="${forecastpic}">
			    					<p>High: ${weather.high }&#176;${temp}</p>
			    					<p>Low: ${weather.low}&#176;${temp}</p>
			    					<p>Forecast: ${weather.forecast }</p>
		    					</div>
		   					</c:when>
		   					<c:when test="${weather.fiveDayForecastValue == 4 }">
		   						<div class="other-info">
			    					<c:url value="/img/weather/${weather.forecast }.png" var="forecastpic" />
			    					<img class="forecast-picture" src="${forecastpic}">
			    					<p>High: ${weather.high }&#176;${temp}</p>
			    					<p>Low: ${weather.low }&#176;${temp}</p>
			    					<p>Forecast: ${weather.forecast }</p>
		    					</div>
		   					</c:when>
		   					<c:when test="${weather.fiveDayForecastValue == 5 }" >
		   						<div class="other-info">
			    					<c:url value="/img/weather/${weather.forecast}.png" var="forecastpic" />
			    					<img class="forecast-picture" src="${forecastpic}">
			    					<p>High: ${weather.high }&#176;${temp}</p>
			    					<p>Low: ${weather.low }&#176;${temp}</p>
			    					<p>Forecast: ${weather.forecast }</p>
		    					</div>
		   					</c:when>
		    			</c:choose>
		    		</c:forEach>
	    		</div>	    		
    		</div>
    	</div>
	</div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />