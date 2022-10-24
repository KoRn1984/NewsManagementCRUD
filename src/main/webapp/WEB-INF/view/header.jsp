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
			<c:url var="listLink" value="list"></c:url>			
				<a href="${listLink}"><spring:message code="local.loc.name.signIn"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
			<c:url var="latestListLink" value="base_page"></c:url>			
				<a href="${latestListLink}"><spring:message code="local.loc.name.signOut"/></a>
		</div>
	</div>
</div>
</body>
</html>