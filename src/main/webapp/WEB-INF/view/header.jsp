<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div class="wrapper">	
	<div class="newstitle"><spring:message code="local.loc.name.newsManagement"/></div>
	<div class="local-link">	
		<div align="right">			    
			<a href="?languageVar=en"><spring:message code="local.loc.name.en"/></a>&nbsp;&nbsp;
			<a href="?languageVar=ru"><spring:message code="local.loc.name.ru"/></a><br /><br />
			<c:if test="${user_status eq 'not_active'}">
			<c:url var="listLink" value="list"></c:url>
			<a href="${listLink}">
			<button type="submit" class="badge text-bg-info" value="${listLink}"><spring:message code="local.loc.name.signIn"/></button></a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${user_status eq 'active'}">
			<c:url var="latestListLink" value="base_page"></c:url>			
				<a href="${latestListLink}">
				<button type="submit" class="badge text-bg-info" value="${latestListLink}"><spring:message code="local.loc.name.signOut"/></button></a>				
			</c:if>
		</div>
	</div>
</div>
</body>
</html>