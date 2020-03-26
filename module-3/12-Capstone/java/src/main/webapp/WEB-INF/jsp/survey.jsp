<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="body-content">

	
	<c:url value="/survey" var="surveyURL"/>
	<form:form action="${surveyURL}" method="POST" modelAttribute="surveyResult">
	
		<div>
			<form:label path="parkCode">Favorite National Park:</form:label>
			<select id="parkCode" name="parkCode" size="1">		
				<option value=""></option>	
				<c:forEach items="${parks}" var="park">
					<option value="${park.parkCode}">${park.parkName}</option>
				</c:forEach>
			</select>
			<form:errors path="parkCode"/><br><br>
		</div>
			
		<div>
			<form:label path="emailAddress">Your email:</form:label>
			<form:input type="text" path="emailAddress"/>
			<form:errors path="emailAddress"/><br><br>
		</div>
		
		<div>
			<form:label path="state">State of Residence:</form:label>
			<select>
				<option value=""></option>
				<option value="AL">Alabama</option>
				<option value="AK">Alaska</option>
				<option value="AZ">Arizona</option>
				<option value="AR">Arkansas</option>
				<option value="CA">California</option>
				<option value="CO">Colorado</option>
				<option value="CT">Connecticut</option>
				<option value="DE">Delaware</option>
				<option value="DC">District Of Columbia</option>
				<option value="FL">Florida</option>
				<option value="GA">Georgia</option>
				<option value="HI">Hawaii</option>
				<option value="ID">Idaho</option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana</option>
				<option value="IA">Iowa</option>
				<option value="KS">Kansas</option>
				<option value="KY">Kentucky</option>
				<option value="LA">Louisiana</option>
				<option value="ME">Maine</option>
				<option value="MD">Maryland</option>
				<option value="MA">Massachusetts</option>
				<option value="MI">Michigan</option>
				<option value="MN">Minnesota</option>
				<option value="MS">Mississippi</option>
				<option value="MO">Missouri</option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska</option>
				<option value="NV">Nevada</option>
				<option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
				<option value="OR">Oregon</option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island</option>
				<option value="SC">South Carolina</option>
				<option value="SD">South Dakota</option>
				<option value="TN">Tennessee</option>
				<option value="TX">Texas</option>
				<option value="UT">Utah</option>
				<option value="VT">Vermont</option>
				<option value="VA">Virginia</option>
				<option value="WA">Washington</option>
				<option value="WV">West Virginia</option>
				<option value="WI">Wisconsin</option>
				<option value="WY">Wyoming</option>
				<option value="AS">American Samoa</option>
				<option value="GU">Guam</option>
				<option value="MP">Northern Mariana Islands</option>
				<option value="PR">Puerto Rico</option>
				<option value="UM">United States Minor Outlying Islands</option>
				<option value="VI">Virgin Islands</option>
				<option value="AA">Armed Forces Americas</option>
				<option value="AP">Armed Forces Pacific</option>
				<option value="AE">Armed Forces Others</option>					
			</select>
			<form:errors path="state"/>	<br><br>
		</div>
		
		<div>
			<p>Activity Level:</p>
			
			<form:label path="activityLevel">Low</form:label>
			<form:radiobutton path="activityLevel" value="Low"/>
			
			<form:label path="activityLevel">Moderate</form:label>
			<form:radiobutton path="activityLevel" value="moderate"/>
			
			<form:label path="activityLevel">High</form:label>
			<form:radiobutton path="activityLevel" value="high"/>
			
			<form:errors path="activityLevel"/><br><br>
		</div>
		
		<div>
			<input name="submit" type="submit" value="Submit" />
		</div>
	
	</form:form>
	
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />