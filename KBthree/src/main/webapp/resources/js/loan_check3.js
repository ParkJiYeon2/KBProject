$(function(){
	$("#idpass").submit(function(){
if (!$("input[name='idcheck']").val()) {
			alert("아이디를 입력하세요.");
			$("input[name='idcheck']").focus();
			return false;
		}
         if ($("input[name='ip']").val() != $("input[name='idcheck']").val()) {
			alert("아이디가 일치하지 않습니다.");
			$("input[name='idcheck']").focus;
			return false;
		}
	});
});