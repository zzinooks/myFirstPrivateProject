<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<section>
		<h1>회원 정보 수정 페이지</h1>
		<form action="${contextPath}/member/memberModify" method="post" name="memberModifyForm">
			<input type="text" name="userId" id="userId" value="${user.id }" readonly/><br>
			<input type="password" name="userPwd" id="userPwd" value="${user.pwd }" placeholder="비밀번호를 입력하세요"/><br>
			<input type="text" name="userNickName" id="userNickName" value="${user.nickname }" placeholder="별명을 입력하세요"/><br>
			<input type="text" name="userPhone" id="userPhone" value="${user.phone }" placeholder="번호를 입력하세요"/><br>
			<input type="text" name="userEmail" id="userEmail" value="${user.email }" placeholder="이메일을 입력하세요"/><br>
			<input type="text" name="userAddr" id="userAddr" value= "${user.addr }" placeholder="주소를 입력하세요"/><br>
			<input type="submit" value="제출하기">
		</form>
	</section>
	<c:import url="../default/footer.jsp"/>
</body>
</html>