<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국민은행 로그인</title>
<c:choose>
   <c:when test="${sessionScope.id == 'admin'}">
   <script type="text/javascript">
   location.href="./MemberSelect"
   </script>
      </c:when>
	<c:otherwise>
		<script type="text/javascript">			
			location.href="./MemberSelectDetail?id=${sessionScope.id}"
		</script>
	</c:otherwise>
</c:choose>
</head>
<body>
</body>
</html>