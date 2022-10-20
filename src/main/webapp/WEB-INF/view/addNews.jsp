<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="localization.local" var="loc" />    
<fmt:message bundle="${loc}" key="local.loc.name.newses" var="newses" />
<fmt:message bundle="${loc}" key="local.loc.name.addNews" var="add_news" />
<fmt:message bundle="${loc}" key="local.loc.name.enterText" var="enter_text" />
<fmt:message bundle="${loc}" key="local.loc.name.title" var="title" />
<fmt:message bundle="${loc}" key="local.loc.name.date" var="date" />
<fmt:message bundle="${loc}" key="local.loc.name.brief" var="brief" />
<fmt:message bundle="${loc}" key="local.loc.name.content" var="content" />
<fmt:message bundle="${loc}" key="local.loc.name.save" var="save" />
<fmt:message bundle="${loc}" key="local.loc.name.cancel" var="cancel" />
<fmt:message bundle="${loc}" key="local.loc.name.addNewsError" var="add_news_error" />
<fmt:message bundle="${loc}" key="local.loc.name.placeholderTitle" var="placeholderTitle" />
<fmt:message bundle="${loc}" key="local.loc.name.placeholderBrief" var="placeholderBrief" />
<fmt:message bundle="${loc}" key="local.loc.name.placeholderContent" var="placeholderContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add News</title>
<style>
   textarea {
    background: #fce9c0;
    border: 2px solid #a9c358;
    padding: 10px;
    width: 100%;
    height: 200px;
    box-sizing: border-box;
    font-size: 14px;
   }
  </style>
<link rel="stylesheet" type="text/css" href=<c:url value="/resources/styles/newsStyle.css"/> />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="javascript" type="text/javascript" href=<c:url value="/resources/scripts/validation.js"/> />
</head>
<body>
<div class="body-title">
	<a href="list"><spring:message code="local.loc.name.newses"/> >> </a><spring:message code="local.loc.name.addNews"/>
</div>
<div class="add-table-margin">
	<table class="news_text_format">
<legend><b><div style="text-align:center;"><spring:message code="local.loc.name.enterText"/>:</div></b></legend><br />
<form:form action="saveNews" method="POST" modelAttribute="newsAdd">		
	<form:hidden path="id" /> 						
		<label><spring:message code="local.loc.name.title"/>:<br />
		<p><textarea type="text" name="title" placeholder="${placeholderTitle}" value="" style="width: 670px; height: 40px;"></textarea></p></label>        
        <label><spring:message code="local.loc.name.brief"/>:<br />
        <p><textarea type="text" name="brief" placeholder="${placeholderBrief}" value="" style="width: 670px; height: 60px;"></textarea></p></label>					
		<label><spring:message code="local.loc.name.content"/>:<br />
		<p><textarea type="text" name="content" placeholder="${placeholderContent}" value="" style="width: 670px; height: 140px;"></textarea></p></label>			
		<br />
		<c:if test="${not (param.AddNewsError eq null)}">					
			<font color="red">
				<c:out value="${add_news_error}" />
			</font> 
		</c:if><br />
		<button type="submit" class="btn btn-info" value="<spring:message code="local.loc.name.save"/>"><spring:message code="local.loc.name.save"/></button>
</form:form>
</table>
</div>
<div class="cancel-button">
		<form:form action="list" method="POST" modelAttribute="newsAdd">		    		    
		    <button type="submit" class="btn btn-dark" value="<spring:message code="local.loc.name.cancel"/>"><spring:message code="local.loc.name.cancel"/></button>
		</form:form>
</div>
</body>
</html>