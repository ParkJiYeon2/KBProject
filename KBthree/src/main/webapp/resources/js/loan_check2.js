$(function(){
	$("#updatecheck").submit(function(){
		if ($("select[name='nameLoan']>option:selected").index()<1) {
			alert("대출 유형을 선택하세요.");
			$("select[name='nameLoan']").focus();
			return false;
		}
		if (!$("input[name='guarDian']").is(":checked")) {
			alert("후견인 여,부를 선택하세요.");
			$("input[name='guarDian']:eq(0)").focus();
			return false;
		}
		if (!$("input[name='useLoan']").is(":checked")) {
			alert("대출용도를 선택하세요.");
			$("input[name='useLoan']:eq(0)").focus();
			return false;
		}
		if (!$("input[name='totalAsset']").is(":checked")) {
			alert("총 자산규모를 선택하세요.");
			$("input[name='totalAsset']:eq(0)").focus();
			return false;
		}
		if (!$("input[name='grossIncome']").is(":checked")) {
			alert("총 소득을 선택하세요.");
			$("input[name='grossIncome']:eq(0)").focus();
			return false;
		}
		if (!$("input[name='totalLiability']").is(":checked")) {
			alert("총 부채를 선택하세요.");
			$("input[name='totalLiability']:eq(0)").focus();
			return false;
		}
		if (!$("input[name='pixExpense']").is(":checked")) {
			alert("고정 지출을 선택하세요.");
			$("input[name='pixExpense']:eq(0)").focus();
			return false;
		}
		if (!$("input[name='comeLoan']").is(":checked")) {
			alert("대출상환 소득을 선택하세요.");
			$("input[name='comeLoan']:eq(0)").focus();
			return false;
		}
		if (!$("input[name='du']").is(":checked")) {
			alert("개인정보 수집 및 이용동의 를 선택하세요.");
			$("input[name='du']:eq(0)").focus();
		return false;
		}
		if ($("input[name='du']").is(":checked")==true) {
		     var du_no = $("input:radio[name=du]:checked").val();
		     if (du_no=='비동의') {
				alert('개인정보 수집 및 이용 비동의 시 이용불가');
				$("input[name='du']:eq(0)").focus();
				return false;
			
		}
		   
		}
		 if (!$("input[name='qu']").is(":checked")) {
			alert("대출신청결과 안내 여부를 선택하세요.");
			$("input[name='qu']:eq(0)").focus();
			return false;
		}
		 if(!$("input[name='name']").val( )) {
        	 alert("성명을 입력하세요.");
        	 $("input[name='name']").focus( ); 
        	 return false;
         }
         var regexp_name = /^[가-힣]{2,4}$/;
         var name_check = $("input[name='name']").val();
         if (!regexp_name.test(name_check)) {
        	 alert("성명은 한글 2-4자만 가능합니다.");
        	 $("input[name='name']").focus( ); 
        	 return false;
         }
         
//         if (!$("input[name='birthDay']").val( )) {
// 			alert("생년월일을 입력하세요.");
// 			$("input[name='birthDay']").focus( );
// 			return false;
// 		}
//          var regexp_birthDay = /^[0-9]{8}$/;
//          var birthDay_check = $("input[name='birthDay']").val();
//          if (!regexp_birthDay.test(birthDay_check)) {
//              alert("생년월일 양식을 확인하세요.");
//              $("input[name='birtheDay']").focus( ); 
//              return false;
// 		}
		 
		 if(!$("input[name='moneyLoan']").val( )) {
             alert("대출금액을 입력하세요.");
             $("input[name='moneyLoan']").focus( ); 
             return false;
         }
         var regexp_moneyLoan = /^[0-9]{7,12}$/;
         var moneyLoan_check = $("input[name='moneyLoan']").val();
         if (!regexp_moneyLoan.test(moneyLoan_check)) {
             alert("대출금액은 100만원부터 1000억 단위까지 가능합니다.");
             $("input[name='moneyLoan']").focus( ); 
             return false;
		}
         
        
         if(!$("input[name='accountNumber']").val( )) {
             alert("계좌번호를 입력하세요.");
             $("input[name='accountNumber']").focus( ); 
             return false;
         }
         var regexp_accountNumber = /^[1-9]{1}[0-9]{13}$/;
         var accountNumber_check = $("input[name='accountNumber']").val();
         if (!regexp_accountNumber.test(accountNumber_check)) {
             alert("계좌번호는 14자만 가능합니다.");
             $("input[name='accountNumber']").focus( ); 
             return false;
         }
         if(!$("input[name='accountPassword']").val( )) {
             alert("계좌 비밀번호를 입력하세요.");
             $("input[name='accountPassword']").focus( ); 
             return false;
         }
         var regexp_accountPassword = /^[0-9]{4}$/;
         var accountPassword_check = $("input[name='accountPassword']").val();
         if (!regexp_accountPassword.test(accountPassword_check)) {
             alert("계좌 비밀번호는 4자리 숫자만 가능합니다.");
             $("input[name='accountPassword']").focus( ); 
             return false;
         }
         if (!$("input[name='psc']").val()) {
			alert("비밀번호를 확인하세요.");
			$("input[name='psc']").focus();
			return false;
		}
         if ($("input[name='accountPassword']").val() != $("input[name='psc']").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("input[name='psc']").focus;
			return false;
		}
         if(!$("input[name='phoneNum']").val( )) {
             alert("전화번호를 입력하세요.");
             $("input[name='phoneNum']").focus( ); 
             return false;
         }
         var regexp_phoneNum = /^[0-9]{10,11}$/;
         var phoneNum_check = $("input[name='phoneNum']").val();
         if (!regexp_phoneNum.test(phoneNum_check)) {
             alert("전화번호 양식을 확인하세요.");
             $("input[name='phoneNum']").focus( ); 
             return false;
         }
         if(!$("input[name='compName']").val( )) {
             alert("직장명을 입력하세요.");
             $("input[name='compName']").focus( ); 
             return false;
         }
         var regexp_compName = /^[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/g;
         var compName_check = $("input[name='compName']").val();
         if (!regexp_compName.test(compName_check)) {
             alert("직장명은 40글자까지 가능합니다.");
             $("input[name='compName']").focus( ); 
             return false;
         }
         if(!$("input[name='email']").val( )) {
             alert("이메일을 입력하세요.");
             $("input[name='email']").focus( ); 
             return false;
         }
         var regexp_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
         var email_check = $("input[name='email']").val();
         if (!regexp_email.test(email_check)) {
             alert("이메일 형식을 확인하세요.");
             $("input[name='email']").focus( ); 
             return false;
         }
        
         
	});
});