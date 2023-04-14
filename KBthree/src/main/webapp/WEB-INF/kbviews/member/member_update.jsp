<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:if test="${empty sessionScope.id}"> --%>
<!-- <script type="text/javascript"> -->
<!-- location.href="./LoginView" -->
<!-- </script> -->
<%-- </c:if> --%>
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
<!-- <link rel="stylesheet" href="./css/bootstrap-datepicker.css"> -->
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script src="./js/validity2_jin.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/postalcode.js"></script>
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
	location.href = "./MemberSelectDetail?id=${memberDTO.id}";
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
     <h1>회원 정보 수정</h1> 
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
      <a class="dropdown-item" href="./MemberPasswordUpdate?id=${sessionScope.id}"><i class="fas fa-user-tag"></i>비밀번호 변경</a>
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
       <h3 class="text-muted"><i class="fas fa-user-tag mr-sm-1"></i>회원 수정</h3>
      </div>
      <div class="card-body">
     <form action="./MemberUpdate" method="post" id="signupForm">
        <fieldset>
        <div class="row pl-1 pr-1" style="margin-right: -317px;">
          <div class="col col-md-5">
         <div class="form-group row">
          <label for="id" class="col-4 col-form-label pr-0"><i class="fas fa-user-check mr-sm-1"></i>아이디</label>
          <div class="col-8 pl-0">
           <input type="text" name="id" id="id" class="form-control" value="${memberDTO.id}" readonly>
          </div>        
         </div>           
         <div class="form-group row">
          <label for="name" class="col-4 col-form-label pr-0"><i class="fas fa-user-plus mr-sm-1"></i>이름</label>
          <div class="col-8 pl-0">
           <input type="text" name="name" id="name" class="form-control" value="${memberDTO.name}" readonly>
          </div>
         </div>
         <div class="form-group row">
          <label for="address" class="col-4 col-form-label pr-0"><i class="fas fa-home mr-sm-1"></i>주소</label>
          <div class="col-8 pl-0">
		<input type="text" id="postcode" name="postcode"class="form-control" value="${memberDTO.postcode}"size=30px; readonly>
		<input type="text" id="address" name="address"class="form-control" value="${memberDTO.address}"size=30px; readonly>
		<input type="text" id="extraAddress"  class="form-control"placeholder="참고항목" hidden="">
		<input type="text" id="detailAddress" name="detailAddress" class="form-control bg-white" value="${memberDTO.detailAddress}"size=30px; placeholder="상세주소">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
             <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
          </div>
         </div>
         <div class="form-group row" style="margin-right: -71px;">
          <label for="email" class="col-4 col-form-label pr-0"style="margin-right: -20px;"><i class="fas fa-envelope-open mr-sm-1"></i>이메일</label>
          <div class="col-8 pl-0">
  				<input type="text" name="email" id="email" class="form-control" style="width: 105px; display: inline; height: 31px;"> @
           		  <input type="text" name="at" id="at" value="@" hidden="">
            	 <input type="text"  class="form-control" id="domain" name="domain" style="width:113px; height: 31px; display: inline; " value="naver.com" readonly>
		<select class="col-md-7 form-check form-check-inline text-left" id="selectEmail" style="width: 127px; height: 31px; display: inline; ">
	 <option value="main" selected>--- select ---</option>
	 <option value="naver.com">naver.com</option>
	 <option value="hanmail.net">hanmail.net</option>
	 <option value="hotmail.com">hotmail.com</option>
	 <option value="nate.com">nate.com</option>
	 <option value="gmail.com">gmail.com</option>
	 <option value="1">직접입력</option>
		</select>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
$('#selectEmail').change(function(){
   $("#selectEmail option:selected").each(function () {
		
		if($(this).val()== '1'){ 
			 $("#domain").val('');  
			 $("#domain").attr("readonly",false); 
		}else{ 
			 $("#domain").val($(this).text());  
			 $("#domain").attr("readonly",true); 
		}
   });
});
</script>           
          </div>
         </div>
         <div class="form-group row">
          <label for="phonenum" class="col-4 col-form-label pr-0"><i class="fas fa-mobile mr-sm-1"></i>전화번호</label>
          <div class="col-8 pl-0" style="margin-top: 7px;">
          <select class="col-md-7 form-check form-check-inline text-left" id="telecom" name="telecom" style="width: 65px; display: inline; border-color: #ced4da; margin-right: 0.1rem;"> 
	 			<option value="010">010</option>
	 			<option value="011">011</option>
			 	<option value="016">016</option>
	 			<option value="017">017</option>
	 			<option value="018">018</option>
	 			<option value="019">019</option>
           </select> -
