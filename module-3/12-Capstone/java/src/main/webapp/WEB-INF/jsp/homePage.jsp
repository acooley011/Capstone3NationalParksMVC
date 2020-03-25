<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="body-home">

	<div class="parks-container">
		<c:forEach items="${parks}" var="park">
			<div class="park-list">
				<c:url value="/img/parks/${park.parkCode.toLowerCase()}.jpg" var="parkPic" />
		    	<img class="park-picture" src="${parkPic}">
		    	<div class="description">
		    		<p class="home-name">${park.parkName}</p>
		    		<p class="home-description">${park.parkDescription}</p>
		    	</div>
			</div>
		</c:forEach>
	</div>

</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />