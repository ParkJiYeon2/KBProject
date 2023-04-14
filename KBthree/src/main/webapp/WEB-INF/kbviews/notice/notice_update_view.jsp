<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> 공지 수정 </title>
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
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(document).on("click","#fileDel", function(){
		$(this).parent().remove();
	})
	
	fn_addFile();
	
	//공지 수정 버튼
	$(".update_btn").on("click", function(){
		formObj.attr("action", "./NoticeUpdate");
		formObj.attr("method", "post");
		formObj.submit();
	})
})
	//파일 추가
	function fn_addFile(){
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div><input type='file' style='float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	}
		
		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){ 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
 		}
	</script>
	
<body>
<section style="width:1000px; margin: 0 auto;">
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
			<li><a href="#">새소식</a></li>
			<li><a href="#">신상품</a></li>
			<li><a href="#">매거진</a></li>
		</ul>
</div>
         <br><div align="left">
			<strong style="font-size: 20px;">공지사항 수정</strong>
			</div><hr style="border: solid 1px #E6E6E6;">

<%-- action을 생략해도 되지만 readonly 기능이 적용되지 않을 수도 있으므로 생략하지 않는다.--%>
<form name="updateForm" role="form" action="./NoticeUpdate" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="${update.num}" readonly="readonly"/>
<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">





<fieldset>

      <div class="form-group">
      <label for="name" class="form-label mt-4">이름</label>
      <input type="text" class="form-control" name="name" id="name" value="${update.name}" required>
    </div>
    <div class="form-group">
      <label for="subject" class="form-label mt-4">제목</label>
      <input type="text" class="form-control" name="subject" id="subject" value="${update.subject}" required>
    </div>
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">내용</label>
      <textarea class="form-control" name="content" id="content" rows="10" required>${update.content}</textarea>
    </div>


<%-- <label for="subject"> 제목 </label>
<input type="text" name="subject" id="subject" 
value="${noticeDTO.subject}">

<label for="content"> 내용 </label>
<input type="text" name="content" id="content" value="${noticeDTO.content}"> --%>
<!-- 파일 삭제, 수정 -->
								<table>
									<tbody>
										<tr>
											<td id="fileIndex">
											<c:forEach var="file" items="${file}"
													varStatus="var">
													<div>
														<input type="hidden" id="FILE_NUM"
															name="FILE_NUM_${var.index}" value="${file.FILE_NUM}">
														<input type="hidden" id="FILE_NAME" name="FILE_NAME"
															value="FILE_NUM_${var.index}"> <a href="#"
															id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
														<button id="fileDel"
															onclick="fn_del('${file.FILE_NUM}','FILE_NUM_${var.index}');"
															type="button" style="float: left; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;">삭제</button>
													</div>
												</c:forEach>
												</td>
										</tr>
									</tbody>
								</table>
<!-- 파일추가 , 등록 , 취소 버튼 -->
									<button type="button" class="fileAdd_btn" onclick="fileAdd_btn" style="float: left; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;">파일추가</button>
								<div>
									<button type="submit" class="update_btn" style="float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;">등록</button>
									<button type="reset" onclick="location.href='./NoticeSelect'" style="float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;">취소</button>
								</div>
</fieldset>								
</form>
<%-- <a href="./NoticeDelete?num=${param.num}"> 삭제 </a> --%>
</section>
</body>
</html>