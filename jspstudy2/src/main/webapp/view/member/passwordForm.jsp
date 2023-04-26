<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy2/src/main/webapp/view/member/passwordForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<script>
	function inchk(f) {
		if(f.pass.value == ""){
			alert("비밀번호를 입력하세요.")
			f.pass.focus()
			return false;
		}
		if(f.chgpass.value == ""){
			alert("변경비밀번호를 입력하세요.")
			f.chgpass.focus()
			return false;
		}
		if(f.chgpass2.value == ""){
			alert("변경비밀번호재입력을 입력하세요.")
			f.chgpass2.focus()
			return false;
		}if(f.chgpass.value != f.chgpass2.value) {
			alert("변경비밀번호 와 변경비밀번호재입력이 다릅니다.");
			f.chgpass2.value="";
			f.chgpass2.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div class="container">
<form action="password" method="post" name="f" onsubmit="return inchk(this)">
	<%--1.모든 입력등록. 2.변경비밀번호==변경비밀번호재입력 동일 --%>
	<h2 id="center">비밀번호 변경</h2>
	<table class="table table-hover">
	<tr><th>현재비밀번호</th>
		<td><input type="password" name="pass"></td></tr>
	<tr><th>변경비밀번호</th>
		<td><input type="password" name="chgpass"></td></tr>		
	<tr><th>변경비밀번호재입력</th>
		<td><input type="password" name="chgpass2"></td></tr>
	<tr><td colspan="2" id="center">
		<input type="submit" value="비밀번호변경"> <!-- submit 누르면 password로 감 -->
		<input type="reset" value="초기화">
	</td></tr>		
	</table>
</form>
</div>
</body>
</html>