$(function() {
     $("#sign_account4").submit(function() {
    	 if (!$("input[name='accountPass3']").val()) {
             alert("계좌비밀번호를 입력하세요.");
             $("input[name='accountPass3']").focus();
             return false;
         }
          if ($("input[name='accountPass3']").val() != $("input[name='accountPassCon3']").val()) {
             alert("비밀번호가 맞지 않습니다.");
             $("input[name='accountPassCon3']").focus;
             return false;
         }
});
 });