<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>News List</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href=<c:url value="/resources/styles/newsStyle.css"/> />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="javascript" type="text/javascript" href=<c:url value="/resources/scripts/validation.js"/> />
<link rel="javascript" type="text/javascript" href=<c:url value="/resources/scripts/jquery-3.6.1.min.js"/> />
</head>
<body>
<div class="body-title">    
	<a href="list"><spring:message code="local.loc.name.newses"/> >></a><spring:message code="local.loc.name.newsList"/>
</div>
<div>
<c:url var="unpublishLink" value="/news/unpublish">
	<c:param name="newsId" value="${theNews.id}" />
</c:url>
<c:if test="${sessionScope.addNews eq 'command_executed'}">
	   <div class="alert alert-primary" role="alert">
	     <div style="text-align:center;"><spring:message code="local.loc.name.saveMessage"/>!</div>
	     <c:remove var="addNews" />
	   </div>
	</c:if>
	<c:if test="${sessionScope.editNews eq 'command_executed'}">
	   <div class="alert alert-warning" role="alert">
	     <div style="text-align:center;"><spring:message code="local.loc.name.updateMessage"/>!</div>
	     <c:remove var="editNews" />
	   </div>
	</c:if>	
    <c:if test="${sessionScope.unpublishNews eq 'command_executed'}">
	   <div class="alert alert-info" role="alert">
	     <div style="text-align:center;"><spring:message code="local.loc.name.unpublishMessage"/>!</div>
	     <c:remove var="unpublishNews" />
	   </div>
	</c:if>	    
	<c:if test="${sessionScope.deleteNews eq 'command_executed'}">
	   <div class="alert alert-danger" role="alert">
	     <div style="text-align:center;"><spring:message code="local.loc.name.deleteMessage"/>!</div>
	     <c:remove var="deleteNews" />
	   </div>
	</c:if>		
<form:form action="${unpublishLink}" method="get">
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
							<a href="${viewLink}"><spring:message code="local.loc.name.view"/></a>
							<input type="checkbox" name="id" value="${theNews.id}"/><br/><br/>							
							<a href="${deleteLink}"	onclick="if (!(confirm('<spring:message code="local.loc.name.modalBody"/>'))) return false"><spring:message code="local.loc.name.delete"/></a>
						</div>					
					</div>							
				</div>
			</div>
		</c:forEach>		
		<div class="delete-button-position">	  		
		   <button type="submit" class="btn btn-primary" value="<spring:message code="local.loc.name.unpublish"/>"><spring:message code="local.loc.name.unpublish"/></button>		   
	    </div>        
        </form:form>
	<br/><br/>
	<div class="Page navigation">
      <c:if test="${user_status eq 'active'}">
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <c:if test="${currentPage != 1}">
                <a class="page-link" href="list?pageNo=${currentPage - 1}" tabindex="-1"><spring:message code="local.loc.name.previous"/></a></c:if>
            </li>      
            <c:forEach var="page" begin="1" end="${requestScope.countPage}">
              <c:if test="${param.pageNo eq page}">                   
                <li class="page-item active">
                  <a class="page-link" href="list?pageNo=${page}">
                  <c:out value="${page}" /></a>
                </li>                     
              </c:if>
              <c:if test="${not(param.pageNo eq page)}">
                <li class="page-item">
                  <a class="page-link" href="list?pageNo=${page}">
                  <c:out value="${page}" /></a>
                </li>
              </c:if>
            </c:forEach>
            <li class="page-item">
              <c:if test="${currentPage lt countPage}">                
                <a class="page-link" href="list?pageNo=${currentPage + 1}"><spring:message code="local.loc.name.next"/></a>
              </c:if>
            </li>               
          </ul>
        </nav>
      </c:if>
    </div>			
</div>
</body>
</html>