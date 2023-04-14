<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <c:if test="${empty sessionScope.id}"> --%>
<!-- <script type="text/javascript"> -->
<!-- location.href="./LoginView.me" -->
<!-- </script> -->
<%-- </c:if> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<link rel="shortcut icon" href="./img/KB_SymbolMark.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./css/global_jin.css">
<link rel="stylesheet" type="text/css" href="./css/all.min.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script type="text/javascript">
  $(function() { 
 $("#limit").change(function() { 
  location.href="./MemberSelect?limit="+$(this).val();
   }); 
   if ("${!empty limit}") { 
  $("#limit").val("${limit}").prop('selected', true); 
  };
 });
</script>
</head>
<body>
 <nav class="navbar navbar-expand-md bg-dark navbar-dark text-white">
  <div class="container">
   <div class="col-md-6">
   <div class="img">
<img src="./img/KB_SymbolMark.png" style="width: 25px; height: 25px;">
</div>
    <h1>
     국민 은행
    </h1>
   </div>
   <div id="toggle" class="navbar-collapse collapse">
    <ul class="navbar-nav">
    </ul>
    <ul class="navbar-nav ml-auto">
     <li class="nav-item dropdown mr-3">
      <c:if test="${!empty sessionScope.id}">
       <p class="nav-link dropdown-toggle" data-toggle="dropdown">
        <i class="fas fa-user mr-sm-1"></i>
        ${sessionScope.id} 님
       </p>
      </c:if>
      <div class="dropdown-menu">
       <c:choose>
        <c:when test="${!empty sessionScope.id}">
      <a class="dropdown-item" href="./PassUpdate?id=${sessionScope.id}"><i class="fas fa-user-tag"></i>비밀번호 변경</a>
        </c:when>
       </c:choose>
      </div>
      <c:choose>
       <c:when test="${empty sessionScope.id}">
        <li class="nav-item">
         <a href="./LoginMain" class="nav-link">
          <i class="fas fa-user-circle mr-sm-1"></i>
          로그인
         </a>
       </c:when>
       <c:otherwise>
        <li class="nav-item">
         <a href="./Logout" class="nav-link">
          <i class="fas fa-user-times mr-sm-1"></i>
          로그아웃
         </a>
       </c:otherwise>
      </c:choose>
    </ul>
   </div>
  </div>
 </nav> 
 <header id="main-header" class="py-2 bg-secondary"> </header>
 <section id="search" class="py-3 mb-3 bg-light">
  <div class="container">
   <div class="row col-md-12" style="margin-left: 140px;">   
    <div class="col-md-4 ml-auto">
    </div>
   </div>
  </div>
 </section>
 <section id="member">
  <div class="container">
   <div class="row" style="margin-left: -125px; margin-right: -125px;">
    <div class="col-md-12">
     <div class="card">
      <div class="card-header">       
       <h3 class="text-muted" style="margin-bottom: =0.5rem;"><i class="fas fa-users-cog mr-sm-1"></i>회원 목록
      </h3>
       <p align="right" style="margin-bottom: -0.6rem;">
        전체 회원:  ${count}명
       </p>  
      </div>
      <table class="table table-bordered">
       <thead class="thead-light">
        <tr class="text-center">
         <th>번호</th>
         <th>아이디</th>         
         <th>이름</th>          
         <th>이메일</th>
         <th>생일</th>
         <th>주소</th>
         <th>상세주소</th>               
         <th>전화번호</th>
        </tr>
       </thead>
       <tbody>
     <c:forEach var="list" items="${list}">
      <tr class="text-center">
       <td>${list.num}</td>
       <td><a href="./MemberSelectDetail?id=${list.id}">${list.id}</a></td>           
         <td> 
         <c:set var="now" value="<%=new java.util.Date( )%>"/>
         <fmt:formatDate var="nowDay" value="${now}" type="date" pattern="yyyy-MM-dd"/>
         ${list.name}</td>          
           <td>${list.email}@${list.domain}</td>
       <td>${list.birthday}</td>
       <td>${list.address}</td>
       <td>${list.detailAddress}</td>
       <td>${list.telecom}-${list.phonenum}-${list.phonenum2}</td>
      </tr>
     </c:forEach>
     <c:if test="${empty list}">    
     <tr><td colspan="8" align="center">등록된 회원이 없습니다.</td></tr> 
</c:if>
       </tbody>
      </table>      

      <nav class="ml-4">
	<div>
      <ul class="pagination justify-content-center">  
    <c:if test="${pageMaker.prev}">
     <li class="page-link"><a href="MemberSelect${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if>   
    
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
     <li class="page-link"><a href="MemberSelect${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>
      
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
     <li class="page-link"><a href="MemberSelect${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if>   
   </ul>
</div>
</nav>

      <nav class="navbar justify-content-end">
       <div class="btn-group">
        <button type="button" class="btn btn-outline-info mr-sm-1" onclick="location.href='./MemberInsert'">
         <i class="fas fa-user-edit mr-sm-1"></i>회원 등록
        </button>
       </div>
      </nav>
     </div>
    </div>
   </div>
  </div>
 </section>
  <footer id="main-footer" class="bg-secondary text-white mt-3 p-3">
  <div class="container">
   <div class="row">
    <div class="col">
     <p class="lead text-center">
     </p>
    </div>
   </div>
  </div>
 </footer>
</body>
</html>