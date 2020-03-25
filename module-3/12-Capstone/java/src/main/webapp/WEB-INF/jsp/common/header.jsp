<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>National Park Geek</title>
    <c:url value="/css/site.css" var="cssHref" />
    
    <link rel="stylesheet" href="${cssHref}" type="text/css">

</head>

<body>

    <div class="header">
    	<div class="header-img">
	    	<c:url value="/img/logo.png" var="nplogo" />
	    	<img id="header-logo" src="${nplogo}">
    	</div>
 
        <div class="container">
        	<c:url value="/" var="home"/>
        	<c:url value="/survey" var="survey"/>
            <a class="nav-links" href="${home}">Home</a>
            <a class="nav-links" href="${survey}">Survey</a>
        </div>
    </div>