<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 확인</title>
</head>
<body>
<button onclick="test()">선택창(confirm) 발생</button>
<script type="text/javascript">
function del() {
  if (confirm("정말 삭제하시겠습니까?"))
    list_ok.submit();
 }
</script>
</body>
</html>