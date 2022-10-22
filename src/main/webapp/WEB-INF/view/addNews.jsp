<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
		<p><textarea type="text" name="title" placeholder="<spring:message code="local.loc.name.placeholderTitle"/>" value="" style="width: 670px; height: 40px;"></textarea></p></label>        
        <label><spring:message code="local.loc.name.brief"/>:<br />
        <p><textarea type="text" name="brief" placeholder="<spring:message code="local.loc.name.placeholderBrief"/>" value="" style="width: 670px; height: 60px;"></textarea></p></label>					
		<label><spring:message code="local.loc.name.content"/>:<br />
		<p><textarea type="text" name="content" placeholder="<spring:message code="local.loc.name.placeholderContent"/>" value="" style="width: 670px; height: 140px;"></textarea></p></label>			
		<br />
		<br />
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