	$(function() {
	 $("#dbidCheck").click(function() {
		 var id = $('#id').val();
		 $.ajax({
		  url : './IdCheck.me',
		  type : 'get',

		  data : {
			  id : id
		  },
		  success : function(result) {

			  console.log("아이디 값 - " + result);
			  //alert(result);

			  if ($.trim(result) == 1) {
				  alert("이미 등록된 아이디입니다.");
				  $("#id").focus();
			  } else {
				  alert("등록할 수 있는 아이디입니다.");
				  $('#idCheck').val("1");
				  $("#name").focus();
			  }
		  }
		 });
	 });
 });
	function cancel() {
		if (confirm("정말로 취소하시겠습니까?")) {
	location.href = "./LoginView.me";
	}
	}
	$(document).ready(function(){            
	    var now = new Date();
	    var year = now.getFullYear();
	    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
	    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
	    for(var i = 1900 ; i <= year ; i++) {
	        $('#year').append('<option value="' + i + '">' + i + '년</option>');    
	    }

	    for(var i=1; i <= 12; i++) {
	        var mm = i > 9 ? i : "0"+i ;            
	        $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
	    }
	    
	    for(var i=1; i <= 31; i++) {
	        var dd = i > 9 ? i : "0"+i ;            
	        $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
	    }
	    $("#year  > option[value="+year+"]").attr("selected", "true");        
	    $("#month  > option[value="+mon+"]").attr("selected", "true");    
	    $("#day  > option[value="+day+"]").attr("selected", "true");       

	})
