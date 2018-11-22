<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
	<head>
		<title>Home Page</title>
	</head>
	<body>
		<!-- Display logged in user name -->
		<h2>Welcome <security:authentication property="principal.username"/> </h2>
		<hr/>
		
		<!-- Display roles of the logged in user -->
		<h3> Roles : <security:authentication property="principal.authorities"/> </h3>
		<hr/>
		
		<security:authorize access="hasRole('MANAGER')">
			<!-- Add link to point to /managers -this is a page for managers  -->
			<p>
				<a href="${pageContext.request.contextPath}/managers">Manager Meeting</a>
				(Only for users with manager role)
			</p>	
			<hr/>
		</security:authorize>
		
		<security:authorize access="hasRole('ADMIN')">
			<!-- Add link to point to /admins -this is a page for admins  -->
			<p>
				<a href="${pageContext.request.contextPath}/admins">Admin Meeting</a>
				(Only for user with admin role)
			</p>
			<hr/>
		</security:authorize>
		
		<!-- Logout button -->
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="Logout">
		</form:form>
		
	</body>
</html>