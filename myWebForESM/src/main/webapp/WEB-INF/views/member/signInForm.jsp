<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script src="${contextPath }/resources/js/formScript.js" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
		<section>
			<h1>회원가입</h1>
			<form action="${contextPath}/member/signIn" method="post" name="signInForm">
				<input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요"/><br>
				<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요"/><br>
				<input type="text" name="userNickName" id="userNickName" placeholder="별명을 입력하세요"/><br>
				<input type="text" name="userPhone" id="userPhone" placeholder="번호를 입력하세요"/><br>
				<input type="text" name="userEmail" id="userEmail" placeholder="이메일을 입력하세요"/>
				<!-- @<input type="text" name="userDomain" id="userDomain" placeholder="도메인을 입력하세요"/> --><br>
				<input type="text" name="userAddr" id="userAddr" placeholder="주소를 입력하세요"/><br>
			</form>
			<button onclick="checkSignIn()">제출하기</button>
		</section>
	<c:import url="../default/footer.jsp"/>
</body>
</html>