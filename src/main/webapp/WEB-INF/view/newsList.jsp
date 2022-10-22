<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div class="body-title"></div>
<div>	
		<c:forEach var="theNews" items="${allNews}">
			<div class="single-news-wrapper">
				<div class="single-news-header-wrapper">
					<!-- construct an "update" link with customer id -->
					<c:url var="editLink" value="/news/showFormForEdit">
						<c:param name="newsId" value="${theNews.id}" />
					</c:url>

					<c:url var="viewLink" value="/news/view">
						<c:param name="newsId" value="${theNews.id}" />
					</c:url>
					
					<c:url var="unpublishLink" value="/news/unpublish">
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
							<a href="${viewLink}"><spring:message code="local.loc.name.view"/></a><br/><br/>
							<a href="${unpublishLink}"><spring:message code="local.loc.name.unpublish"/></a> &nbsp
							<a href="${deleteLink}"	onclick="if (!(confirm('Are you sure you want to delete this news?'))) return false"><spring:message code="local.loc.name.delete"/></a>
						</div>					
					</div>
				</div>
			</div>
		</c:forEach>	
</div>