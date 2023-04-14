<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 신청하기</title>
<link rel="shortcut icon" type="image⁄x-icon" href="./img/KbBank.png">
<link href="./css/bootstrap.min.sandstone.css" rel="stylesheet" type="text/css">
<link href="./css/begin.css" rel="stylesheet">
<script type="text/javascript" src="./js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="./js/validity5.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
<section id="insert">
<div class="container">
<div class="row">
<div class="col-7 mx-auto">
<div class="card">
<div class="card-header">
<h4><img src="./img/국민은행일러스트로고.png" width="150" height="100">　　　　　　상담 예약 신청</h4>
</div>
		<form action="./CounselingInsert" method="post" id="checkForm" name="checkForm">
<div class="card-body">
	<fieldset>
			<div class="form-group">
			<label for="subject"> 제목 </label> <input type="text" name="subject" id="subject" placeholder="제목 입력" class="form-control">

<label for="address">주소 </label><br>
<input type="text" id="postcode" name="postcode" placeholder="우편번호" maxlength="8">
<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" >
<input type="text" id="address" name="address" placeholder="주소" class="form-control">
<input type="text" id="extraaddress" placeholder="참고항목" hidden="">
<input type="text" id="detailaddress" name="detailaddress" placeholder="상세주소" class="form-control" >
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("extraaddress").value = extraAddr;

                } else {
                    document.getElementById("extraaddress").value = '';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("detailaddress").focus();
            }
        }).open();
    }
</script>
			</div>
			<div class="form-group">
			<label for="phonenumber"> 전화번호 </label> <input type="text" name="phonenumber"
				id="phonenumber" placeholder="ex)01012345678" class="form-control">(- ) 를 뺀 휴대전화 번호 
			</div>
			<div class="form-group">
			<label for="name"> 이름 </label> <input type="text" name="name"
				id="name" placeholder="이름 입력" class="form-control">
			</div>
			<label for="businesschoice"> 업무선택 : </label> <select
				name="businesschoice" id="businesschoice" size="1">
				<option>---- 상담 업무를 선택하세요 ----</option>
				<option value="적금">적금</option>
				<option value="대출">대출</option>
				<option value="외환">외환</option>
				<option value="펀드">펀드</option>
				<option value="인터넷뱅킹">인터넷뱅킹</option>
				<option value="기업뱅킹">기업뱅킹</option>
				<option value="퇴직연금">퇴직연금</option>
			</select>
			<br>
			<label for="content">상담요청 내용</label> <br>
			<textarea cols="60" rows="20" name="content" id="content"
				placeholder="상담 내용" class="form-control">
</textarea>
			<br>
			<label for="reservation">상담예약 날짜선택 : </label> <input type="datetime-local"
				name="reservation" id="reservation" required><br>
			<label for="terms"> 개인정보 수집 약관 동의/비동의 : 동의</label> 
			<input type="radio" name="terms" id="terms"> 비동의 
			<input type="radio" name="terms" id="termsfalse"><br> 
			<button type="submit" class="btn btn-primary">상담신청 하기</button>
			<button type="reset" class="btn btn-secondary">취소</button>

	</fieldset>
</div>
		</form>
	</div>
</div>
</div>
</div>
</section>
</body>
</html>