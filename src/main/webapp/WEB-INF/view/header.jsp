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
		</div>		
		<c:if test="${not (sessionScope.user_status eq 'active')}">
			<div align="right">
				<form action="${pageContext.request.contextPath}/authenticateTheUser" method="post" >									
					<spring:message code="local.loc.name.enterLogin"/>:<input type="text" name="login" value="" required pattern="^[A-Za-z]([.A-Za-z0-9-]{1,18})([A-Za-z0-9])$"/><br />
					<spring:message code="local.loc.name.enterPassword"/>:<input type="password" name="password" value="" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^\w\s]).{6,}"/><br />
					<c:if test="${not (param.AuthenticationError eq null)}">					
						<font color="red">
						   <spring:message code="local.loc.name.authenticationError"/>
						</font> 
					</c:if>
					<c:url var="registrationLink" value="/registration/showFormReg"></c:url>
					<a href="${registrationLink}"><spring:message code="local.loc.name.registration"/></a>
					<button type="submit" class="badge text-bg-info" value="<spring:message code="local.loc.name.signIn"/>"><spring:message code="local.loc.name.signIn"/></button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />				
				</form>
			</div>
		</c:if>			
		<c:if test="${sessionScope.user_status eq 'active'}">
			<div align="right">			
			<font color="blue">${user.userName}</font>&nbsp;&nbsp;<font color="blue">${user.userSurname}</font>
			<form action="controller" method="post">
			<div align="right">			
				<a href="controller?command=go_to_user_personal_account"><spring:message code="local.loc.name.personalAccount"/></a>
			</div>								    
				<input type="hidden" name="command" value="do_sign_out" />
				<button type="submit" class="badge text-bg-info" value="<spring:message code="local.loc.name.signOut"/>"><spring:message code="local.loc.name.signOut"/></button>
			</form>
			</div>
		</c:if>		
	</div>
</div>
</body>
</html>