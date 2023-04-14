<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>국민은행 아이디 찾기</title>
<link rel="shortcut icon" href="./img/KB_SymbolMark.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./css/global_jin.css">
<link rel="stylesheet" type="text/css" href="./css/all.min.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" href="./css/bootstrap-datepicker.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>

 <script type="text/javascript">
 function cancel() {
		if (confirm("정말로 취소하시겠습니까?")) {
			location.href="./LoginMain"
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
     <h1>아이디 찾기</h1> 
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
       <h3 class="text-muted"><i class="fas fa-user-tag mr-sm-1"></i>아이디 검색</h3>
      </div>
      <div class="card-body">
            <div class="pagination justify-content-center">  
     <form action="./idsearchview" method="post" id="signupForm" enctype="application/x-www-form-urlencoded">
        <fieldset>
        
        <div class="pagination justify-content-center">
          <div class="col col-md-12">
         <div class="form-group row">
          <label for="id" class="col-2 col-form-label pr-0"><i class="fas fa-user mr-sm-1"></i>이름</label>
          <div class="col-8 pl-0">
           <input type="text" name="name" id="name" class="form-control" placeholder="이름">
          </div>        
         </div>           
         <div class="form-group row">
          <label for="email" class="col-2 col-form-label pr-0"><i class="fas fa-envelope-open mr-sm-1"></i>이메일</label>
          <div class="col-8 pl-0">
          <div class="d-md-flex">
           <input type="text" name="email" id="email" class="form-control" placeholder="이메일"> <p style="margin-top: 6px;">@</p>
                        <input type="text" name="at" id = "at" value="@" hidden="">
             <input type="text" id="domain" name="domain"  value="naver.com" class="form-control" readonly>
		<select  id="selectEmail" class="form-control">
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
         </div>
         </div>
         </div>
         <nav class="navbar justify-content-end">
          <button type="submit" class="btn btn-outline-primary mr-sm-1">
           <i class="fas fa-save mr-sm-1"></i>아이디 검색
          </button>
      <span>
       <button type="button" class="btn btn-outline-warning" onclick="location.href='./passwordsearch'">
        <i class="fas fa-user-lock mr-sm-1"></i>비밀번호 찾기
       </button>
      </span>     
          <button type="reset" id="clear" class="btn btn-outline-warning mr-sm-1"  onclick="location.href='./LoginMain'">
           <i class="fas fa-share-square mr-sm-1"></i>돌아가기
          </button>     
      <span>
       <button type="button" class="btn btn-outline-info" onclick="location.href='./MemberInsert'">
        <i class="fas fa-user-plus mr-sm-1"></i>회원 가입
       </button>
      </span>
         </nav>
        </fieldset>
       </form>
      </div>
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