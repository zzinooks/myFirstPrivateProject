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
<style type="text/css">

body {
	margin: 0 auto;
	background-color: #f2f0f0;
	font-family: "맑은 고딕", sans-serif;
	font-size: 12px;
	color: black;
	width:1200px;
}

/* logo */
.logo {
	margin: o auto;
	margin-bottom: 200px;
}
/* form-box */
.form-box {
	margin: 0 auto;
	position: relative;
	width: 400px;
	height: 450px;
	border: 2px solid #C19681;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;

	
}
</style>

<script type="text/javascript">
	function submit() {
		document.memberLoginForm.submit();
	}

	function loginWithKakao() {
	    Kakao.Auth.authorize({
	      redirectUri: 'http://localhost:8080/root/member/login',
	    });
	}
</script>

<!-- 카카오 로그인 관련 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
  integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
<script>
  Kakao.init('dcac716d192c1c3d2508c1adc0dc6836'); // 사용하려는 앱의 JavaScript 키 입력
</script>


<title>로그인 </title>
</head>
<body>
	<section>
		
		<div class="form-box">
			<div id="logo">
				<a href="${contextPath }/member/index"><img src="${contextPath }/resources/image/logo.gif"></a>
			</div>
			
			<h2>로그인</h2>
			<br>
			<form name="memberLoginForm" action="${contextPath }/member/memberLogin" method="post">
				<input type="text" name="loginId" id="loginId" placeholder="아이디 입력" /><br>
				<input type="password" name="loginPassword" id="loginPassword" placeholder="비밀번호 입력"/><br>
				<button onclick="checkLogin()">로그인</button>
			</form>
			<br>
			<hr>
				<!--카카오 로그인 버튼 -->
				<a href ="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=dcac716d192c1c3d2508c1adc0dc6836&redirect_uri=http://localhost:8080/root/member/kakaoLogin">
					<img alt="" src="${contextPath }/resources/image/kakao_login_medium_narrow.png">
				</a>
				
			<hr>
			<a href="${contextPath }/member/signInForm">회원가입</a>
		</div>
		
		<div>
			<form name="logOut" action="${contextPath }/member/logOut">
				<input type="submit" value="로그아웃">
			</form>
		
		</div>
	</section>
</body>
</html>