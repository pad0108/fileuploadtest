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
 .my-hr3 {
    border: 0;
    height: 2px;
    background: #000000;
  }
</style>
</head>
<body>
<div class="container">
	<h1>상세보기</h1>
	<div>
		<a href="${pageContext.request.contextPath}/boardList/1"class="btn btn-outline-dark" style="float: left;">뒤로가기</a>
		<a href="${pageContext.request.contextPath}/removeBoard/${board.boardId}" class="btn btn-outline-dark" style="float: right;">삭제</a>
		<a href="${pageContext.request.contextPath}/modifyBoard/${board.boardId}" class="btn btn-outline-primary" style="float: right;margin-right:5px;">수정</a>
	</div>
	<table class="table" style="width:100%; margin-top:10px;">
		<tr>
			<td style="width:10%;text-align:center;">${board.boardId}</td>
			<td style="width:90%;text-align:center;">${board.boardTitle}</td>
		</tr>
		<tr>
			<c:forEach var="bf" items="${board.boardfile}">
				<td colspan="2" style="text-align:right;">
					<a href="${pageContext.request.contextPath}/upload/${bf.boardfileName}">${bf.boardfileName}</a>
				</td>		
			</c:forEach>
		</tr>
		<tr>
			<td style="text-align:center;">내용</td>
			<td>
				<textarea class="form-control" rows="10" readonly="readonly" style="text-align:left; resize: none;">
					${board.boardContent}
				</textarea>
			</td>
		</tr>
	</table>
	<div>
		<h2>댓글</h2>
		<hr class="my-hr3">
	</div>
	<form action="${pageContext.request.contextPath}/addComment/${boardId}" method="post">
		<input type="hidden" name="boardId" value="${board.boardId}">
		<textarea name="commentContent" rows="7" cols="50"class="form-control" style="resize: none;"></textarea>
		<div style="text-align:right; margin-top:10px; margin-bottom:10px;">
		<button type="submit" class="btn btn-outline-primary">댓글 입력</button>
		</div>
	</form>
	<table class="table" style="width:100%; text-align:center;'">
		<c:forEach var="c" items="${board.commentList}">
			<c:if test="${!empty c.commentContent}">
				<tr>
					<td style="width:5%;">
						${c.commentId}
					</td>
					<td style="width:89%;">
						${c.commentContent}
					</td>
					<td style="width:6%;">
						<a href="${pageContext.request.contextPath}/removeComment/${c.commentId}/${c.boardId}"class="btn btn-sm btn-outline-dark">삭제</a>
					</td>			
				</tr>
			</c:if>
			<c:if test="${empty c.commentContent}">
				<tr>
					<td>
						현재 댓글이 없습니다.
					</td>		
				</tr>
			</c:if>
		</c:forEach>
	</table>
	
</div>	
</body>
</html>