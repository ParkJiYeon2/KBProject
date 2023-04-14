<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인설트 뷰 화면</title>
<c:forEach var="list" items="${list}">
<c:if test="${list.num eq counselingDTO.num}">
<script type="text/javascript">
alert("입력하신 ${list.num}번의 상담 내용번호가 존재합니다. 다시 입력하세요");
location.href="./CounselingInsert";
</script>
</c:if>
</c:forEach>
</head>
<body>
<script type="text/javascript">
alert("입력하신 ${counselingDTO.subject}의 제목 상담 예약이 등록되었습니다.");
location.href="./CounselingSelect"
</script>
</body>
</html>