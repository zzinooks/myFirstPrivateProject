

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ESM - Table 보기</title>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<section>
		<h1> ESM-Table page</h1>
		<!-- 다른 형태의 ESM View 페이지로 이동할 datalist -->
		<div class="selectView">
			<select name="selectView">
				<option label="table">table</option>
				<option label="graph">graph</option>
				<option label="line">line</option>
			</select>
		</div>
		<!-- 테이블  -->
		<div class="esmTable">
			<table>
				<thead>
					<tr>
						<th> No. </th>
						<th> date </th>
						<th> time </th>
						<th> place </th>
						<th> company </th>
						<th> feeling </th>
					</tr>
				</thead>
				<tbody>
					<c:when test="${empty eSMBoardList }">
						<tr>
							<td colspan="6">등록된 ESM 기록이 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${eSMBoardList }">
							<tr>
								<td>${dto.write_no }</td>
								<td>${dto.savedate }</td>
								<td>${dto.savetime }</td>
								<td>${dto.place }</td>
								<td>${dto.company }</td>
								<td>
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
										<input type="range" list="happinessList"  name="happiness" id="happiness" min="1" max="5" step="1" value=${dto.happiness } readonly="readonly"/>
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
										<input type="range" list="concentrationList"  name="concentration" id="concentration" min="1" max="5" step="1" value=${dto.concentration } readonly="readonly"/>
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
										<input type="range" list="activenessList"  name="activeness" id="activeness" min="1" max="5" step="1" value=${dto.activeness } readonly="readonly"/>
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
										<input type="range" list="powerList"  name="power" id="power" min="1" max="5" step="1" value=${dto.power } readonly="readonly"/>
										강함
									</div>
									<br><br>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					<tr>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 페이징  -->
		<!-- 검색 페이징 -->
		<!-- 검색 기능 넣을 곳  -->
	</section>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>