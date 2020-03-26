<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="body-content">

	<h1>Favorite Parks (Ordered from most to Least Favorite)</h1>
	<c:forEach items="${favoriteParks}" var="survey">
	<c:url value="/img/parks/${survey.key.parkCode.toLowerCase()}.jpg" var="parkPic" />
		    	<img class="park-picture" src="${parkPic}">
		<h3>${survey.key.parkName}</h3>
		<p>Number of visitors who favorited: ${survey.value}</p>
	</c:forEach>
	
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />