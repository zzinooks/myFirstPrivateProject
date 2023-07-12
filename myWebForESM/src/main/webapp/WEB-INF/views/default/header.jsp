<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	margin: 0 auto;
	background-color: #f2f0f0;
	font-family: "맑은 고딕", sans-serif;
	font-size: 12px;
	color: black;
	width:1200px;
}

.clear::after {
	content: "";
	display: block;
	clear:both;
}

li {
	list-style: none;
 }

a {
	text-decoration: none;
}

/* logo */
#logo {
	float: left;
	padding: 30px 0 30px 30px;
	
}

/* top_menu */
#top_menu {
	float: right;
	margin: 30px 20px 0 0;
}

#top_menu li {
	display: inline;
	margin-right: 2px;
}

#top_menu li a {
	color: #333333;
}

#top_menu li a:hover {
	text-decoration: underline;
	font-weight: bold;
}

/* gnb */
#gnb ul {
	height: 40px;
	font-size: 20px;
	background-color: #696969;
	text-align: center;
	padding-top: 15px;
}

#gnb li {
	display: inline;
	margin: 0 50px;
}

#gnb ul li a {
	color: white;
	font-weight: bold;
}

#gnb ul li a:hover {
	text-decoration: underline;
}

/* aside */
aside {
	border: 1px solid green;
	float: left;
	top: 60px;
	bottom: 0;
	width: 200px;
	background-color: #333333;
	z-index: 1000;
}

aside h1 {
	color: white;
	padding: 10px 0 10px 20px;
}

aside > ul {
	width: 200px;
}

aside > ul > li > a {
	display: block;
	color: white;
	padding: 10px 0 10px 20px;
}

aside > ul > li > a:hover {
	background-color: silver;
}

/* section */
section {
	/* border: 1px solid blue; */
	float: right;
	width: 996px;
	margin-left: 1px;
}

article {
	margin: 10px;
	padding: 30px;
	background-color: white;
}



</style>
</head>
<body>
	<div id="logo">
		<a href="${contextPath }/member/index"><img src="${contextPath }/resources/image/logo.gif"></a>
	</div>
	<div id="top_menu">
		<ul>	
			<li>
				<c:if test="${user.id == null }"> <a href="${contextPath }/member/login">로그인</a> | </c:if>
				<c:if test="${user.id != null }"> <a href="${contextPath }/member/logOut"">로그아웃</a> | </c:if>
			</li>
			<li><a href="${contextPath }/member/signInForm">회원가입</a> | </li>
			<li><a href="#">마이페이지</a> | </li>
			<li><a href="#">주문배송 조회</a> | </li>
			<li><a href="#">장바구니</a> | </li>
			<li><a href="#">이용안내</a> | </li>
			<li><a href="#">고객센터</a> </li>
		</ul>
	</div>
	<div class="clear"></div>
	<div id="gnb">
		<ul>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">Q / A</a></li>
			<li><a href="#">공지사항</a></li>
			<li><a href="#">고객센터</a></li>
		</ul>
	</div>
	
	<!-- <div class="clear"></div>-->
	<div id="content_wrap">
		<aside>
			<h1></h1>
			<ul>
				<li><a href="#">ESM<br>(Experience Sampling Method)</a></li>
				<li><a href="#">4 Question for Studying</a></li>
				<li><a href="#">게시판</a></li>
				<li><a href="#">menu - 4</a></li>
			</ul>
		</aside>
	</div>
	<!--<div class="clear"></div> -->
</body>
</html>