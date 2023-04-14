$(function() {
     $("#sign_account3").submit(function() {
    	 if (!$("input[name='accountPassCon1']").val()) {
             alert("기존비밀번호를 입력하세요.");
             $("input[name='accountPassCon1']").focus();
             return false;
         }
          if ($("input[name='accountPass1']").val() != $("input[name='accountPassCon1']").val()) {
             alert("기존비밀번호가 일치하지 않습니다.");
             $("input[name='accountPassCon1']").focus;
             return false;
         }
    	 
    	 
    	 
    	 if(!$("input[name='accountPass']").val( )) {
             alert("새로운계좌 비밀번호를 입력하세요.");
             $("input[name='accountPass']").focus( ); 
             return false;
         }
         var regexp_accountPass = /^[0-9]{4}$/;
         var accountPass_check = $("input[name='accountPass']").val();
         if (!regexp_accountPass.test(accountPass_check)) {
             alert("계좌 비밀번호는 4자리 숫자만 가능합니다.");
             $("input[name='accountPass']").focus( ); 
             return false;
         }
         if (!$("input[name='accountPassCon']").val()) {
            alert("새로운비밀번호를 확인하세요.");
            $("input[name='accountPassCon']").focus();
            return false;
        }
         if ($("input[name='accountPass']").val() != $("input[name='accountPassCon']").val()) {
            alert("비밀번호가 일치하지 않습니다.");
            $("input[name='accountPassCon']").focus;
            return false;
        }
});
 });