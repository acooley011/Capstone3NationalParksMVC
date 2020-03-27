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
    		
	    	<div>
	    	
	    		<div class="flex">
	    		
		    		<p class="home-description"><b>State:</b> ${park.state}</p>
		    		<p class="home-description"><b>Acres:</b> ${park.acreage}</p>
		    		<p class="home-description"><b>Elevation (ft):</b> ${park.elevationInFeet}</p>
		    		<p class="home-description"><b>Miles of Trail:</b> ${park.milesOfTrail}</p>
		    		<p class="home-description"><b>Number of Campsites:</b> ${park.numberOfCampsites}</p>
	    		
	    		</div>
	    		
	    		<div class="flex">
	    		
		    		<p class="home-description"><b>Climate:</b> ${park.climate}</p>
		    		<p class="home-description"><b>Year Founded:</b> ${park.yearFounded}</p>
		    		<p class="home-description"><b>Annual Visitor Count:</b> ${park.annualVisitorCount}</p>
		    		<p class="home-description"><b>Entry Fee:</b> $${park.entryFee}</p>
		    		<p class="home-description"><b>Number of Animal Species:</b> ${park.numberOfAnimalSpecies}</p>
		    	
		    	</div>
		    		
    		</div>		
     		    		
    		<p class="home-description quote">${park.inspirationalQuote}<br>&mdash;${park.inspirationalQuoteSource}</p>
	   
	    </div>
	    
	    
    	<div class="weather">
    		<h4 class="home-name">Weather Forecast for ${park.parkName}</h4>
    		<c:url value="/parkDetails" var="parkDetails" />
    		
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