$(function(){
	$("#idserch").submit(function(){
if (!$("input[name='namecheck']").val()) {
			alert("이름을 입력하세요.");
			$("input[name='namecheck']").focus();
			return false;
		}
         if ($("input[name='name2']").val() != $("input[name='namecheck']").val()) {
			alert("이름이 일치하지 않습니다.");
			$("input[name='namecheck']").focus;
			return false;
		}
         if (!$("input[name='birthcheck']").val()) {
 			alert("생년월일을 입력하세요.");
 			$("input[name='birthcheck']").focus();
 			return false;
 		}
          if ($("input[name='birthDay2']").val() != $("input[name='birthcheck']").val()) {
 			alert("생년월일이 일치하지 않습니다.");
 			$("input[name='birthcheck']").focus;
 			return false;
 		}
          if (!$("input[name='numcheck']").val()) {
  			alert("계좌번호를 입력하세요.");
  			$("input[name='numcheck']").focus();
  			return false;
  		}
           if ($("input[name='accountNumber2']").val() != $("input[name='numcheck']").val()) {
  			alert("계좌번호가 일치하지 않습니다.");
  			$("input[name='numcheck']").focus;
  			return false;
  		}
           if (!$("input[name='passcheck']").val()) {
   			alert("계좌 비밀번호를 입력하세요.");
   			$("input[name='passcheck']").focus();
   			return false;
   		}
            if ($("input[name='accountPassword2']").val() != $("input[name='passcheck']").val()) {
   			alert("비밀번호가 일치하지 않습니다.");
   			$("input[name='passcheck']").focus;
   			return false;
   		}
	});
});