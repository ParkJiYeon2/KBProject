$(function() {
	$("#checkForm").submit(function() {

		if (!$("input[name='subject']").val()) {
			alert("제목을 입력하세요.");
			$("input[name='subject']").focus();
			return false;
		}
//		var regexp_subject = /[^?a-zA-Z0-9/]{2,50}$/;
//		var subject_check = $("input[name='subject']").val();
//		if (!regexp_subject.test(subject_check)) {
//			alert("제목은 모든글자 2~50자만 입력할 수 있습니다.");
//			$("input[name='subject']").focus();
//			return false;
//		}
		 if (!$("input[name='address']").val()) {
		 alert("주소를 입력하세요.");
		 $("input[name='address']").focus();
		 return false;
		 }
//		 if (!$("input[name='phoneNumber']").val()) {
//		 alert("휴대번호를 입력하세요.");
//		 $("input[name='phoneNumber']").focus();
//		 return false;
//		 }
//		  var regexp_phoneNumber = /^[0-9]{10,100}$/;
//		  var phoneNumber_check = $("input[name='phoneNumber']").val();
//		  if (!regexp_phoneNumber.test(phoneNumber_check)) {
//		  alert("휴대번호는 공백을 제외한 숫자로 10~100자만 입력할 수 있습니다.");
//		  $("input[name='phoneNumber']").focus();
//		  return false;
//		  }
		 if ($("select[name='businesschoice'] > option:selected").index() < 1) {
		 alert("상담 카테고리를 선택하세요.");
		 $("select[name='businesschoice']").focus();
		 return false;
		 }
//		 if (!$("textarea[name='text']").val()) {
//		 alert("내용을 입력하세요.");
//		 $("textarea[name='text']").focus();
//		 return false;
//		 }
//		 if (!$("input[name='reservation']").val()) {
//		 alert("상담예약 날짜를 선택해주세요.");
//		 $("input[name='reservation']").focus();
//		 return false;
//		 }
//		 if (!$("input[name='terms']").is(":checked")) {
//		 alert("개인정보 수집약관을 체크해주세요.");
//		 $("input[name='terms']:eq(0)").focus();
//		 return false;
//		 }
	});
});