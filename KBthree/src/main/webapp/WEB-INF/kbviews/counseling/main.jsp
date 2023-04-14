<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>시작</title>
<link rel="stylesheet" href="./css/slider2.css">
<link rel="shortcut icon" type="image⁄x-icon" href="./img/KbBank.png">
<link href="./css/bootstrap.min.sandstone.css" rel="stylesheet" type="text/css">
<link href="./css/begin.css" rel="stylesheet">
<link href="./css/Yeon_KBmenu.css" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/global.css">
<link rel="stylesheet" href="./resources/css/style.css">
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
</script>
</head>
<%
String id = null;

//Session을 받을때는 값이 null로 올때를 생각해서 조건문을 사용한다.
if (session.getAttribute("id") != null) {
  //세션값 가져오기
  id = (String)session.getAttribute("id");
}
%>
<body>
<section style="width:1000px; margin: 0 auto;">
<header>
			<div id="headerWrap">
				<div id="HEADER">
					<div id="navWrap">
						<div id="nav_top">
							<nav>
								<ul>
								 <li> <a href="./Main">
            <img src="./img/main_title.png"></a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </li>																
									<li>
									<c:if test="${!empty sessionScope.id}">
									<a style="text-decoration: none">${sessionScope.id}님</a>
									</c:if>
									</li>
									
									<li>
									<c:choose>
                                    <c:when test="${!empty sessionScope.id}">
									<a style="text-decoration: none" href="./MemberSelectDetail.three?id=${sessionScope.id}">회원 정보</a>
									</c:when>
                                    </c:choose>
									</li>
								</ul>
							</nav>
						</div>
							
							    <!--로그인 전 화면  -->
								<%if (id == null) {%>
							    <div id="kb_logo">
                                 <ul>
								<img src="./img/notice_title.png">
                                <li id="logo_li_login">
                                <a style="text-decoration:none;" href="./LoginMain">로그인</a></li>
                                <li id="logo_li_cert">
                                <a style="text-decoration:none;" href="./MemberInsert">회원가입</a></li>
                                </ul>
                                </div>

                                <!--로그인 후 화면  -->
                               <%} else if (id != null) {%>
                               <div id="kb_logo">
                               <ul>						
							   <img src="./img/notice_title.png">
                               <li id="logo_li_login">
                               <a style="text-decoration:none;" href="./Logout">로그아웃</a></li>
								<li id="logo_li_cert"><a style="text-decoration: none;">인증센터</a></li>
                               </ul>
                               </div>
                               <%};%>
								
						</div>
						</div>
						</div>
	</header>
<div id="menu1">
        <ul>
            <li><a href="./NoticeSelect">공지사항</a></li>
            <li><a href="./CounselingSelect">상담예약</a></li>
        </ul>
</div>

<!-- 메인페이지 이미지 슬라이더 -->
<div class="slider">
    <input type="radio" name="slide" id="slide2" checked>
    <input type="radio" name="slide" id="slide1">
    <input type="radio" name="slide" id="slide3">
    <input type="radio" name="slide" id="slide4">
    <ul id="imgholder" class="imgs">
        <li><img src="./img/KB1.jpg"></li>
        <li><img src="./img/KB2.png"></li>
        <li><img src="./img/KB3.jpg"></li>
        <li><img src="./img/KB4.png"></li>
    </ul>
    <div class="bullets">
        <label for="slide1">&nbsp;</label>
        <label for="slide2">&nbsp;</label>
        <label for="slide3">&nbsp;</label>
        <label for="slide4">&nbsp;</label>
    </div>
</div>
<img src="./img/syso.jpg">
<br>
</section>
</body>
</html>