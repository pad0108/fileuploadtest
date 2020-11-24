<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addBoard</title>
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
	<h1>자료실 입력</h1>
	<form id="fileuploadFrom" method="post" 
		  enctype="multipart/form-data" 
		  action="${pageContext.request.contextPath}/addBoard">
		<table class="table ">
			<tr>
				<td>제목</td>
				<td><input type="text" name="boardTitle" class="form-control"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="boardContent" rows="10" cols="50" class="form-control"></textarea></td>
			</tr>
			<tr>
				<td>파일 첨부</td>
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
					<button type="button" id="submitBtn" style="float:right;" class="btn btn-outline-success">submit</button>
					<a href="${pageContext.request.contextPath}/boardList/1"  style="float:right; margin-right:5px;" class="btn btn-outline-dark">뒤로가기</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>