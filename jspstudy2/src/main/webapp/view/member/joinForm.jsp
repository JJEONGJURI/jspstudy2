<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy2/src/main/webapp/view/member/joinForm.jsp --%>
<!DOCTYPE html>
<html>
<head>


<script type="text/javascript">
   function input_check(f) {
	   if(f.id.value.trim() == "") {
		   alert("아이디를 입력하세요")
		   f.id.focus()
		   return false;
	   }
	   if(f.pass.value.trim() == "") {
		   alert("비밀번호를 입력하세요")
		   f.pass.focus()
		   return false;
	   }
	   if(f.name.value.trim() == "") {
		   alert("이름을 입력하세요")
		   f.name.focus()
		   return false;
	   }
	   return true;
   }
   function win_upload() {
	   var op = "width=500, height=500, left=50,top=150";
	   open("pictureForm","",op);
   } 
   function idchk() {
	   if (document.f.id.value == '') {
		   alert("아이디를 입력하세요")
		   f.id.focus()
	   } else {
	     let op = "width=500,height=200,left=50,top=150"
	     open("idchk?id="+document.f.id.value,"",op)
	   }
   }

</script>






<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="join" method="post" name="f" onsubmit="return input_check(this)">
<input type="hidden" name="picture" value="">
<div class="container">
	<h2 id="center">회원가입</h2>
	<div class="row">
		<div class="col-3 bg-light" id="center"> <%--컬럼3개 => 컬럼12개중 3개사용 --%>
			<img src="" width="95%" height="200" id="pic"><br>
			<font size="1"><a href="javascript:win_upload()">사진등록</a></font>
		</div>
		<div class="col-9"> <%--컬럼 9개 => 12개중 9개사용 --%>
			<div class="form-group">
				<label for="id">아이디:</label><input type="text" class="form-control" name="id" id="id">
				<button type="button"  class="btn btn-dark" onclick="idchk()">중복체크</button>
				<br>
				<label for="pwd">비밀번호:</label><input type="password" class="form-control" name="pass" id="pwd">
				<label for="name">이름:</label><input type="text" class="form-control" name="name" id="name">
				<label for="gender">성별:</label>
					<label class="radio-inline"></label> <%--radio-inline: 한 라인에 남, 여 다 넣음 --%>
						<input type="radio" name="gender" checked value="1">남
					<label class="radio-inline"></label>
						<input type="radio" name="gender" value="2">여
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="tel">전화번호</label>
			<input type="text" class="form-control"	name="tel" id="tel">
	</div>
	<div class="form-group">
		<label for="email">이메일</label>
			<input type="text" class="form-control"	name="email" id="email">
	</div>
	<div id="center" style="padding:3px;">
		<button type="submit" class="btn btn-dark">회원가입</button>
		<button type="reset" class="btn btn-dark">다시작성</button>
	</div>
</div>
</form>
</body>
</html>