<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!--  
	# kakao developers 사용법
	 - 위치 : 도구 > JS SDK 데모 > 카카오 로그인 > 사용자 정보 가져오기
	 - URL : https://developers.kakao.com/tool/demo/login/userme
	 - 해당 코드를 복붙한다.
	 - redirectUri: 인가 코드를 전달 받을 서비스의 URI - 내 애플리케이션에서 설정 가능
	 - client_id : 앱 REST API 키 [내 애플리케이션] > [앱키] 에서 확인 가능
	 
	# 복붙시 참고한 영상
	 - REST API가 뭔가요?
	 - URL : https://www.youtube.com/watch?v=iOueE9AXDQQ
	 
	# 개념
	 - API
		: 지정된 형식으로 요청, 명령을 받을 수 있는 수단
		  소프트웨어가 소프트웨어에게 요청하여 기능을 사용하는 것
	 - uri
	 	: 자원을 형식과 함께 같이 넣는 방식
	 	  ?자원형식=값& ...  예)http://...?id=jinwook
	 - 	CURD
	 	post : Create
	 	get : Read
	 	put : Update - 주로 정보를 모두 바꿀 때
	 	patch : Update - 주로 부분만 변경할 때
	 	
	 - RESTful API 
	 	: uri로 요청 보낼 때 개발자 사이에 널리 지켜지는 약속
	 	 형식으로서 언어로 구애받지 않음. HTTP만 사용한다면 가능!
	 
	 - HTTP(HyperText Transfer Protocol)
	 	: HTTP 규약에 따라 신호를 전송		
	 

-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 테스트 페이지</title>
<!--  
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
  integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
  
<script>
  Kakao.init('6b3394714642914257ddf54484bec93d'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/root/member/kakaoLoginTest',
    });
  }
</script>
</head>
<body>
	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  		<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    	alt="카카오 로그인 버튼" />
	</a>
	<p id="token-result"></p>

</body>
-->
</head>
<body>
	<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=dcac716d192c1c3d2508c1adc0dc6836&redirect_uri=http://localhost:8080/root/member/kakaoLogin">
		카카오톡으로 간편 로그인
	</a>
</body>
</html>