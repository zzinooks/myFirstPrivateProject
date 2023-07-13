<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script src="${contextPath }/resources/js/formScript.js" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 테스트 페이지</title>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
  integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
  
<script>
	Kakao.init('6b3394714642914257ddf54484bec93d'); // 사용하려는 앱의 JavaScript 키 입력
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope: 'profile_nickname, profile_image, account_email',
			success: function(authObj) {
				console.log(authObj);
				window.kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
						
					}
				});
				
			}
		})
	}
</script>
</head>
<body>
	<!-- javascript: 6b3394714642914257ddf54484bec93d -->
	<p>잉?</p>
	<a href="javascript:kakaoLogin()">
		<img alt="" src="${contextPath }/resources/image/kakao_login_medium_narrow.png"> 
	</a>
</body>
</html>