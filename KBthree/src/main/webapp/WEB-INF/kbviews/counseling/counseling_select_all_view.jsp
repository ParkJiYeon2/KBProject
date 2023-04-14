<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a:hover {
	background-color: #C4C2BE;l
}
li {list-style: none; float: left; padding: 6px;}

.pagination {
justify-content : center;

}
</style>
<meta charset="UTF-8">
<title>상담 게시판 전체조회</title>
<link rel="shortcut icon" type="image⁄x-icon" href="./img/KbBank.png">
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
<h1> 국민은행 상담게시판 </h1>
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
<h5> 상담게시판 목록 </h5>
</div>
<div class="card-body">
<table class="table table-hover">
<thead class="thead-light">
<tr class="text-center">
<th> 게시판 번호 </th>
<th> 이름 </th>
<!-- <th> 상담 지역 </th> -->
<th> 제목 </th>
<!-- <th> 내용 </th> -->
<!-- <th> 업무선택 </th> -->
<!-- <th> 폰번호 </th> -->
<!-- <th> 지정날짜 </th> -->
<th> 등록일 </th>
<th> 아이디 </th>
<!-- <th> 로우넘버 테스트</th> -->
<th> 조회수 </th>
<th></th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list }" varStatus="i">
<tr class="text-center">
<td>${list.num }</td>
<td>${list.name }</td>
<%-- <td>${list.address }</td> --%>
<td onclick="location.href='./CounselingSelectDetail?num=${list.num }' "><a >${list.subject }</a></td>
<%-- <td>${list.content }</td> --%>
<%-- <td>${list.businessChoice }</td> --%>
<%-- <td>${list.phoneNumber }</td> --%>
<%-- <td>${list.reservation }</td> --%>
<td>${list.writeday }</td>
<td>${list.id }</td>
<%-- <td>${list.rnum }</td> --%>
<td>${list.hit }</td>
<%-- <td>${listcount - (page-1) * displayPageNum - i.index}</td> --%>
<%-- <c:out value="${status.count }"> --%>
<%-- <td>${(totalCount - status.count) - ( (startPage - 1)  *  displayPageNum )}</td> --%>
<%-- </c:out> --%>
<!-- <td> -->
<%-- <a href="./CounselingSelectDetail?num=${list.num }" class="btn btn-outline-info"> --%>
<!-- </a> -->
<!-- </td> -->
</c:forEach>

</tbody>
</table>
<div>
<a href="./CounselingInsert" class="btn btn-success btn-block"> 상담 입력 </a>
</div>
</div>
</div>
</div>
</div>
</div>
<div>
  <ul class="pagination" >
    <c:if test="${pageMaker.prev}">
    	<li class="page-item"><a class="page-link" href="CounselingSelect${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a  class="page-link" href="CounselingSelect${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a class="page-link" href="CounselingSelect${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
   <p align="right">
        상담 예약 전체 글:
        <strong>${listcount}</strong>
        개
       </p>
</section>
</body>
</html>