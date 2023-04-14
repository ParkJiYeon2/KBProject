<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국민은행 회원정보</title>
<link rel="shortcut icon" href="./img/KB_SymbolMark.png" type="image/x-icon">
</head>
<body>
<c:choose>
	<c:when test="${sessionScope.id == 'admin'}">
<script type="text/javascript">
alert("${memberDTO.id}님의 비밀번호를 변경하였습니다.")
location.href="./MemberSelectDetail?id=${memberDTO.id}";
</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("비밀번호를 변경하였습니다.")
			location.href="./MemberSelectDetail?id=${sessionScope.id}";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>