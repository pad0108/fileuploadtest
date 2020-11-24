<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 구글 css 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100&display=swap" rel="stylesheet">
<style type="text/css">
td{
	font-family: 'Noto Sans JP', sans-serif;
}
tr{
	font-family: 'Noto Sans JP', sans-serif;
}
button{
	font-family: 'Noto Sans JP', sans-serif;
}
</style>
</head>
<body>
<div class="container">
	<h1>boardList</h1>
	<a href="${pageContext.request.contextPath}/addBoard" style="float:right; margin-bottom:5px;" class="btn btn-primary">글 쓰기</a>
	<table class="table table-striped" style="table-layout:fixed; width:100%;">
		<tr>
			<th style="width:10%;">번호</th>
			<th style="width:20%;">제목</th>
			<th style="width:70%;">내용</th>
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr>
				<td>${b.boardId}</td>
				<td>
					<a href="${pageContext.request.contextPath}/boardOne/${b.boardId}">
						${b.boardTitle}
					</a>
				</td>
				<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
					${b.boardContent}
				</td>
			</tr>
		</c:forEach>
	</table>
		<c:if test="${currentPage>1}">
			<a href="${pageContext.request.contextPath}/boardList/${currentPage-1}">이전</a>
		</c:if>
		<c:if test="${currentPage<lastPage}">
			<a href="${pageContext.request.contextPath}/boardList/${currentPage+1}">다음</a>
		</c:if>
</div>
</body>
</html>