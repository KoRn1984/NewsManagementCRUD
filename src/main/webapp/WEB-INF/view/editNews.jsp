<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="localization.local" var="loc" />    
<fmt:message bundle="${loc}" key="local.loc.name.newses" var="newses" />
<fmt:message bundle="${loc}" key="local.loc.name.editNews" var="edit_news" />
<fmt:message bundle="${loc}" key="local.loc.name.enterText" var="enter_text" />
<fmt:message bundle="${loc}" key="local.loc.name.title" var="title" />
<fmt:message bundle="${loc}" key="local.loc.name.brief" var="brief" />
<fmt:message bundle="${loc}" key="local.loc.name.content" var="content" />
<fmt:message bundle="${loc}" key="local.loc.name.save" var="save" />
<fmt:message bundle="${loc}" key="local.loc.name.cancel" var="cancel" />
<fmt:message bundle="${loc}" key="local.loc.name.editNewsError" var="edit_news_error" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit News</title>
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
<a href="list">${newses} >> </a>${edit_news}
</div>
<div class="add-table-margin">
<table class="news_text_format">
<legend><b><div style="text-align:center;">${enter_text}:</div></b></legend><br />
<form:form action="saveNews" method="POST" modelAttribute="newsEdit">		
	<form:hidden path="id" />
	              						
		<label>${title}:<br />
		<p><textarea type="text" name="title" value="" style="width: 670px; height: 40px;">${news.title}</textarea></p></label>
		<label>${brief}:<br />
        <p><textarea type="text" name="brief" value="" style="width: 670px; height: 60px;">${news.brief}</textarea></p></label>				
		<label>${content}:<br />
		<p><textarea type="text" name="content" value="" style="width: 670px; height: 140px;">${news.content}</textarea></p></label>	
		<br />
		<c:if test="${not (param.EditNewsError eq null)}">				
			<font color="red">
				<c:out value="${edit_news_error}" />
			</font>
		</c:if><br />						
		<button type="submit" class="btn btn-info" value="${save}">${save}</button>
</form:form>
</table>
</div>
<div class="cancel-button">
		<form:form action="list" method="POST" modelAttribute="newsEdit">		     	          
		     <button type="submit" class="btn btn-dark" value="${cancel}">${cancel}</button>
		</form:form>		
</div>
</body>
</html>