<%--            <input type="text" name="telecom" id="telecom" class="form-control" value="${memberDTO.telecom}" style="width: 65px; display: inline;">- --%>
           <input type="text" name="phonenum" id="phonenum" class="form-control" value="${memberDTO.phonenum}" style="width: 65px; display: inline; height: 25px;"> -
           <input type="text" name="phonenum2" id="phonenum2" class="form-control" value="${memberDTO.phonenum2}" style="width: 65px; display: inline; height: 25px;'">
          </div>
         </div>
         <div class="form-group row">
          <label for="compname" class="col-4 col-form-label pr-0"><i class="fas fa-book mr-sm-1"></i>직업</label>
          <div class="col-8 pl-0" style="margin-top: 7px;">
           <select name="job" id="job" class="col-md-7 form-check form-check-inline text-left" style="border-color: #ced4da; width: 100px;">
            <option value="무직">무직</option>
     		<option value="직장인">직장인</option>
     		<option value="주부">주부</option>
     		<option value="학생">학생</option>
           </select>
          </div>
         </div>
         <div class="form-group row">
          <label for="compname" class="col-4 col-form-label pr-0"><i class="fas fa-book mr-sm-1"></i>직장명</label>
          <div class="col-8 pl-0">
           <input type="text" name="compname" id="compname" class="form-control" value="${memberDTO.compname}">
          </div>
         </div>
         <div class="form-group row">
          <label for="deptname" class="col-4 col-form-label pr-0"><i class="fas fa-book-open mr-sm-1"></i>부서명</label>
          <div class="col-8 pl-0">
           <input type="text" name="deptname" id="deptname" class="form-control" value="${memberDTO.deptname}">
          </div>
         </div>
         <div class="form-group row">
          <label for="compphonenum" class="col-4 col-form-label pr-0"><i class="fas fa-phone mr-sm-1"></i>직장전화번호</label>
          <div class="col-8 pl-0">
           <input type="text" name="compphone" id="compphone" class="form-control" value="${memberDTO.compphone}">
          </div>
         </div>
         <div class="form-group row">
          <label for="compaddress" class="col-4 col-form-label pr-0"><i class="fas fa-building mr-sm-1"></i>직장주소</label>
          <div class="col-8 pl-0">
           <input type="text" name="compaddress" id="compaddress" class="form-control" value="${memberDTO.compaddress}">
          </div>
         </div>
         <div class="form-group row">
          <label for="requestpost" class="col-4 col-form-check-label pr-0"><i class="fas fa-paper-plane mr-sm-1"></i>우편 수신 동의</label>
          <div class="col-md-7 form-check form-check-inline text-left">
           <input type="radio" name="reqpost" id="reqpost" value="동의" class="form-check-input" <c:if test="${memberDTO.reqpost=='동의'}">checked</c:if>>동의
           <input type="radio" name="reqpost" id="reqpost" value="비동의" class="ml-sm-3 form-check-input" <c:if test="${memberDTO.reqpost=='비동의'}">checked</c:if>>비동의
          </div>
         </div>  
         <div class="form-group row">
          <label for="requestemail" class="col-4 col-form-check-label pr-0"><i class="fas fa-envelope-open mr-sm-1"></i>메일 수신 동의</label>
          <div class="col-md-7 form-check form-check-inline text-left">
           <input type="radio" name="reqemail" id="reqemail" value="동의" class="form-check-input" <c:if test="${memberDTO.reqemail=='동의'}">checked</c:if>>동의
           <input type="radio" name="reqemail" id="reqemail" value="비동의" class="ml-sm-3 form-check-input" <c:if test="${memberDTO.reqemail=='비동의'}">checked</c:if>>비동의
          </div>
         </div>  
         <div class="form-group row">
          <label for="requestsms" class="col-4 col-form-check-label pr-0"><i class="fas fa-sms mr-sm-1"></i>SMS 수신 동의</label>
          <div class="col-md-7 form-check form-check-inline text-left">
           <input type="radio" name="reqsms" id="reqsms" value="동의" class="form-check-input" <c:if test="${memberDTO.reqsms=='동의'}">checked</c:if>>동의
           <input type="radio" name="reqsms" id="reqsms" value="비동의" class="ml-sm-3 form-check-input" <c:if test="${memberDTO.reqsms=='비동의'}">checked</c:if>>비동의
          </div>
         </div>  
         </div>
         </div>
         <nav class="navbar justify-content-end">
          <button type="submit" class="btn btn-outline-primary mr-sm-1">
           <i class="fas fa-save mr-sm-1"></i>회원 수정
          </button>
          <button type="reset" id="clear" class="btn btn-outline-warning mr-sm-1" onclick="cancel()">
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