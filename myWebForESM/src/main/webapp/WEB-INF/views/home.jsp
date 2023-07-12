<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>index</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p><a href="${contextPath }/member/login">Go to Login Page</a></p>
<p><a href="${contextPath }/member/index">Go to Index Page</a></p>
</body>
</html>
