<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /jspstudy2/src/main/webapp/view/member/info.jsp
	1. id 파라미터값을 조회
	2. 로그인 상태 검증
		- 로그아웃상태 : '로그인하세요' 메세지 출력 후 loginForm.jsp 페이지 호출
		- 로그인 상태 : 
			- 다른 id 조회시(관리자 제외) : '내 정보 조회만 가능합니다.' 메세지 출력 후 main.jsp 호출
	3. db에서 id에 해당하는 데이터 조회하기
	4. 조회된 내용 화면 출력하기
	123 은 컨트롤러가 함 
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>
</head>
<body>
<div class="container">
<h2 id="center">회원 상세 정보</h2>
<table class="table table-hover"><%--table table-hover : 색깔 바뀜 --%>
<tr><td rowspan="6" width="30%">
<img src="/jspstudy2/picture/${mem.picture}" width="200" height="210"></td>
<th width="20%">아이디</th><td>${mem.id}</td></tr>
<tr><th>이름</th><td>${mem.name}</td></tr>
<tr><th>성별</th><td>${mem.gender==1?"남":"여"}</td></tr>
<tr><th>전화</th><td>${mem.tel}</td></tr>
<tr><th>이메일</th><td>${mem.email}</td></tr>
<tr><td colspan="2" id="center">
	<a href = "updateForm?id=${mem.id}">수정</a>
	<c:if test="${param.id != 'admin'}">
	<a href = "deleteForm?id=${mem.id}">탈퇴</a>
    </c:if>
</td></tr>
</table>
</div>
</body>
</html>
