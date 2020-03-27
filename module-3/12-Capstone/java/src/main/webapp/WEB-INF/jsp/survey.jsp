<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="body-content">

	<h1>Enjoyed your visit?</h1>
	<p>Please fill out our survey!</p><br><br>

	<c:url value="/survey" var="surveyURL"/>
	<form:form class="form-overall" action="${surveyURL}" method="POST" modelAttribute="surveyResult">
	
		<div class="form-format">
			<form:label path="parkCode">Favorite National Park:</form:label>
			
			<form:select class="select" path="parkCode" name="parkCode" size="1">		
				<form:option value=""></form:option>	
				<c:forEach items="${parks}" var="park">
					<form:option value="${park.parkCode}">${park.parkName}</form:option>
				</c:forEach>
			</form:select>
			<form:errors path="parkCode" class="errors"/><br><br>
		</div>
			
		<div class="form-format">
			<form:label path="emailAddress">Your email:</form:label>
			<form:input type="text" path="emailAddress"/>
			<form:errors path="emailAddress" class="errors"/><br><br>
		</div>
		
		<div class="form-format">
			<form:label path="state">State of Residence:</form:label>
			<form:select class="select" path="state" name="state">
				<form:option value=""></form:option>
				<form:option value="AL">Alabama</form:option>
				<form:option value="AK">Alaska</form:option>
				<form:option value="AZ">Arizona</form:option>
				<form:option value="AR">Arkansas</form:option>
				<form:option value="CA">California</form:option>
				<form:option value="CO">Colorado</form:option>
				<form:option value="CT">Connecticut</form:option>
				<form:option value="DE">Delaware</form:option>
				<form:option value="DC">District Of Columbia</form:option>
				<form:option value="FL">Florida</form:option>
				<form:option value="GA">Georgia</form:option>
				<form:option value="HI">Hawaii</form:option>
				<form:option value="ID">Idaho</form:option>
				<form:option value="IL">Illinois</form:option>
				<form:option value="IN">Indiana</form:option>
				<form:option value="IA">Iowa</form:option>
				<form:option value="KS">Kansas</form:option>
				<form:option value="KY">Kentucky</form:option>
				<form:option value="LA">Louisiana</form:option>
				<form:option value="ME">Maine</form:option>
				<form:option value="MD">Maryland</form:option>
				<form:option value="MA">Massachusetts</form:option>
				<form:option value="MI">Michigan</form:option>
				<form:option value="MN">Minnesota</form:option>
				<form:option value="MS">Mississippi</form:option>
				<form:option value="MO">Missouri</form:option>
				<form:option value="MT">Montana</form:option>
				<form:option value="NE">Nebraska</form:option>
				<form:option value="NV">Nevada</form:option>
				<form:option value="NH">New Hampshire</form:option>
				<form:option value="NM">New Mexico</form:option>
				<form:option value="NY">New York</form:option>
				<form:option value="NC">North Carolina</form:option>
				<form:option value="ND">North Dakota</form:option>
				<form:option value="OH">Ohio</form:option>
				<form:option value="OK">Oklahoma</form:option>
				<form:option value="OR">Oregon</form:option>
				<form:option value="PA">Pennsylvania</form:option>
				<form:option value="RI">Rhode Island</form:option>
				<form:option value="SC">South Carolina</form:option>
				<form:option value="SD">South Dakota</form:option>
				<form:option value="TN">Tennessee</form:option>
				<form:option value="TX">Texas</form:option>
				<form:option value="UT">Utah</form:option>
				<form:option value="VT">Vermont</form:option>
				<form:option value="VA">Virginia</form:option>
				<form:option value="WA">Washington</form:option>
				<form:option value="WV">West Virginia</form:option>
				<form:option value="WI">Wisconsin</form:option>
				<form:option value="WY">Wyoming</form:option>
				<form:option value="AS">American Samoa</form:option>
				<form:option value="GU">Guam</form:option>
				<form:option value="MP">Northern Mariana Islands</form:option>
				<form:option value="PR">Puerto Rico</form:option>
				<form:option value="UM">United States Minor Outlying Islands</form:option>
				<form:option value="VI">Virgin Islands</form:option>
				<form:option value="AA">Armed Forces Americas</form:option>
				<form:option value="AP">Armed Forces Pacific</form:option>
				<form:option value="AE">Armed Forces Others</form:option>					
			</form:select>
			<form:errors path="state" class="errors"/>	<br><br>
		</div>
		
		<div class="form-format">
			<p class="radio">Activity Level:</p>
			<div class="radio">
			
				<form:label path="activityLevel">
				<form:radiobutton path="activityLevel" value="inactive"/>Inactive</form:label>
				
				<form:label path="activityLevel">
				<form:radiobutton path="activityLevel" value="sedentary"/>Sedentary</form:label>
				
				<form:label  path="activityLevel">
				<form:radiobutton path="activityLevel" value="active"/>Active</form:label>
			
				<form:label  path="activityLevel">
				<form:radiobutton path="activityLevel" value="extremely active"/>Extremely Active</form:label>
			
			</div>
				<form:errors path="activityLevel" class="errors"/>
		</div>
		
		<div>
			<input name="submit" type="submit" class="submit" value="Submit" />
		</div>
	
	</form:form>
	
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />