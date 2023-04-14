$(function() { 
	$("#sign_account").submit(function() {
if (!$("input[name='name']").val()) {
		alert("예금주명을 입력해주세요.");
		$("input[name='name']").focus();
		return false;
	}
     var regexp_name = /^[가-힣]{2,4}$/;
     var name_check = $("input[name='name']").val();
     if (!regexp_name.test(name_check)) {
 		alert("예금주명은 한글로 최대 4글자까지 입력이 가능합니다..");
 		$("input[name='name']").focus();
 		return false;
 	}
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
//      if (!$("input[name='bankName']").val()) {
//  		alert("은행명을 입력하세요.");
//  		$("input[name='bankName']").focus();
//  		return false;
//  	}
//       var regexp_bankName = /^[가-힣]{2,10}$/;
//       var bankName_check = $("input[name='bankName']").val();
//       if (!regexp_bankName.test(bankName_check)) {
//  		alert("은행명은 한글로 최소 2글자이상 최대 10글자까지 입력이 가능합니다.");
//  		$("input[name='bankName']").focus();
//  		return false;
//  	}
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
          if(!$("input[name='accountNum']").val( )) {
              alert("'-'를 제외한 계좌번호 14자리를 입력해주세요.");
              $("input[name='accountNum']").focus( ); 
              return false;
          }
       var regexp_accountNum = /^[0-9]{14,14}$/;
       var accountNum_check = $("input[name='accountNum']").val();
       if (!regexp_accountNum.test(accountNum_check)) {
           alert("계좌번호는 '-'을 제외한 14자리 숫자만 입력이 가능합니다.");
           $("input[name='accountNum']").focus( ); 
           return false;
       }
       if(!$("input[name='accountPass']").val( )) {
           alert("계좌번호 4자리를 입력해주세요.");
           $("input[name='accountPass']").focus( ); 
           return false;
       }
    var regexp_accountPass = /^[0-9]{4,4}$/;
    var accountPass_check = $("input[name='accountPass']").val();
    if (!regexp_accountPass.test(accountPass_check)) {
        alert("계좌비밀번호는 4자리 숫자만 입력이 가능합니다.");
        $("input[name='accountPass']").focus( ); 
        return false;
    }
       
       if(!$("input[name='accountPassCon']").val( )) {
      	 alert("계좌비밀번호를 확인해주세요.");
      	 $("input[name='accountPassCon']").focus( );
      	 return false;
       }
       if($("input[name='accountPass']").val( ) != $("input[name='accountPassCon']").val( )) {
      	 alert("계좌비밀번호가 일치하지 않습니다.");
      	 $("input[name='accountPass']").focus( );
      	 return false;
      	 
       }
	});
});