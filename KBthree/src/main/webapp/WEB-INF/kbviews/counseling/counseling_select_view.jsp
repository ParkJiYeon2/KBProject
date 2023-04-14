<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담예약 상세보기</title>
<link rel="shortcut icon" type="image⁄x-icon" href="./img/KbBank.png">
<link href="./css/bootstrap.min_4.5.0.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.min.sandstone.css" rel="stylesheet" type="text/css">
<link href="./css/begin.css" rel="stylesheet">
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #5f584c;">
<a class="navbar-brand" href="#"><img src="./img/국민은행일러스트로고.png" width="50" height="50"> KB상담예약 </a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
  <ul class="navbar-nav mr-auto">
    <li class="nav-item active">
      <a class="nav-link" href="index.jsp">홈 <span class="sr-only">(home)</span></a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="./CounselingInsert">신청하기 <span class="sr-only">(insert)</span></a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="./CounselingSelect">목록보기 <span class="sr-only">(list)</span></a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="https://obank.kbstar.com/quics?page=osupp">고객센터<span class="sr-only">(KB)</span></a>
    </li>
  </ul>

</div>
</nav>
<header id="main-header" class="py-2 btn-dark text-white">
<div class="container">
<div class="row">
<div class="col-md-6">
<h1> 상담 상세 정보 </h1>
</div>
</div>
</div>
</header>
<section class="py-4 mb-4 bg-light">
</section>
<section id="department">
<div class="container">
<div class="row">
<div class="col-md-12">
<div class="card">
<div class="card-header">
<h5> 상담내용 상세 보기 </h5>
</div>
<div class="card-body">
		 <div class="row pl-1 pr-1">
        <div class="col col-md-10">
          <input type="hidden" name="num" value="${counselingDTO.num}">
          <div class="form-group row " >
          <label for="subject" class="col-2 col-form-label pr-0 " >제목</label>
          <div class="col-6 pl-0  py-1" >
           	${counselingDTO.subject}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수 ${counselingDTO.hit }
          </div>
<!--           border border-secondary -->
         <div class="form-group row">
          <label for="name" class="col-2 col-form-label pr-0 ">이름</label>
          <div class="col-2 pl-0 py-1">
           ${counselingDTO.name}
          </div>
          
          <label for="address" class="col-2 col-form-label pr-0">주소</label>
          <div class="col-2 pl-0 py-1">
           ${counselingDTO.address}
          </div>
          
          <label for="postcode" class="col-2 col-form-label pr-0">우편 번호</label>
          <div class="col-2 pl-0 py-1">
           ${counselingDTO.postcode}
          </div>
          
          <label for="detailaddress" class="col-2 col-form-label pr-0">상세 주소</label>
          <div class="col-2 pl-0 py-1">
           ${counselingDTO.detailaddress}
          </div>
         </div>
           <div class="form-group row">
          <label for="businesschoice" class="col-2 col-form-label pr-0">상담 업무 선택</label>
          <div class="col-2 pl-0 py-1">
           ${counselingDTO.businesschoice}
           </div>
            <div class="form-group row">
          <label for="phonenumber" class="col-2 col-form-label pr-0">휴대 전화 번호</label>
          <div class="col-2 pl-0 py-1">
           ${counselingDTO.phonenumber}
           </div>
            <div class="form-group row">
          <label for="reservation" class="col-2 col-form-label pr-0">지정날짜</label>
          <div class="col-2 pl-0 py-1">
           ${counselingDTO.reservation}
           </div>
         </div>
         <div class="form-group row">
          <label for="content" class="col-2 col-form-label pr-0">내용</label>
          <div class="col-10 pl-0  py-1">
       <textarea cols="40" rows="20" name="content" id="content" placeholder="상담 내용" class="form-control">${counselingDTO.content}</textarea>
          </div>
         </div>
            <div class="form-group row">
          <label for="writeday" class="col-2 col-form-label pr-0">등록일</label>
          <div class="col-2 pl-0 py-1">
           ${counselingDTO.writeday }
           </div>
           </div>
<div class="row">
<div class="col-md-4">
<a href="./CounselingSelect" class="btn btn-primary btn-block">
상담 목록
</a>
</div>
<div class="col-md-4">
<a href="./CounselingUpdate?num=${param.num}" class="btn btn-warning btn-block">
상담 수정
</a>
</div>
<div class="col-md-4">
<script type="text/javascript">
function real() {
    if (!confirm("정말 삭제 하시겠습니까? 확인(예) 또는 취소(아니오)를 선택해주세요.")) {
        history.back;
    } else {
        location.href="./CounselingDelete?num=${param.num}";
    }
}
</script>
<a href="#" onclick="real();" class="btn btn-danger btn-block">상담 삭제</a>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</section>
</body>
</html>