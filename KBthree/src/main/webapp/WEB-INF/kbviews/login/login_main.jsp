<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%session.removeAttribute("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kb국민은행</title>
<link rel="stylesheet" type="text/css" href="./css/main.css"> 
<link rel="shortcut icon" href="./img/KB_SymbolMark.png" type="image/x-icon">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/cookie_login.js"></script>
<script type="text/javascript" src="./js/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/login.js"></script>
</head>
<img src="./img/kbpink.png" border="0" usemap="#kb">
<map name="kb">
<area shape="circle" coords="50, 50, 100" href="https://www.kbstar.com" target="_self">
</map>
<div class="img2">
<img src="./img/visual_mymoney_211201_login_v2.png"> 
<map name="kbimg">
<area shape="circle" coords="50, 50, 100" href="https://omoney.kbstar.com/quics?page=C043279#loading" target="_self">
</map>
</div>
<body> 

<fieldset>
<legend>KB 국민은행</legend>
 <div class="emulate">
  <div class="loginForm">
   <form action="./LoginCheck" name="login_check" id="login_check" method="post">
    <div class="box">
     <label for="id"></label>
     <input type="text" class="iText" name="id" id="id" placeholder="아이디">
     <label for="pass"></label>
     <input type="password" class="iText" name="pass" id="pass" placeholder="패스워드">
 <input class="loginBtn" id="login" type="submit" value="로그인">
    </div>
    <p style="font-size: 11px;" align="center">
    <label for = "save"></label>
    <input type="checkbox" name="save" id="save">아이디 저장
    </p>
   </form>
    <form action="#" name="another" id="another" method="post">
    <div class="col-9 mx-auto py-3 mb-3">
     <div style="margin-left: 63px;">
      <span>
       <button type="button" class="btn btn-outline-success" onclick="location.href='./idsearch'">
        <i class="fas fa-user-check mr-sm-1"></i>아이디 찾기
       </button>
      </span>
      <span>
       <button type="button" class="btn btn-outline-warning" onclick="location.href='./passwordsearch'">
        <i class="fas fa-user-lock mr-sm-1"></i>비밀번호 찾기
       </button>
      </span>     
      <span>
       <button type="button" class="btn btn-outline-info" onclick="location.href='./MemberInsert'">
        <i class="fas fa-user-plus mr-sm-1"></i>회원 가입
       </button>
      </span>
     </div>
    </div>
</form>
  </div>
 </div>
 <br>
 <br>
 <br>
 <p align="center" style="background-color: #ffffff; font-size: 40px;">
<img src="./img/login_banner.jpg">
 </p>
 </fieldset>
 
</body>
</html>
