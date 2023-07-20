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
		<!-- 로그인 되었을 시 화면 -->
		<c:if test="${user.id != null }">
			<h1>${user.id } 님 환영합니다~</h1>
			<p> 얏호 로그인 성공~!!</p>
		</c:if>
		
		<!-- 비로그인 시 화면 -->
		<c:if test="${user.id == null }">
			<h1> ESM 사이트에 오신 것을 환영 합니다</h1>
			<p>대다수의 서비스는 <b>로그인 후 사용</b>하실 수 있습니다</p>
			<a href="${contextPath }/member/login">로그인</a>
		</c:if>
		
		<br><br>
		<h3> ESM 이란? </h3>
		<p>  "몰입의 즐거움" 의 저자 미하이 칙센트 미하이가 몰입에 대해 연구하기 위해 사람들의 경험을 수집하기로 합니다. 
		     이때 경험을 수집하는 방법으로 만든 것이 ESM이라는 방법입니다. 
		     ESM을 통해 언제, 어디서, 누구와 함께 했는지 등의 정보와 함께
		     그 당시의 감정, 이유, 능동감 등을 기입함으로 자신의 경험을 체계적으로 수집할 수 있습니다.
		</p>
		<br><br>
		<h3> ESM을 활용하여 자신에 대해서 알아보아요 </h3>
		<p>
		 <br>
		 - 하루 중 어느 시간 대에 가장 집중력이 좋은지 알 수 있습니다
		 <br>
 		 - 어느 요일에 가장 자신이 활발한 지 알 수 있습니다
		 <br>
 		 - 기분이 좋지 않았던 날의 공통점을 이끌어 낼 수 있습니다
		 <br>
 		 - 어떤 활동을 할 때 능동적인지 알 수 있습니다  
 		</p>
		<!--  
		<c:if test="${user.id != null }">
			<a href="${contextPath }/member/logOut">로그아웃</a>
			<a href="${contextPath }/member/memberModifyForm">회원정보 수정</a>
			<a href="${contextPath }/member/memberDelete">회원정보 삭제</a>
		</c:if>
		<c:if test="${user.id == null }">
			<a href="${contextPath }/member/login">로그인</a>
		</c:if>
		-->
	</section>
	<c:import url="default/footer.jsp"></c:import>
</body>
</html>