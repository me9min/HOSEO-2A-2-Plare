<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오로그인테스트</title>
</head>
<body>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
    </c:if>
</body>
</html>