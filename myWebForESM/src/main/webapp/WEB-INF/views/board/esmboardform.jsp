<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
	var now = new Date();
	var year = now.getFullYear();
	var currentDate = year + "/" + now.getMonth() + "/" + now.getDate();
	alert(currentDate);
</script>
<script src="${contextPath }/resources/js/formScript.js?v=<%=System.currentTimeMillis() %>" />
<script src="${contextPath }/resources/js/esmboardForm.js?v=<%=System.currentTimeMillis() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ESM 입력 폼</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
		<section>
			<h1> ESM 입력하기 </h1>
			<form action="${contextPath }/board/insertESM" method="post" name="eSMForm">
			
				날짜 : <input type="date" name="savedate" id="savedate" placeholder="입력날짜를 입력하세요"/><br><br>
				<!-- 현재 시간을 value 값으로 넣을 수 없을까? -->
				시각 : <input type="time" name="savetime" id="savetime" /><br><br>
				
				<!-- GPS 기능을 넣을 수는 없을까? -->
				위치 : <input type="text" name="place" id="place" placeholder="위치를 입력하세요" maxlength=""/><br><br>
				<!-- GPS 기능을 넣는다면 나만의 장소로 입력할 수 있으면 좋겠다 예) 역삼 코리아 IT 학원 : 학원, 용마산로.. : 집 처럼
				  -->
				  
				동행 : <input type="text" name="company" id="company" placeholder="누구와 함께 있는지를 입력하세요" maxlength="100"/><br><br>
				
				감정 : <input type="text" name="emotion" id="emotion" placeholder="감정 상태를 입력하세요" maxlength="100"/><br><br>
				
				이유 : <br><textarea rows="4" cols="50" name="reason" id="reason" placeholder="그 이유를 입력하세요" maxlength="200" ></textarea><br><br>
				
				내용 : <br><textarea rows="20" cols="150" name="content" id="content" placeholder="내용를 입력하세요" maxlength="3000" ></textarea><br><br>
				
				<!-- 차후 디자인 예쁘게 하기 -->
				<div class="label">
					<label for="happiness"><b>행복감</b></label>
					불행
					<datalist id="happinessList">
						<option value="1" label="1"></option>
						<option value="2" label="2"></option>
						<option value="3" label="3"></option>
						<option value="4" label="4"></option>
						<option value="5" label="5"></option>
					</datalist>
					<input type="range" list="happinessList"  name="happiness" id="happiness" min="1" max="5" step="1"/>
					행복
				</div>
				<br><br>
				
				<div class="label">
					<label for="concentration"><b>집중도</b></label>
					산만
					<datalist id="concentrationList">
						<option value="1" label="1"></option>
						<option value="2" label="2"></option>
						<option value="3" label="3"></option>
						<option value="4" label="4"></option>
						<option value="5" label="5"></option>
					</datalist>
					<input type="range" list="concentrationList"  name="concentration" id="concentration" min="1" max="5" step="1"/>
					집중
				</div>
				<br><br>
				
				<div class="label">
					<label for=""activeness""><b>능동성</b></label>
					수동
					<datalist id="activenessList">
						<option value="1" label="1"></option>
						<option value="2" label="2"></option>
						<option value="3" label="3"></option>
						<option value="4" label="4"></option>
						<option value="5" label="5"></option>
					</datalist>
					<input type="range" list="activenessList"  name="activeness" id="activeness" min="1" max="5" step="1"/>
					능동
				</div>
				<br><br>
				
				<div class="label">
					<label for="power"><b>강함</b></label>
					약함
					<datalist id="powerList">
						<option value="1" label="우울"></option>
						<option value="2" label="2"></option>
						<option value="3" label="3"></option>
						<option value="4" label="4"></option>
						<option value="5" label="행복"></option>
					</datalist>
					<input type="range" list="powerList"  name="power" id="power" min="1" max="5" step="1"/>
					강함
				</div>
				<br><br>
				이름 : <input type="text" name="id" value="${sessionScope.id }" placeholder="아이디를 입력하세요"/><br><br>
			</form>
			<button onclick="checkESMBoard()">제출하기</button>
		</section>
	<c:import url="../default/footer.jsp"/>
</body>
</html>
