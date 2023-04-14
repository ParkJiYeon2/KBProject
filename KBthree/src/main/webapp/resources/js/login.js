$(function() {
	 $("#login").submit(function() {
		 if (!$("input[name='id']").val( )) {
			 alert("아이디를 입력하세요.");
			 $("input[name='id']").focus();
			 return false;
		 }
		 if (!$("input[name='pass']").val()) {
			 alert("비밀번호를 입력하세요.");
			 $("input[name='pass']").focus();
			 return false;
		 }
	  });
});