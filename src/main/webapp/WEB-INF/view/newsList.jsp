<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript" defer src="scripts/jquery-3.6.1.min.js"></script>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="localization.local" var="loc" />    
<fmt:message bundle="${loc}" key="local.loc.name.newses" var="newses" />
<fmt:message bundle="${loc}" key="local.loc.name.newsList" var="news_list" />
<fmt:message bundle="${loc}" key="local.loc.name.edit" var="edit" />
<fmt:message bundle="${loc}" key="local.loc.name.view" var="view" />
<fmt:message bundle="${loc}" key="local.loc.name.delete" var="delete" />
<fmt:message bundle="${loc}" key="local.loc.name.unpublish" var="unpublish" />
<fmt:message bundle="${loc}" key="local.loc.name.noNews" var="no_news" />
<fmt:message bundle="${loc}" key="local.loc.name.regMessage" var="reg_message" />
<fmt:message bundle="${loc}" key="local.loc.name.saveMessage" var="save_message" />
<fmt:message bundle="${loc}" key="local.loc.name.updateMessage" var="update_message" />
<fmt:message bundle="${loc}" key="local.loc.name.unpublishMessage" var="unpublish_message" />
<fmt:message bundle="${loc}" key="local.loc.name.deleteMessage" var="delete_message" />
<fmt:message bundle="${loc}" key="local.loc.name.previous" var="previous" />
<fmt:message bundle="${loc}" key="local.loc.name.next" var="next" />

<div class="body-title"></div>

<div>
	<%-- <form:form action="delete" modelAttribute="theNews" method="POST">--%>
		<c:forEach var="theNews" items="${allNews}">
			<%-- <form:hidden path="idNews" />--%>

			<%--<input type="checkbox" name="bulkwelcome" class="bulkwelcome"
				id="bulkwelcome_${theNews.idNews }" value="${theNews.idNews }" />&nbsp;--%>
			
			<div class="single-news-wrapper">
				<div class="single-news-header-wrapper">
					<!-- construct an "update" link with customer id -->
					<c:url var="editLink" value="/news/showFormForEdit">
						<c:param name="newsId" value="${theNews.id}" />
					</c:url>

					<c:url var="viewLink" value="/news/view">
						<c:param name="newsId" value="${theNews.id}" />
					</c:url>
					
					<c:url var="deleteLink" value="/news/delete">
						<c:param name="newsId" value="${theNews.id}" />
					</c:url>
					
					<div class="single-news-wrapper">
						<div class="single-news-header-wrapper">
							<strong><div class="news-title">${theNews.title}</div></strong>
							<fmt:parseDate value="${theNews.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
				            <fmt:formatDate value="${parsedDate}" var="newsDate" type="date" pattern="MM/dd/yyyy" />
							<div class="news-date">${newsDate}</div>
							<div class="news-content">${theNews.brief}</div>
						</div>
					</div>

					<div class="news-link-to-wrapper">
						<div class="link-position">
							<a href="${editLink}"><spring:message code="local.loc.name.edit"/></a> &nbsp
							<a href="${viewLink}"><spring:message code="local.loc.name.view"/></a> &nbsp
							<a href="${deleteLink}"	onclick="if (!(confirm('Are you sure you want to delete this news?'))) return false"><spring:message code="local.loc.name.delete"/></a>
						</div>
					<%--	<form:checkboxes path="idNews"
							items="${theNews.briefNews}" />
						<input type="submit" value="Delete" class="delete"/>--%>
					</div>
				</div>
			</div>
		</c:forEach>

	<%--</form:form>--%>

	<!--  <div class="no-news">
		<c:if test="${allNews eq null}">
               No news.
	       </c:if>
	</div>-->
</div>