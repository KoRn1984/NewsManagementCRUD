<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:if test="${requestScope.presentation eq 'newsList'}">
	<c:import url="/WEB-INF/view/newsList.jsp" />
</c:if>

<c:if test="${requestScope.presentation eq 'viewNews'}">
	<c:import url="/WEB-INF/view/viewNews.jsp" />
</c:if>

<c:if test="${requestScope.commandsName eq 'addNews'}">
	<c:import url="/WEB-INF/view/addNews.jsp" />
</c:if>

<c:if test="${requestScope.commandsName eq 'editNews'}">
	<c:import url="/WEB-INF/view/editNews.jsp" />
</c:if>