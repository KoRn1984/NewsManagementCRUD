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

<div class="body-title">
	<a href="list"><spring:message code="local.loc.name.newses"/> >> </a><spring:message code="local.loc.name.newsView"/>
</div>
<div class="add-table-margin">
	<table class="news_text_format">
		<tr>
			<td class="space_around_title_text"><spring:message code="local.loc.name.title"/>:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">
			<strong>
				<c:out value="${newsView.title}" />
			</strong>
			</div>
			</td>
		</tr>
		<tr>
			<td class="space_around_title_text"><spring:message code="local.loc.name.date"/>:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">			
			    <fmt:parseDate value="${newsView.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
				<fmt:formatDate value="${parsedDate}" var="newsDate" type="date" pattern="MM/dd/yyyy" />
				<c:out value="${newsDate}" />
			</div>
			</td>
		</tr>
		<tr>
			<td class="space_around_title_text"><spring:message code="local.loc.name.brief"/>:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">
				<c:out value="${newsView.brief}" />
			</div>
			</td>
		</tr>
		<tr>
			<td class="space_around_title_text"><spring:message code="local.loc.name.content"/>:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">
				<c:out value="${newsView.content}" />
			</div>
			</td>
		</tr>
	</table>
</div>
<div align="right" class="first-view-button">
	<c:url var="editLink" value="/news/showFormForEdit?newsId=${requestScope.newsView.id}"></c:url>
        <a href="${editLink}">
        <button type="submit" class="btn btn-warning"><spring:message code="local.loc.name.edit"/></button></a>
</div>
<br/><br/>
<div align="right" class="second-view-button">
	<c:url var="unpublishLink" value="/news/unpublish?id=${requestScope.newsView.id}"></c:url>
        <a href="${unpublishLink}">
        <button type="submit" class="btn btn-primary"><spring:message code="local.loc.name.unpublish"/></button></a>
</div>
<div align="left" class="third-view-button">
	<c:url var="deleteLink" value="/news/delete?newsId=${requestScope.newsView.id}"></c:url>
        <a href="${deleteLink}">	
		<button type="button" class="btn btn-danger" onclick="if (!(confirm('<spring:message code="local.loc.name.modalBody"/>'))) return false"><spring:message code="local.loc.name.delete"/></button></a>
</div>
<br /><br />
<div align="center" class="cancel-button">
	<form:form action="javascript:history.back()" method="POST" modelAttribute="newsView">
		 <button type="submit" class="btn btn-secondary" value="<spring:message code="local.loc.name.back"/>"><spring:message code="local.loc.name.back"/></button>		
	</form:form>
</div>