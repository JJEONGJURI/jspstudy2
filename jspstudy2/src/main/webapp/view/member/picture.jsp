<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--/jspstudy2/src/main/webapp/view/member/picture.jsp
	1. opener 화면에 결과 전달 => javascript
	2. 현재 화면 close() => javascript
--%>
<script type="text/javascript">
	img = opener.document.getElementById("pic"); //id="pic"인 태그 선택
	//img 태긔의 src 속성
	//  "/ 절대경로
	// D:\20230125\html\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspstudy2\picture 실제경로
	img.src = "/jspstudy2/picture/${fname}";
	// <input type="hidden" name="picture" value="">
	opener.document.f.picture.value="${fname}";
	self.close(); //현재창 닫기
</script>
