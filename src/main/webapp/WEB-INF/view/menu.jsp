<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href=<c:url value="/resources/styles/newsStyle.css"/> />
<link rel="javascript" type="text/javascript" href=<c:url value="/resources/scripts/validation.js"/> />
</html>
<div class="menu-wrapper">
	<div class="menu-title-wrapper">
		<div class="menu-title"><spring:message code="local.loc.name.newses"/></div>
	</div>
	<div class="list-menu-invisible-wrapper">
		<div class="list-menu-wrapper" style="float: right;">
			<ul style="list-style-image: url(/news-management-spring/resources/images/img.jpg); text-align: left;">
				<li style="padding-left: 15px;">				
				<a href="list"><spring:message code="local.loc.name.newsList"/></a><br />
				</li>				
				<li style="padding-left: 15px;">
				<c:url var="addLink" value="/news/showFormForAdd"></c:url>
				<a href="${addLink}"><spring:message code="local.loc.name.addNews"/></a><br />					
				</li>				
			</ul>
		</div>		
		<div class="clear"></div>
	</div>
	<!--  grey free space at the bottom of menu -->
	<div style="height: 25px;"></div>
</div>