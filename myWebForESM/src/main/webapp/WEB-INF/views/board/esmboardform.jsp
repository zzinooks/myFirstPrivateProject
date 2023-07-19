<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script src="${contextPath }/resources/js/formScript.js" />

<style>
	datalist {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            writing-mode: horizontal-tb;
            width: 100%;
            }

        option {
            padding: 0;
        }

        .range-wrap {
            position: relative;
            margin: 0 auto 3rem;
        }
        .slider-label {
            position: relative;
            margin: 0 auto 3rem;
        }
        .range {
            width: 500px;
        }
        .bubble {
            background: rgb(12, 83, 163);
            color: white;
            padding: 4px 12px;
            position: absolute;
            border-radius: 4px;
            left: 50%;
            bottom: 48px;
            transform: translateX(-50%);
        }
        .bubble::after {
            content: "";
            position: absolute;
            width: 2px;
            height: 2px;
            background: rgb(176, 167, 218);
            bottom: -2px;
            left: 50%;
        }

        /* body {
            margin: 2rem;
        } */
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ESM 입력 폼</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
		<section>
			<form action="" method="post" name="eSMForm">
				<!-- maxlength 넣기 -->
				<!-- 현재 시간을 value 값으로 넣을 수 없을까? -->
				<input type="time" name="savetime" id="savetime" /><br>
				
				<!-- GPS 기능을 넣을 수는 없을까? -->
				<input type="text" name="place" id="place" placeholder="위치를 입력하세요" maxlength=""/><br>
				<!-- GPS 기능을 넣는다면 나만의 장소로 입력할 수 있으면 좋겠다 예) 역삼 코리아 IT 학원 : 학원, 용마산로.. : 집 처럼
				  -->
				  
				<input type="text" name="company" id="company" placeholder="누구와 함께 있는지를 입력하세요" maxlength="100"/><br>
				
				<input type="text" name="emotion" id="emotion" placeholder="감정 상태를 입력하세요" maxlength="100"/><br>
				
				<input type="textarea" name="reason" id="reason" placeholder="그 이유를 입력하세요" maxlength="200"/><br>
				
				<input type="textarea" name="content" id="content" placeholder="내용를 입력하세요" maxlength="3000"/><br>
				
				<!-- datalist로 구현하기 https://stackoverflow.com/questions/75666216/html-range-slider-with-unevenly-spaced-datalist-values -->
				<div class="range-wrap">
					<label class="slider-label" for="happiness">행복도</label>
					<output class="bubble"></output>
					<input  calss="range" list="happinessList" type="range" name="happiness" id="happiness" min="1" max="5" step="1"/>
					<datalist id="happinessList">
						<option value="1" label="우울">
						<option value="2">
						<option value="3">
						<option value="4">
						<option value="5" label="행복">
					</datalist>
				</div>
				<br><br>
				
				
				<input type="text" name="concentration" id="concentration" placeholder="집중도를 입력하세요"/><br>
				
				<input type="text" name="activeness" id="activeness" placeholder="능동성를 입력하세요"/><br>
				
				<input type="text" name="power" id="power" placeholder="강하다약하다를 입력하세요"/><br>
				
				<input type="text" name="savedate" id="savedate" placeholder="입력날짜를 입력하세요"/><br>
				
				<input type="text" name="id" vale="${sessionScope.id }" placeholder="아이디를 입력하세요"/><br>
				
				
			</form>
		</section>
	<c:import url="../default/footer.jsp"/>
</body>
</html>