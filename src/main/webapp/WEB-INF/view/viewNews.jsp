<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>View News</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href=<c:url value="/resources/styles/newsStyle.css"/> />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="javascript" type="text/javascript" href=<c:url value="/resources/scripts/validation.js"/> />
</head>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="localization.local" var="loc" />    
<fmt:message bundle="${loc}" key="local.loc.name.newses" var="newses" />
<fmt:message bundle="${loc}" key="local.loc.name.newsView" var="news_view" />
<fmt:message bundle="${loc}" key="local.loc.name.title" var="title" />
<fmt:message bundle="${loc}" key="local.loc.name.date" var="date" />
<fmt:message bundle="${loc}" key="local.loc.name.brief" var="brief" />
<fmt:message bundle="${loc}" key="local.loc.name.content" var="content" />
<fmt:message bundle="${loc}" key="local.loc.name.edit" var="edit" />
<fmt:message bundle="${loc}" key="local.loc.name.delete" var="delete" />
<fmt:message bundle="${loc}" key="local.loc.name.unpublish" var="unpublish" />
<fmt:message bundle="${loc}" key="local.loc.name.back" var="back" />
<fmt:message bundle="${loc}" key="local.loc.name.modalTitle" var="modalTitle" />
<fmt:message bundle="${loc}" key="local.loc.name.modalBody" var="modalBody" />
<fmt:message bundle="${loc}" key="local.loc.name.modalClose" var="modalClose" />
<fmt:message bundle="${loc}" key="local.loc.name.modalExecute" var="modalExecute" />

<div class="body-title">
	<a href="list">${newses} >> </a>${news_view}
</div>
<div class="add-table-margin">
	<table class="news_text_format">
		<tr>
			<td class="space_around_title_text">${title}:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">
			<strong>
				<c:out value="${newsView.title}" />
			</strong>
			</div>
			</td>
		</tr>
		<tr>
			<td class="space_around_title_text">${date}:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">			
			    <fmt:parseDate value="${newsView.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
				<fmt:formatDate value="${parsedDate}" var="newsDate" type="date" pattern="MM/dd/yyyy" />
				<c:out value="${newsDate}" />
			</div>
			</td>
		</tr>
		<tr>
			<td class="space_around_title_text">${brief}:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">
				<c:out value="${newsView.brief}" />
			</div>
			</td>
		</tr>
		<tr>
			<td class="space_around_title_text">${content}:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">
				<c:out value="${newsView.content}" />
			</div>
			</td>
		</tr>
	</table>
</div>
<c:if test="${sessionScope.role eq 'admin'}">
<div align="right" class="first-view-button">
	<form:form action="saveNews" method="POST" modelAttribute="newsEdit">		
	<form:hidden path="id" />
		<input type="hidden" name="id" value="${news.id}" />
		<button type="submit" class="btn btn-warning" value="${edit}">${edit}</button>
	</form:form>
</div>
<br/><br/>
<div align="right" class="second-view-button">
	<form action="controller" method="post">
		<input type="hidden" name="command" value="do_unpublish_news" />
		<input type="hidden" name="id" value="${news.id}" />
		<button type="submit" class="btn btn-primary">${unpublish}</button>	
	</form>
</div>
<div align="left" class="third-view-button">
	<form action="controller" method="post">
		<input type="hidden" name="command" value="do_delete_news" />
		<input type="hidden" name="id" value="${news.id}" />		
		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop" value="${delete}">${delete}</button>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">        
        <h2 class="modal-title" id="staticBackdropLabel"><strong>${modalTitle}</strong></h2>        
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>      
      <h5 class="modal-body" style="text-align:center;">${modalBody}</h5>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">${modalClose}</button>
        <button type="submit" class="btn btn-primary" value="${unpublish}">${modalExecute}</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
</form>
</div>
</c:if>
<br /><br />
<div align="center" class="cancel-button">
	<form:form action="list" method="POST" modelAttribute="newsView">
		 <button type="submit" class="btn btn-secondary" value="<spring:message code="local.loc.name.back"/>"><spring:message code="local.loc.name.back"/></button>		
	</form:form>
</div>