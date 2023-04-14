<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%session.removeAttribute("id"); %> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신규고객 회원가입</title>
<link rel="shortcut icon" href="./img/KB_SymbolMark.png" type="image/x-icon">
<style type="text/css">
.input_group {

height: 42px; border-bottom: 1px dotted #ccc;
}
fieldset {
background-color:#FFFFFF; position: absolute; border: 1; width: 492px; height: auto; top: 87px; left: 650px;
}
body{
background-color: #FFF4F6;
}

</style>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script src="./js/validity_jin.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/insert_valid.js"></script>
<script type="text/javascript" src="./js/postalcode.js"></script>
</head>
<body>
 <nav class="navbar navbar-expand-md bg-dark navbar-dark text-white">
  <div class="container">
   <div class="col-md-6" style="margin-left: 1113px;">   
   <a href="./index.jsp" class="navbar-brand">
    <i class="fa fa-home"></i>Home
   </a> 
   </div>
    <h1 style="margin-left: 640px; margin-top: -23px;">
     <i class="fas fa-users"></i>
     온라인고객 신규가입
    </h1>
   <div id="toggle" class="navbar-collapse collapse">
    <ul class="navbar-nav">    
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
      <div class="card-header" style="margin-left: 643px;">
       <h3 class="text-muted">
        <i class="fas fa-user-edit mr-sm-1"></i>
        회원 등록
       </h3>
      </div>
      <div class="card-body">
       <form action="./MemberInsert" method="post" id="signupForm" name="signupForm" enctype="application/x-www-form-urlencoded">
        <fieldset>
         <div class="row pl-1 pr-1">
          <div class="col col-md-5">
           <div class="form-group row">
            <label for="id" class="col-4 col-form-label pr-0">
             <i class="fas fa-user-check mr-sm-1"></i>
             아이디
            </label>
            <div class="col-8 pl-0">
             <div class="row">
              <div class="col-7">
               <input type="text" name="id" id="id" class="form-control">
              </div>
              <div class="pl-0">
               <button type="button" class="btn btn-outline-secondary" id="dbidCheck" name="dbidCheck">중복체크</button>
               <input type="hidden" name="idCheck" id="idCheck">
              </div>
             </div>
            </div>
           </div>
           <div class="form-group row">
            <label for="name" class="col-4 col-form-label pr-0">
             <i class="fas fa-user-plus mr-sm-1"></i>
             이름
            </label>
            <div class="col-8 pl-0">
             <input type="text" name="name" id="name" class="form-control">
            </div>
           </div>
           <div class="form-group row">
            <label for="pass" class="col-4 col-form-label pr-0">
             <i class="fas fa-unlock-alt mr-sm-1"></i>
             비밀번호
            </label>
            <div class="col-8 pl-0">
             <input type="password" name="pass" id="pass" class="form-control">
            </div>
           </div>
           <div class="form-group row">
            <label for="pwdre" class="col-4 col-form-label pr-0">
             <i class="fas fa-lock mr-sm-1"></i>
             비번확인
            </label>
            <div class="col-8 pl-0">
             <input type="password" name="pwdre" id="pwdre" class="form-control">
            </div>
           </div>
           <div class="form-group row">
            <label for="address" class="col-4 col-form-label pr-0">
             <i class="fas fa-user-plus mr-sm-1"></i>
             주소
             <br>
             <input type="text" id="postcode" name="postcode" placeholder="우편번호" maxlength="5">
		<input type="text" id="address" name="address" placeholder="주소">
		<input type="text" id="extraAddress" placeholder="참고항목" hidden="">
		<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
             <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

            </label>
            <div class="col-8 pl-0">
            </div>
           </div>
            <div class="form-group row">
            <label for="birthday" class="col-4 col-form-label pr-0">
             <i class="fas fa-birthday-cake mr-sm-2"></i>
             생년월일
            </label>
            <div class="col-8 pl-0">
  			<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
			<select name="birthday" id="year"></select>년
			<select name="birthday" id="month"></select>월
			<select name="birthday" id="day"></select>일
            </div>
           </div>
           <div class="form-group row">
            <label for="email" class="col-4 col-form-label pr-0">
             <i class="fas fa-envelope-open mr-sm-1"></i>
             이메일
            </label>
            <div class="col-8 pl-0">
             <input type="text" name="email" id="email" class="form-control"> @
             <input type="text" name="at" id="at" value="@" hidden="">
             <input type="text" id="domain" name="domain" style="width:100px;" value="naver.com" readonly>
		<select  id="selectEmail">
	 <option value="main" selected>---- select ----</option>
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
            <label for="phonenum" class="col-4 col-form-label pr-0">
             <i class="fas fa-user-clock mr-sm-1"></i>
             전화번호
            </label>
            <div class="col-8 pl-0">
	<select id="telecom" name="telecom">
	 <option value="010">010</option>
	 <option value="011">011</option>
	 <option value="016">016</option>
	 <option value="017">017</option>
	 <option value="018">018</option>
	 <option value="019">019</option>
	</select> -
    <input type="text" id="phonenum" name="phonenum" maxlength="4" size="3"> -
    <input type="text" id="phonenum2" name="phonenum2" maxlength="4" size="3">
            </div>
           </div>
           <div class="form-group row">
            <label for="accountnum" class="col-4 col-form-check-label pr-0">
             <i class="fas fa-restroom mr-sm-1"></i>
             계좌번호
            </label>
            <div class="col-md-7 form-check form-check-inline text-left">
             <input type="text" name="accountnum" id="accountnum" class="form-check-input"> ( '-' 없이 입력)
            </div>
           </div>
            <div class="form-group row">
            <label for="accountpass" class="col-4 col-form-label pr-0">
             <i class="fas fa-unlock-alt mr-sm-1"></i>
             계좌 비밀번호
            </label>
            <div class="col-8 pl-0">
             <input type="password" name="accountpass" id="accountpass" class="form-control" maxlength="4"> (4자리 입력)
            </div>
           </div>
           <div class="form-group row">
            <label for="compname" class="col-4 col-form-check-label pr-0">
             <i class="fas fa-restroom mr-sm-1"></i>
             직장정보
            </label>
            <div class="col-md-7 form-check form-check-inline text-left">
             <input type="text" name="compname" id="compname" class="form-check-input" placeholder="직장명">
             <label for="deptname]" class="col-4 col-form-check-label pr-0">
             <i class="fas fa-restroom mr-sm-1"></i>
            </label>
             <input type="text" name="deptname" id="deptname" class="form-check-input" placeholder="부서명">
            <label for="compphonenum" class="col-4 col-form-check-label pr-0">
             <i class="fas fa-restroom mr-sm-1"></i>
            </label>
             <input type="text" name="compphone" id="compphone" class="form-check-input" placeholder="직장 전화번호">
            <label for="compaddress" class="col-4 col-form-check-label pr-0">
             <i class="fas fa-restroom mr-sm-1"></i>
            </label>
             <input type="text" name="compaddress" id="compaddress" class="form-check-input" placeholder="직장 주소" size="30px" >
               </div>
           </div>
           <div class="form-group row">
            <label for="job" class="col-4 col-form-check-label pr-0">
             <i class="fas fa-restroom mr-sm-1"></i>
             직업
            </label>
            <div class="col-md-7 form-check form-check-inline text-left">
                <select id="job" name="job">
     		<option>----- 선택하세요 -----</option>
     		<option value="무직">무직</option>
     		<option value="직장인">직장인</option>
     		<option value="주부">주부</option>
     		<option value="학생">학생</option>
    			</select>
            </div>
           </div>
           <div class="form-group row">
            <label for="interest" class="col-4 col-form-check-label pr-0">
             <i class="fas fa-restroom mr-sm-1"></i>
             [선택] 관심분야
            </label>
            <div class="col-md-7 form-check form-check-inline text-left">
           <input type="checkbox" value="펀드" id="interest" name="interest"> 펀드
    <input type="checkbox" value="대출" id="interest" name="interest"> 대출
    <input type="checkbox" value="재테크" id="interest" name="interest"> 재테크
    <input type="checkbox" value="외환" id="interest" name="interest"> 외환
    <input type="checkbox" value="자동차" id="interest" name="interest"> 자동차
    <input type="checkbox" value="신용거래" id="interest" name="interest"> 신용
    <input type="checkbox" value="None" id="interest" name="interest" checked> 없음
   <span>&nbsp;(중복 선택 가능)</span>

            </div>
           </div>
           <div class="form-group row">
            <label for="request" class="col-4 col-form-check-label pr-0">
             <i class="fas fa-restroom mr-sm-1"></i>
             <br>
            이메일 수신 동의
            </label>
            <div class="col-md-7 form-check form-check-inline text-left">
             <input type="radio" name="reqemail" id="reqemail" class="form-check-radio" value="동의" checked>동의
             <input type="radio" name="reqemail" id="reqemail" class="form-check-radio" value="비동의">비동의
            </div>
           </div>
           <div class="form-group row">
            <label for="request" class="col-4 col-form-check-label pr-0">
             <i class="fas fa-restroom mr-sm-1"></i>
             <br>
            우편물 수신 동의
            </label>
            <div class="col-md-7 form-check form-check-inline text-left">
             <input type="radio" name="reqpost" id="reqpost" class="form-check-radio" value="동의" checked>동의
             <input type="radio" name="reqpost" id="reqpost" class="form-check-radio" value="비동의">비동의
            </div>
           </div>
           <div class="form-group row">
            <label for="request" class="col-4 col-form-check-label pr-0">
             <i class="fas fa-restroom mr-sm-1"></i>
             <br>
            SMS 수신 동의
            </label>
            <div class="col-md-7 form-check form-check-inline text-left">
             <input type="radio" name="reqsms" id="reqsms" class="form-check-radio" value="동의" checked>동의
             <input type="radio" name="reqsms" id="reqsms" class="form-check-radio" value="비동의">비동의
            </div>
           </div>
          </div>
         </div>
         <nav class="navbar justify-content-end">
          <button type="submit" class="btn btn-outline-primary mr-sm-1">
           <i class="fas fa-save mr-sm-1"></i>
           회원 등록
          </button>
          <button type="reset" id="clear" class="btn btn-outline-warning mr-sm-1" onclick= "cancel()">
           <i class="fas fa-share-square mr-sm-1"></i>
           등록 취소
          </button>
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