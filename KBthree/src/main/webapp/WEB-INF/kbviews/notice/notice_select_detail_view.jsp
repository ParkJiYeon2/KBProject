<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> 공지 정보 상세 보기 </title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./css/Yeon_KBmenu.css" />
</head>

<%
String id = null;

//Session을 받을때는 값이 null로 올때를 생각해서 조건문을 사용한다.
if (session.getAttribute("id") != null) {
  //세션의 값을 가져오기
  id = (String)session.getAttribute("id");
}
%>

<script type="text/javascript">
function fn_fileDown(fileNum){
	var formObj = $("form[name='selectForm']");
	$("#FILE_NUM").attr("value", fileNum);
	formObj.attr("action", "./NoticeFileDown");
	formObj.submit();
}

function real() {
    if (!confirm("게시글을 삭제하시겠습니까?")) {
        history.back;
    } else {
        location.href="./NoticeDelete?num=${param.num}";
    }
}
</script>
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
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
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
			<li><a href="#">새소식</a></li>
			<li><a href="#">신상품</a></li>
			<li><a href="#">매거진</a></li>
		</ul>
</div>
			
<section id="container">    
<form name="selectForm" role="form" method="post">
<input type="hidden" id="FILE_NUM" name="FILE_NUM" value=""> 
         <br><div align="left">
			<strong style="font-size: 20px;">공지사항</strong>
			</div>
			

<div>
<hr style="border: solid 1px #E6E6E6;">
<strong style="font-size: 24px;">${noticeDTO.subject}</strong><br>
 <small class="form-text text-muted" style="font-size: 12px;">${noticeDTO.writeday}</small>
 <hr>
</div>
<div>
<pre><c:out value="${noticeDTO.content}" /></pre>
</div>


<%-- 객체를 호출하고 파라미터에 저장하여 반복한다.--%>
<div>
<hr>
<small style="font-size: 12px;">첨부파일</small><br>
<c:forEach var="file" items="${file}">
<a href="#" onclick="fn_fileDown('${file.FILE_NUM}'); return false;">${file.ORG_FILE_NAME}</a>
(${file.FILE_SIZE}kb)<br>
</c:forEach>
</div>
</form>
</section>

<hr>
<div>
<button type="button" onclick="location.href='./NoticeSelect'" style="float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;" >목록</button>
<c:if test="${sessionScope.id == 'admin'}">
<button type="button" onclick="location.href='./NoticeUpdate?num=${param.num}'" style="float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;" >수정</button>
<button type="button" onclick="real();" style="float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;" >삭제</button>
</c:if>

</div>
</section>

</body>
</html>
