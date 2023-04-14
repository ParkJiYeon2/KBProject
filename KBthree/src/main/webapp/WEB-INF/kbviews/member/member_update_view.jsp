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
			alert("회원 (${memberDTO.id}) 아이디의 정보를 수정했습니다.")
			location.href="./MemberSelect"
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("회원정보수정이 완료되었습니다.")
			location.href="./MemberSelectDetail?id=${memberDTO.id}";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>