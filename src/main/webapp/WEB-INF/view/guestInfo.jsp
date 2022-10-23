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
<title>Guest Info</title>
</head>
<body>
<div class="body-title">    
	<a href="list"><spring:message code="local.loc.name.newses"/> >></a> <spring:message code="local.loc.name.latestNews"/>
</div>
<c:forEach var="theNews" items="${news}">
		<div class="single-news-wrapper">
			<div class="single-news-header-wrapper">
				<div class="news-title">
				    <strong>
					    <c:out value="${theNews.title}" />
				    </strong>
				</div>
				<div class="news-date">
				    <fmt:parseDate value="${theNews.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
				    <fmt:formatDate value="${parsedDate}" var="newsDate" type="date" pattern="MM/dd/yyyy" />
					<c:out value="${newsDate}" />
				</div>
				<div class="news-content">
					<c:out value="${theNews.brief}" />
				</div>
			</div>
		</div>
	</c:forEach>
	<c:if test="${requestScope.showNews eq 'not_show'}">
	<div class="no-news">
		<c:if test="${sessionScope.news eq null}">
		<font color="red">
        <spring:message code="local.loc.name.noNews"/>!
        </font>
	    </c:if>
	</div>
	</c:if>
</form>
</body>
</html>