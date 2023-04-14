$(function() {
     $("#sign_account5").submit(function() {
    	 if (!$("input[name='name2']").val()) {
             alert("이름을 입력하세요.");
             $("input[name='name2']").focus();
             return false;
         }
          if ($("input[name='name1']").val() != $("input[name='name2']").val()) {
             alert("존재하지 않는 회원이름입니다.");
             $("input[name='name2']").focus;
             return false;
         }
          if (!$("input[name='accountNum2']").val()) {
              alert("계좌번호을 입력하세요.");
              $("input[name='accountNum2']").focus();
              return false;
          }
           if ($("input[name='accountNum1']").val() != $("input[name='accountNum2']").val()) {
              alert("존재하지 않는 계좌번호 입니다..");
              $("input[name='accountNum2']").focus;
              return false;
          }
           if (!$("input[name='phoneNum2']").val()) {
               alert("휴대폰번호를 입력하세요.");
               $("input[name='phoneNum2']").focus();
               return false;
           }
            if ($("input[name='phoneNum1']").val() != $("input[name='phoneNum2']").val()) {
               alert("존재하지 않는 휴대폰번호입니다..");
               $("input[name='phoneNum2']").focus;
               return false;
           }
});
 });