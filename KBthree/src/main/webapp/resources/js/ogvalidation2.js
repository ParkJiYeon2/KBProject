$(function() { 
	$("#sign_account2").submit(function() {
     if(!$("input[name='phoneNum']").val( )) {
         alert("전화번호를 입력하세요.");
         $("input[name='phoneNum']").focus( ); 
         return false;
     }
     var regexp_phoneNum = /^[0-9]{11,11}$/;
     var phoneNum_check = $("input[name='phoneNum']").val();
     if (!regexp_phoneNum.test(phoneNum_check)) {
         alert("전화번호 양식을 확인하세요.");
         $("input[name='phoneNum']").focus( ); 
         return false;
     }
     if($("select[name='bankName'] > option:selected").index( ) < 1) {
      	 alert("은행을 선택해주세요.");
      	 $("select[name='bankName']").focus( );
      	 return false;
       }
       if($("select[name='accType'] > option:selected").index( ) < 1) {
      	 alert("계좌종류를 선택해주세요.");
      	 $("select[name='accType']").focus( );
      	 return false;
       }
       if (!$("input[name='accountName']").val( )) {
           alert("계좌명을 입력하세요.");
           $("input[name='accountName']").focus();
           return false;
       }
       if (!$("input[name='accountName']").val()) {
     		alert("계좌명을 입력하세요.");
     		$("input[name='accountName']").focus();
     		return false;
     	}
          var regexp_accountName = /^[가-힣]{2,10}$/;
          var accountName_check = $("input[name='accountName']").val();
          if (!regexp_accountName.test(accountName_check)) {
     		alert("계좌명은 한글로 최소 2글자이상 최대 10글자까지 입력이 가능합니다.");
     		$("input[name='accountName']").focus();
     		return false;
          }
	});
});