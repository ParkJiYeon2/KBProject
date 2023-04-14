<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>국민은행 아이디찾기</title>
<link rel="shortcut icon" href="./img/KB_SymbolMark.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<link rel="stylesheet" type="text/css" href="./css/all.min.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
</head>
<body>
 <nav class="navbar navbar-expand-md bg-dark navbar-dark text-white">
  <div class="container">
   <div class="col-md-6">
<div class="img">
<img src="./img/KB_SymbolMark.png" style="width: 25px; height: 25px;">
</div>
    <h1>
     국민은행
    </h1>
   </div>
   <div id="toggle" class="navbar-collapse collapse">
    <ul class="navbar-nav">
    </ul>
    <ul class="navbar-nav ml-auto">
     <li class="nav-item dropdown mr-3">
      <c:choose>
       <c:when test="${empty sessionScope.id}">
        <li class="nav-item">
         <a href="./LoginMain" class="nav-link">
          <i class="fas fa-user-circle mr-sm-1"></i>
          로그인
         </a>
       </c:when>
      </c:choose>
    </ul>
   </div>
  </div>
 </nav>
 <header id="main-header" class="py-2 bg-secondary"></header>
 <section class="py-3 mb-3 bg-light">
  <div class="container">
   <div class="row col-md-12"></div>
  </div>
 </section>
 <section id="member">
 <div class="container">
   <div class="row">
    <div class="col-9 mx-auto">
     <div class="card">
      <div class="card-header">
       <h4>아이디 찾기 결과</h4>
      </div>
      <div class="card-body">
       <div class="row  pt-3 pb-1 justify-content-center">
        <div class="col col-sm-8 text_strong text-center">검색한 아이디의 정보입니다.</div>
       </div>
       <div class="row pb-1 justify-content-center">
        <div class="col-10 col-sm-8">
         <hr class="list_hr">
        </div>
       </div>
      
      <c:choose>
       <c:when test="${!empty memberDTO.id}">
        <div class="row pb-1 justify-content-center">
        <p class="text"> 찾으시는 아이디는
         <b class="text-danger">${memberDTO.id}</b>
        입니다. </p>
         
        </div>
       </c:when>
       <c:otherwise>
       <div class="row pb-1 justify-content-center">
       <p class="text-danger"> 찾으시는 아이디가 존재하지 않습니다. </p>
        
        </div>
       </c:otherwise>
      </c:choose>
        </div>
       </div>
   <div class="col-9 mx-auto py-3 mb-3">
    <div style="margin-left: 163px;">
         <span>
      <button type="button" class="btn btn-outline-warning" onclick="location.href='./idsearch'">
       <i class="fas fa-user-lock mr-sm-1"></i>
       아이디 찾기
      </button>
     </span>
     <span>
      <button type="button" class="btn btn-outline-warning" onclick="location.href='./passwordsearch'">
       <i class="fas fa-user-lock mr-sm-1"></i>
       비밀번호 찾기
      </button>
     </span>
     <span>
      <button type="button" class="btn btn-outline-info" onclick="location.href='./MemberInsert'">
       <i class="fas fa-user-plus mr-sm-1"></i>
       회원 가입
      </button>
     </span>
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