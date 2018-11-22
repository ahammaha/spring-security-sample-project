<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="jstlTag" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Custom Login Page</title>
	<style type="text/css">
		.failed{
			color:red;
		}
	</style>
</head>
<body>
	<h3>Custom Login Page</h3>
	
	<!-- context path is nothing but the root of the application. it is same as context root -->
	<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
		
		<jstlTag:if test="${param.error!=null}">
			<i class="failed">Sorry! You have entered invalid username/password.</i>
		</jstlTag:if>
		
		<!-- the input fields should have default name as username and password -->
		<p>
			Username : <input type="text" name="username" />
		</p>
	
		<p>
			Password : <input type="password" name="password">
		</p>
	
		<input type="submit" value="login" />
	
	</form:form>
	
</body>
</html>