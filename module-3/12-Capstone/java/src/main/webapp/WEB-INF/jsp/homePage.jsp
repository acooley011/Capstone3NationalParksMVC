<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<link href="https://fonts.googleapis.com/css?family=Francois+One&display=swap" rel="stylesheet">

		
<div class="body-home">

	<div class="parks-container">
		<c:forEach items="${parks}" var="park">
			<div class="park-list">
			
				<a href="/m3-java-capstone/park-details/${park.parkName}">
				<c:url value="/img/parks/${park.parkCode.toLowerCase()}.jpg" var="parkPic" />
		    	<img class="park-picture" src="${parkPic}"></a>
		    	<div class="description">
		    	
		    		<h1 class="home-name">${park.parkName}</h1>
		    		<p class="home-description">${park.parkDescription}</p>
		    	</div>
			</div>
		</c:forEach>
	</div>

</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />