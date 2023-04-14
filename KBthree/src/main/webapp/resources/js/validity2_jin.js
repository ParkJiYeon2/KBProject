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
		 if(!$("input[name='name']").val( )) {
			 alert("이름을 입력하세요.");
			 $("input[name='name']").focus( ); 
			 return false;
		 }
		 var regexp_name = /^[가-힣]{2,4}$/;
		 var name_check = $("input[name='name']").val();
		 if (!regexp_name.test(name_check)) {
			 alert("이름은 공백을 제외한 한글 2~4자만 입력할 수 있습니다.");
			 $("input[name='name']").focus( ); 
			 return false;
		 }		
		 if (!$("input[id='postcode']").val()) {
			 alert("우편번호를 입력하세요.");
			 $("input[id='postcode']").focus();
			 return false;
		 }		 
			 var regexp_postcode = /^[0-9]{5,5}/;
			 var postcode_check = $("input[id='postcode']").val();
			 if(!regexp_postcode.test(postcode_check)){
				 alert("우편번호는 숫자로만 이루어진 5자리 숫자여야 합니다..");
				 $("input[id='postcode']").focus();
				 return false;
			 }
			 if (!$("input[id='address']").val()) {
				 alert("주소를 입력하세요.");
				 $("input[id='address']").focus();
				 return false;
			 }		
			 if (!$("input[id='detailAddress']").val()) {
				 alert("상세주소를 입력하세요.");
				 $("input[id='detailAddress']").focus();
				 return false;
			 }		
			 if (!$("input[id='email']").val()) {
				 alert("이메일을 입력하세요.");
				 $("input[id='email']").focus();
				 return false;
			 }		 
//			 var regexp_email = /^[a-zA-z0-9]{4,20}/;
//			 var email_check = $("input[id='email']").val();
//			 if(!regexp_email.test(email_check)){
//				 alert("이메일은 영문 또는 숫자로만 이루어져야 합니다.");
//				 $("input[id='email']").focus();
//				 return false;
//			 }
			 if(!$("input[id='phonenum']").val( )) {
				 alert("전화번호를 입력하세요.");
				 $("input[id='phonenum']").focus( ); 
				 return false;
			 }
			 var regexp_phonenum = /^[0-9]{4,4}$/;
			 var phonenum_check = $("input[id='phonenum']").val();
			 if (!regexp_phonenum.test(phonenum_check)) {
				 alert("전화번호는 숫자만 입력할 수 있습니다.");
				 $("input[id='phonenum']").focus( ); 
				 return false;
			 }
//			 var regexp_phonenum = /^\d{3}-\d{4}-\d{4}$/;
//			 var phonenum_check = $("input[id='phoneNum']").val();
//			 if (!regexp_phonenum.test(phonenum_check)) {
//				 alert("전화번호는 '000-0000-0000' 형태의 숫자만 입력할 수 있습니다.");
//				 $("input[id='phoneNum']").focus( ); 
//				 return false;
//			 }
			 if(!$("input[id='phonenum2']").val( )) {
				 alert("전화번호를 입력하세요.");
				 $("input[id='phonenum2']").focus( ); 
				 return false;
			 }
			 var regexp_phonenum = /^[0-9]{4,4}$/;
			 var phonenum_check = $("input[id='phonenum2']").val();
			 if (!regexp_phonenum.test(phonenum_check)) {
				 alert("전화번호는 숫자만 입력할 수 있습니다.");
				 $("input[id='phonenum2']").focus( ); 
				 return false;
			 }
//			 if ($("select[name='job'] > option:selected").index() < 1) {
//				 alert("직업을 선택해 주세요.");
//				 $("select[name='job']").focus();
//				 return false;
//			 }
	
			 if (!confirm("수정을 완료합니다.")) {
				 return false;
			}

		  });
	});