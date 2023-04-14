$(function() {
	 $("#signupForm").submit(function() {
		 if (!$("input[name='id']").val( )) {
			 alert("아이디를 입력하세요.");
			 $("input[name='id']").focus();
			 return false;
		 }		 
	    var regexp_userid = /^[a-zA-Z0-9]{4,13}$/;
	 	var userid_check = $("input[name='id']").val();
		 if (!regexp_userid.test(userid_check)) {
			 alert("아이디는 공백을 제외한 알파벳 대소문자로 시작하고 4~13자리만 입력할 수 있습니다.");
			 $("input[name='id']").focus();
			 return false;
		 }		 	 
		 if (!$("input[name='pass']").val()) {
			 alert("비밀번호를 입력하세요.");
			 $("input[name='pass']").focus();
			 return false;
		 }
//	  var regexp_password = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,16}$/;
//	 	var password_check = $("input[name='pass']").val();
//		 if (!regexp_password.test(password_check)) {
//			 alert("비밀번호는 공백을 제외한 영문, 숫자, 특수문자를 포함한 8~16자리만 입력할 수 있습니다.");
//			 $("input[name='pass']").focus();
//			 return false;
//		 }		 	 
		 
		 if (!$("input[name='pwdre']").val()) {
			 alert("비밀번호를 확인하세요.");
			 $("input[name='pwdre']").focus();
			 return false;
		 }
		 		 
		 if ($("input[name='pass']").val() != $("input[name='pwdre']").val()) {
			 alert("비밀번호가 일치하지 않습니다.");
			 $("input[name='pwdre']").focus();
			 return false;
		 }
	
			 if (!confirm("패스워드를 변경합니다.")) {
				 return false;
			}
		  });
	});