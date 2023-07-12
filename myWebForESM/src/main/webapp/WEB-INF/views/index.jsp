<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공 페이지</title>
</head>
<body>
	<c:import url="default/header.jsp"></c:import>
	<section>
		<h1>${user.id } 님 환영합니다~</h1>
		<p> 얏호 로그인 성공~!!</p>
		
		<c:if test="${user.id != null }">
			<a href="${contextPath }/member/logOut">로그아웃</a>
			<a href="${contextPath }/member/memberModifyForm">회원정보 수정</a>
			<a href="${contextPath }/member/memberDelete">회원정보 삭제</a>
		</c:if>
		<c:if test="${user.id == null }">
			<a href="${contextPath }/member/login">로그인</a>
		</c:if>
	</section>
	<c:import url="default/footer.jsp"></c:import>
</body>
</html>