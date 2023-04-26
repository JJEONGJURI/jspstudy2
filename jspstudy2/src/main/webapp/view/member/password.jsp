<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<%--/jspstudy1/src/main/webapp/model1/member/password.jsp
	1. 파라미터 저장 (pass,chgpass)
	2. 로그인한 사용자의 비밀번호 변경만 가능.=> 로그인부분 검증
		로그아웃상태 : 로그인하세요 메세지 출력후 
		opener 창을 loginForm.jsp 페이지로 이동. 현재페이지 닫기
	3. 비밀번호 검증 : 현재 비밀번호로 비교
		비밀번호 오류 : 비밀번호 오류 메세지 출력 후 현재페이지를 passwordForm.jsp 로 이동
	4. db에 비밀번호 수정
		boolean MemberDao.updatePass(id,변경비밀번호)		
 		- 수정 성공 : 성공 메세지 출력 후 (로그아웃 되었습니다. 변경된 비밀번호로 다시 로그인 하세요 
 					//opener 페이지 info.jsp 로 이동. 현재 페이지 닫기
 					로그아웃 후 opener 페이지 loginForm.jsp로 이동. 현재 페이지 닫기
 		- 수정 실패 : 실패 메세지 출력 후 opener 페이지 updateForm.jsp 로 이동. 현재 페이지 닫기
 --%>

 <script>
	alert("${msg}")
 	if(${opener}) { //opener true
 		opener.location.href="${url}"
 		self.close()
 	} else {
 		location.href="${url}"
 	}
 
 </script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>