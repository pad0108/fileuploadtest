<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>boardList</h1>
	<table border="1">
		<tr>
			<th>board_id</th>
			<th>board_title</th>
			<th>boardfile</th>
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr>
				<td>${b.boardId}</td>
				<td>
					<a href="${pageContext.request.contextPath}/boardOne/${b.boardId}">
						${b.boardTitle}
					</a>
				</td>
				<td>
					<c:forEach var="bf" items="${b.boardfile}">
						<div>
							<a href="${pageContext.request.contextPath}/upload/${bf.boardfileName}">${bf.boardfileName}</a>
						</div>
					</c:forEach>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/removeBoard?boardId=${b.boardId}">삭제</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/modifyBoard/${b.boardId}">수정</a>
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
</body>
</html>