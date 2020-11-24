<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form method="post" action="${pageContext.request.contextPath}/login">
		<div>
			아이디:<input type="text" name="userId">
		</div>
		<div>
			비밀번호:<input type="password" name="pwId">
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>

</body>
</html>