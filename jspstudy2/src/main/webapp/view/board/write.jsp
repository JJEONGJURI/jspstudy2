<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/board/write.jsp
	1. 파라미터값 Board 객체에 저장. boardid 파라미터가 없으면 1로 설정하기
		MultipartRequest 객체 사용
	2. num 프로퍼티를 db 등록된 최대 num 값+1로 설정하기
	3. db의 board 테이블에 등록
		등록성공 : list.jsp 페이지 이동
		등록실패 : 메세지 출력. writeForm.jsp 페이지 이동
 --%>
	<script>
	if(${dao.insert(board)}) {
		response.sendRedirect("${list}");
	} else {
		alert("게시물 등록 실패")
		location.href="${writeForm}"
	</script>

	