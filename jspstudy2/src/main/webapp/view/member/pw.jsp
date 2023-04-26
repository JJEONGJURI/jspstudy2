<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/pw.jsp 
	1. 파라미터 저장.
	2. db에서 id,email과 tel 을 이용하여 pass값을 리턴
		pass = MemberDao.pwSearch(id,email,tel)
	3. 비밀번호 검증
		비밀번호 찾은 경우  : 화면에 앞 두자리는 **로 표시하여 화면에 출력. 닫기버튼 클릭시  현재 화면 닫기
		비밀번호 못찾은경우 : 정보에 맞는 비밀번호를 찾을 수 없습니다. 메세지 출력 후 현재 페이지를 pwForm.jsp로 페이지 이동.
--%>

		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>비밀번호찾기</title>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		</head>
		<body>
		<div class="container">
		<table class="table">
		  <tr>
		  	<th>비밀번호</th>
		    <td>**${pass}</td>
		  </tr>
		  <tr><td colspan="2">
		     <input type="button" value="닫기" onclick="self.close();">
		  </td>
		  </tr>
		</table>
		</div>
		</body>
		</html>
		