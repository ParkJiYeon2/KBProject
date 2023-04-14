<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> 공지 입력 </title>
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
$(function() {
	
	var fileIndex = 1;
	//$("#fileIndex").append("<div><input type='file' style='float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div><input type='file' style='float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
	});
	
});
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
         <br><div align="left">
			<strong style="font-size: 20px;">공지사항 등록</strong>
			</div><hr style="border: solid 1px #E6E6E6;">



<form name="insertForm" method="post" id="Noticeinsert" enctype="multipart/form-data">
  <fieldset>
      <div class="form-group">
      <label for="name" class="form-label mt-4">이름</label>
      <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요." required>
    </div>
    <div class="form-group">
      <label for="subject" class="form-label mt-4">제목</label>
      <input type="text" class="form-control" name="subject" id="subject" placeholder="제목을 입력하세요." required>
    </div>
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">내용</label>
      <textarea class="form-control" name="content" id="content" rows="10" required></textarea>
    </div>
    
    <table>
<tbody>
<tr>
  <%-- 첨부 파일 --%>
  <td id="fileIndex">
  </td>
</tr>
</table>
<label for="fileAdd_btn" class="form-label mt-4"></label>
<button class="fileAdd_btn" type="button" style="float: left; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;">파일추가</button>
  <div >
<button type="submit" style="float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;" > 등록 </button>
<button type="reset" onclick="location.href='./NoticeSelect'" style="float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;" > 취소 </button>
  </div>

      </fieldset>
</form>

 </section>
</body>
</html>
