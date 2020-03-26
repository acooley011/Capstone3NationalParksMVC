<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<h1>Hi</h1>

<c:forEach items="${surveys}" var="survey">
	<p>${survey.emailAddress}</p>
</c:forEach>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />