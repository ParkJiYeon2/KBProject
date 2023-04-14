<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.id}">
<script type="text/javascript">
location.href="./LoginMain"
</script>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>국민은행 회원정보</title>
<link rel="shortcut icon" href="./img/KB_SymbolMark.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./css/global_jin.css">
<link rel="stylesheet" type="text/css" href="./css/all.min.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" href="./css/bootstrap-datepicker.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script src="./js/validity3_jin.js" type="text/javascript"></script>
<script type="text/javascript">
 function memberDelete() {
  if (confirm("${memberDTO.name}님 회원을 탈퇴 하시겠습니까?")) {
   location.href="./MemberDelete?id=${memberDTO.id}"
  }
 }
 </script>
 <script type="text/javascript">
 function cancel() {
		if (confirm("정말로 취소하시겠습니까?")) {
			location.href="./MemberSelectDetail?id=${sessionScope.id}"
		}
	}
 </script>
</head>
<body>
 <nav class="navbar navbar-expand-md bg-dark navbar-dark text-white">
  <div class="container">    
    <div class="col-md-6">
    <div class="img">
<img src="./img/KB_SymbolMark.png" style="width: 25px; height: 25px;">
</div>
     <h1>비밀번호 변경</h1> 
    </div> 
   <div id="toggle" class="navbar-collapse collapse">   
    <ul class="navbar-nav">    
    </ul>
    <ul class="navbar-nav ml-auto">
     <li class="nav-item dropdown mr-3">    
       <c:if test="${!empty sessionScope.id}">
  <p class="nav-link dropdown-toggle" data-toggle="dropdown">
       <i class="fas fa-user mr-sm-1"></i> ${sessionScope.id} 님
         </p>
   </c:if>    
      <div class="dropdown-menu">       
       <c:choose>
     <c:when test="${!empty sessionScope.id}">    
      <a class="dropdown-item" href="./MemberUpdate?id=${sessionScope.id}"><i class="fas fa-user-tag"></i>회원정보수정</a>
     </c:when>     
    </c:choose>        
      </div>
      <c:choose>
    <c:when test="${empty sessionScope.id}">    
   <li class="nav-item">
      <a href="./LoginMain" class="nav-link">
       <i class="fas fa-user-circle mr-sm-1"></i>로그인
      </a>   
    </c:when>
    <c:otherwise>
   <li class="nav-item">
      <a href="./Logout" class="nav-link">
       <i class="fas fa-user-times mr-sm-1"></i>로그아웃
      </a>
    </c:otherwise>
   </c:choose>       
    </ul>
   </div>
  </div>
 </nav>
 <header id="main-header" class="py-2 bg-secondary"> </header>
 <section class="py-3 mb-3 bg-light">
  <div class="container">
   <div class="row col-md-12"></div>
  </div>
 </section>
 <section id="member">
  <div class="container">
   <div class="row">
    <div class="col-md-12">
     <div class="card">
      <div class="card-header">
       <h3 class="text-muted"><i class="fas fa-user-tag mr-sm-1"></i>비밀번호 변경</h3>
      </div>
      <div class="card-body">
     <form action="./PassUpdateView" method="post" id="signupForm" enctype="application/x-www-form-urlencoded">
        <fieldset>
        <div class="row pl-1 pr-1">
          <div class="col col-md-5">
         <div class="form-group row">
          <label for="id" class="col-4 col-form-label pr-0"><i class="fas fa-user-check mr-sm-1"></i>아이디</label>
          <div class="col-8 pl-0">
           <input type="text" name="id" id="id" class="form-control" value="${memberDTO.id}" readonly>
          </div>        
         </div>           
         <div class="form-group row">
          <label for="name" class="col-4 col-form-label pr-0"><i class="fas fa-lock mr-sm-1"></i>현재 비밀번호</label>
          <div class="col-8 pl-0">
           <input type="password" name="prevpass" id="prevpass" class="form-control" value="${memberDTO.pass}" readonly>
          </div>
         </div>
         <div class="form-group row">
          <label for="name" class="col-4 col-form-label pr-0"><i class="fas fa-unlock mr-sm-1"></i>새 비밀번호</label>
          <div class="col-8 pl-0">
           <input type="password" name="pass" id="pass" class="form-control">
          </div>
         </div>
         <div class="form-group row">
          <label for="name" class="col-4 col-form-label pr-0"><i class="fas fa-unlock mr-sm-1"></i>새 비밀번호 확인</label>
          <div class="col-8 pl-0">
           <input type="password" name="pwdre" id="pwdre" class="form-control">
          </div>
         </div>
         </div>
         </div>
         <nav class="navbar justify-content-end">
          <button type="submit" class="btn btn-outline-primary mr-sm-1">
           <i class="fas fa-save mr-sm-1"></i>비밀번호 변경
          </button>
          <button type="reset" id="clear" class="btn btn-outline-warning mr-sm-1"  onclick="cancel()">
           <i class="fas fa-share-square mr-sm-1"></i>돌아가기
          </button>     
           <button type="button" class="btn btn-outline-danger mr-sm-1" onclick="memberDelete()">
         <i class="fas fa-user-times mr-sm-1"></i>회원 탈퇴
        </button>      
         <c:if test="${sessionScope.id == 'admin'}">
         <button type="button" class="btn btn-outline-success mr-sm-1" onclick="location.href='./MemberSelect'">
          <i class="fas fa-users-cog mr-sm-1"></i>
         회원 목록
         </button>
        </c:if>
         </nav>
        </fieldset>
       </form>
      </div>
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