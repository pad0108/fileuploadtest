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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#addBtn').click(function(){
		let html = '<div><input type="file" name="boardfile" class="boardfile"></div>';
		$('#fileinput').append(html);
	});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	})

	$('#submitBtn').click(function(){
		let ck = true;
		$('.boardfile').each(function(index, item){
			console.log($(item).val());
			if($(item).val() == '') {
				ck = false;
			}
		})
		if(ck == false) { // if(ck)
			alert('선택하지 않은 파일이 있습니다');
		} else {
			$('#fileuploadFrom').submit();
		}
	});
});
</script>
</head>
<body>
<div class="container">
	<form id="fileuploadFrom" method="post" 
		  enctype="multipart/form-data" 
		  action="${pageContext.request.contextPath}/modifyBoard">
		<table class="table">
			<tr>
				<td>board_id</td>
				<td><input type="text" name="boardId" class="form-control"readonly="readonly" value="${board.boardId}"></td>
			</tr>
			<tr>
				<td>board_title</td>
				<td><input type="text" name="boardTitle" class="form-control" value="${board.boardTitle}"></td>
			</tr>
			<tr>
				<td>board_content</td>
				<td><textarea name="boardContent" class="form-control" rows="10" cols="50" style="resize:none;" >${board.boardContent}</textarea></td>
			</tr>
			<c:forEach var="bf" items="${board.boardfile}">
				<tr>
					<td>
						첨부파일
					</td>				
					<td>
						<a href="${pageContext.request.contextPath}/upload/${bf.boardfileName}">${bf.boardfileName}</a>
					<c:if test="${not empty bf.boardfileName}">
					<a href="${pageContext.request.contextPath }/removeFile/${board.boardId}/${bf.boardfileId}/${bf.boardfileName}"style="float:right;" class="btn btn-outline-danger"> 삭제</a>
					</c:if>
					</td>		
				</tr>
			</c:forEach>
			<tr>
				<td>board_file</td>
				<td>
					<div>
						<button type="button" id="addBtn" class="btn btn-outline-info">파일추가</button>
						<button type="button" id="delBtn" class="btn btn-outline-dark">파일삭제</button>
					</div>
					<div id="fileinput">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" id="submitBtn" style="float:right;" class="btn btn-outline-primary">submit</button>
					<a href="${pageContext.request.contextPath}/boardOne/${board.boardId}"  style="float:right; margin-right:5px;" class="btn btn-outline-dark">뒤로가기</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>