<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>News Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <style>
   body {
  background: #eeeeee url(/news-management-spring/resources/images/newsBackground.jpg) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  -ms-filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(src= /news-management-spring/resources/images/newsBackground.jpg', sizingMethod='scale')";
  filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='. /news-management-spring/resources/images/newsBackground.jpg', sizingMethod='scale');
}
 </style>
<link rel="stylesheet" type="text/css" href=<c:url value="/resources/styles/newsStyle.css"/> />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="javascript" type="text/javascript" href=<c:url value="/resources/scripts/validation.js"/> />
</head>
<body>
	<div class="page">	   
		<div class="header">
			<c:import url="/WEB-INF/view/header.jsp" />
		</div>
		<div class="base-layout-wrapper">
			<div class="menu">
				<c:import url="/WEB-INF/view/menu.jsp" />
			</div>			
			<c:if test="${not (newsView eq null)}">
				<div class="content">
					<c:import url="/WEB-INF/view/viewNews.jsp" />
				</div>
			</c:if>
			<c:if test="${not (allNews eq null)}">
				<div class="content">
					<c:import url="/WEB-INF/view/newsList.jsp" />
				</div>
			</c:if>
			<c:if test="${not (newsAdd eq null)}">
				<div class="content">
					<c:import url="/WEB-INF/view/addNews.jsp" />
				</div>
			</c:if>
			<c:if test="${not (newsEdit eq null)}">
				<div class="content">
					<c:import url="/WEB-INF/view/editNews.jsp" />
				</div>
			</c:if>
		</div>
		<div class="footer">
			<c:import url="/WEB-INF/view/footer.jsp" />
		</div>
	</div>
</body>
</html>