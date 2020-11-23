<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addBoard</title>
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
	<h1>자료실 입력</h1>
	<form id="fileuploadFrom" method="post" 
		  enctype="multipart/form-data" 
		  action="${pageContext.request.contextPath}/addBoard">
		<table border="1">
			<tr>
				<td>board_title</td>
				<td><input type="text" name="boardTitle"></td>
			</tr>
			<tr>
				<td>board_content</td>
				<td><textarea name="boardContent" rows="3" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>board_file</td>
				<td>
					<div>
						<button type="button" id="addBtn">파일추가</button>
						<button type="button" id="delBtn">파일삭제</button>
					</div>
					<div id="fileinput">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" id="submitBtn">submit</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>