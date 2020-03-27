<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<link href="https://fonts.googleapis.com/css?family=Francois+One&display=swap" rel="stylesheet">


<div class="body-content">
	<div>
		<c:url value="/img/parks/${park.parkCode.toLowerCase()}.jpg" var="parkPic" />
	    	<img class="park-picture-details" src="${parkPic}">
	    	
	    	<div class="description">
	    	
	    		<h1 class="home-name">${park.parkName}</h1>
	    		<p class="home-description">${park.parkDescription}</p>
	    		<p class="home-description">State: ${park.state}</p>
	    		<p class="home-description">Acres: ${park.acreage}</p>
	    		<p class="home-description">Elevation (ft): ${park.elevationInFeet}</p>
	    		<p class="home-description">Miles of Trail: ${park.milesOfTrail}</p>
	    		<p class="home-description">Number of Campsites: ${park.numberOfCampsites}</p>
	    		<p class="home-description">Climate: ${park.climate}</p>
	    		<p class="home-description">Year Founded: ${park.yearFounded}</p>
	    		<p class="home-description">Annual Visitor Count: ${park.annualVisitorCount}</p>
	    		<p class="home-description">Inspirational Quote: ${park.inspirationalQuote}</p>
	    		<p class="home-description"><pre>(Source): ${park.inspirationalQuoteSource}</pre>
	    		<p class="home-description">Entry Fee: $${park.entryFee}</p>
	    		<p class="home-description">Number of Animal Species: ${park.numberOfAnimalSpecies}</p>
	    		
	    	</div>
	    	<div class="weather">
	    		<h4 class="home-name">Weather Forecast for ${park.parkName}</h4>
	    		<c:url value="/parkDetails" var="parkDetails" />
				<form action="${parkDetails }" method="GET">
   					<input type="checkbox" name="toggleTemp"/>
  					<input type="hidden" name="toggleTemp" value="false"/>
  					<input type="submit" name="submit" value="Change Temperature"/>
				</form>
	    		
	    		<c:if test="${temperatureC == false}">
	    			<p>Hello in F</p>
	    		</c:if>
	    		
	    		<c:if test="${temperatureC == true}">
	    			<p>Hello in C</p>
    			</c:if>
	    		
	    		<c:forEach var= "weather" items="${weathers }">
	    			<c:choose>
	    				<c:when test="${weather.fiveDayForecastValue == 1}">
	    					<p>Monday Low: ${weather.low }F</p>
	    					<p> High: ${weather.high }F</p>
	    					<p> Forecast: ${weather.forecast }</p>
	    					<c:url value="/img/weather/${weather.forecast }.png" var="forecastpic" />
	    					<img class="forecast-picture" src="${forecastpic}">
    					</c:when>
    					<c:when test="${weather.fiveDayForecastValue == 2 }">
							<p>Tuesday Low: ${weather.low }F</p>
	    					<p> High: ${weather.high }F</p>
	    					<p> Forecast: ${weather.forecast }</p>
	    					<c:url value="/img/weather/${weather.forecast }.png" var="forecastpic" />
	    					<img class="forecast-picture" src="${forecastpic}">	    					
	    				</c:when>
    					<c:when test="${weather.fiveDayForecastValue == 3 }">
	    					<p>Wednesday Low: ${weather.low }F</p>
	    					<p> High: ${weather.high }F</p>
	    					<p> Forecast: ${weather.forecast }</p>
	    					<c:url value="/img/weather/${weather.forecast }.png" var="forecastpic" />
	    					<img class="forecast-picture" src="${forecastpic}">
    					</c:when>
    					<c:when test="${weather.fiveDayForecastValue == 4 }">
	    					<p>Thursday Low: ${weather.low }F</p>
	    					<p> High: ${weather.high }F</p>
	    					<p> Forecast: ${weather.forecast }</p>
	    					<c:url value="/img/weather/${weather.forecast }.png" var="forecastpic" />
	    					<img class="forecast-picture" src="${forecastpic}">
    					</c:when>
    					<c:otherwise >
	    					<p>Friday Low: ${weather.low }F</p>
	    					<p> High: ${weather.high }F</p>
	    					<p> Forecast: ${weather.forecast }</p>
	    					<c:url value="/img/weather/${weather.forecast}.png" var="forecastpic" />
	    					<img class="forecast-picture" src="${forecastpic}">
    					</c:otherwise>
	    			</c:choose>
	    		</c:forEach>
	    	</div>
	</div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />