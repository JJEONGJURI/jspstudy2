<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--/jspstudy2/src/main/webapp/view/board/list.jsp
	1. 한페이지당 10건의 게시물을 출력하기.
		pageNum 파라미터값을 저장 => 없는 경우는 1로 설정하기.
	2. 최근 등록된 게시물이 가장 위에 배치함.
	3. db에서 해당 페이지에 출력될 내용을 조회하여 화면에 출력.
			게시물을 출력부분.
			페이지 구분 출력 부분
	4. 페이지별 게시물번호 출력하기(boardnum)
	5. 첨부파일 등록하면 글제목 앞에 @ 표시하기  없으면 공백3개
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록 보기</title>
<script type="text/javascript">
	function listsubmit(page) {
		f = document.sf; //검색 form 태그
		f.pageNum.value=page;
		f.submit();
	}
</script>
</head>
<body>
	<div class="w3-container">
		<h2 class="w3-center">${boardName}</h2>
		<div class = "w3-container w3-center">
		<form action="list?boardid=${boardid}" method="post" name="sf">
			<input type="hidden" name="pageNum" value="1"> <!-- 페이지 값 1로넣어? -->
			<select class="w3-select" name="column">
				<option value="">선택하시오</option>
				<option value="writer">글쓴이</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="title,writer">제목+작성자</option>
				<option value="writer,content">작성자+내용</option>
				<option value="title,writer,content">제목+작성자+내용</option> <!-- mybatis 에서 $표시로 사용가능??.. -->
				<script type="text/javascript">
					document.sf.column.value='${param.column}'
				</script>
			</select>
			<input class="w3-input" type="text"
				placeholder="Search" name="find" value="${param.find}"> <!-- 검색끝나도 계속적혀있는이유 -->
			<button class="btn btn-border" type="submit">Search</button>
		</form>
		</div>
		<p>
		<table class="w3-table-all">
			<c:if test="${boardcount == 0}">
				<%--화면에 등록된 게시물이 없는 경우 --%>
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${boardcount > 0 }">
				<%--등록된 게시글이 있는 경우 --%>
				<tr>
					<td colspan="5" style="text-align: right">글개수:${boardcount}</td>
				</tr>
				<tr>
					<th width="8%">번호</th>
					<th width="50%">제목</th>
					<th width="14%">작성자</th>
					<th width="17%">등록일</th>
					<th width="11%">조회수</th>
				</tr>
				<%--크기를 %로 안하면 이상해짐 --%>
				<c:forEach var="b" items="${list}">
					<%--게시글조회 시작 --%>
					<%--
	화면에 출력할 조회번호 수정하기
	boardnum 변수 사용.
		1페이지 : boardcount 시작. 레코드 출력마다 -1씩 해서 출력
				boardcount - (pageNum -1) * limit
		2페이지 : boardcount-10
		3페이지 : boardcount-20
		
 --%>
					<tr>
						<td>${boardnum}</td>
						<c:set var="boardnum" value="${boardnum -1}" />
						<td style="text-align: left">
							<%-- 첨부파일 @로 표시하기 --%> <c:if test="${!empty b.file1}">
								<a href="../upload/board/${b.file1}">@</a>
							</c:if> <c:if test="${empty b.file1}">
								&nbsp;&nbsp;&nbsp;
							</c:if> <%-- 답글의 level 만큼 들여쓰기 --%> <c:if test="${b.grplevel >0}">
								<c:forEach var="i" begin="1" end="${b.grplevel}">
 									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 								</c:forEach> └ <%--ㅂ 한자 --%>
							</c:if> <a href="info?num=${b.num}">${b.title}</a> <%-- 댓글 갯수 badge 로 표현 --%>
							<c:if test="${b.commcnt >0}"> <%--댓글 있는 경우만 뱃지 단다 --%> 
								<a href="info?num=${b.num}#comment}"> <span
									class="w3-badge w3-blue w3-tiny">${b.commcnt}</span>
								</a>
							</c:if> <%-- 댓글 갯수 badge로 표현 끝 --%>
						</td>
						<td>${b.writer}</td>
						<%-- 오늘등록된 게시물 날짜 format대로 출력하기 --%>
						<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="t" />
						<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd" var="r" />
						<td><c:if test="${t==r}">
								<fmt:formatDate value="${b.regdate}" pattern="HH:mm:ss" />
							</c:if> <c:if test="${t != r}">
								<%--당일 등록게시물 아님 --%>
								<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd HH:mm" />
							</c:if></td>
						<td>${b.readcnt}</td>
					</tr>
				</c:forEach>
				<%-- 페이지 처리하기 --%>
				<tr>
					<td colspan="5" style="text-align: center;">
						<%--<a href="list.jsp?pageNum=<%=pageNum -1 %>"> 앞에 페이지로 갈수있게 함 --%>
						<c:if test="${pageNum <= 1}">[이전]</c:if> 
						<c:if test="${pageNum > 1}">
							<a href="javascript:listsubmit(${pageNum-1})">[이전]</a>
						</c:if> <%--현재페이지 제외한 페이지에 하이퍼링크 걸기 --%> <c:forEach var="a"
							begin="${startpage}" end="${endpage}">
							<c:if test="${a== pageNum}">[${a}]</c:if>
							<c:if test="${a!= pageNum}">
								<a href="javascript:listsubmit(${a})">[${a}]</a>
							</c:if>
						</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
							test="${pageNum < maxpage}">
							<a href="javascript:listsubmit(${pageNum+1})">[다음]</a>
						</c:if>
					</td>
				</tr>
			</c:if>
			<%--게시물이 존재하는 경우 끝--%>
			<tr>
				<td colspan="5" style="text-align: right">
					<%--admin으로 로그인한 경우만 공지사항에 글쓰기 가능하다. --%> <c:if
						test="${boardid != '1' || sessionScope.login == 'admin'}">
						<p align="right">
							<a href="writeForm">[글쓰기]</a>
						</p>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
