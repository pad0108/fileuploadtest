<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border = "1">
		<tr>
			<td>board_id</td>
			<td>${board.boardId}</td>
		</tr>
		<tr>
			<td>board_title</td>
			<td>${board.boardTitle}</td>
		</tr>
		<tr>
			<c:forEach var="bf" items="${board.boardfile}">
				<td>board_file</td>
				<td>
					<a href="${pageContext.request.contextPath}/upload/${bf.boardfileName}">${bf.boardfileName}</a>
				</td>		
			</c:forEach>
		</tr>
		<tr>
			<td>board_Content</td>
			<td>${board.boardContent}</td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/boardList/1">뒤로가기</a>
	<a href="${pageContext.request.contextPath}/modifyBoard/${board.boardId}">수정</a>
	
</body>
</html>