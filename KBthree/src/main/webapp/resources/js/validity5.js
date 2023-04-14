$(function() {
	$("#checkForm").submit(function() {

		if (!$("input[name='subject']").val()) {
			alert("제목을 입력하세요.");
			$("input[name='subject']").focus();
			return false;
		}
		 if (!$("input[name='address']").val()) {
		 alert("주소를 입력하세요.");
		 $("input[name='address']").focus();
		 return false;
		 }
		 if (!$("input[name='phonenumber']").val()) {
		 alert("휴대번호를 입력하세요.");
		 $("input[name='phonenumber']").focus();
		 return false;
		 }
		  var regexp_phonenumber = /^[0-9]{10,100}$/;
		  var phonenumber_check = $("input[name='phonenumber']").val();
		  if (!regexp_phonenumber.test(phonenumber_check)) {
		  alert("휴대번호는 공백을 제외한 숫자로 10~100자만 입력할 수 있습니다.");
		  $("input[name='phonenumber']").focus();
		  return false;
		  }
		 if ($("select[name='businesschoice'] > option:selected").index() < 1) {
		 alert("상담 카테고리를 선택하세요.");
		 $("select[name='businesschoice']").focus();
		 return false;
		 }
		 if (!$("#terms").is(":checked")) {
			 alert("개인정보 수집약관을 동의해야 신청이 가능합니다.");
			 $("#terms").focus();
			 return false;
		 }
	});
});
