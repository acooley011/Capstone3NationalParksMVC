<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="body-content">

	
	<c:forEach items="${surveys}" var="survey">
		<p>${survey.emailAddress}</p>
	</c:forEach>
	
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />