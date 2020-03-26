<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="body-content">

	
	<c:forEach items="${favoriteParks}" var="survey">
	<c:url value="/img/parks/${survey.key.parkCode.toLowerCase()}.jpg" var="parkPic" />
		    	<img class="park-picture" src="${parkPic}">
		<p>${survey.key.parkName}</p>
		<p>${survey.value}</p>
	</c:forEach>
	
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />