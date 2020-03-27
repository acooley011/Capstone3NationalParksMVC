<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="body-content">

	<h1>Favorite Parks</h1>
	
	<p>Thanks for submitting our survey! Check out this list of our visitors' favorite parks.</p>
	
	<div id="park-favorites">	
		
		<c:forEach items="${favoriteParks}" var="survey">
		<c:url value="/img/parks/${survey.key.parkCode.toLowerCase()}.jpg" var="parkPic" />
		
		<div>
			<img class="park-picture" src="${parkPic}">
		</div>
		
		<div>
			<h3>${survey.key.parkName}</h3>
		</div>
		
		<div class="rating">
			<c:url value="/img/fav.png" var="fav" />
			<p class="survey-value">${survey.value}</p>
			<img class="fav" src="${fav}">
		</div>
		
		<div></div>
		
		<div></div>
		
		</c:forEach>
		
	
		
	</div>
	
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />