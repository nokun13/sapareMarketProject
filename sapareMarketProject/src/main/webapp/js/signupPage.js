$(document).ready(function(){
	 $('.error_msg').hide();
	 $('.numsign').hide();
	 
/* 	 $('#reAuthcode').on('click',function(){
		 if(chkhp($('.phone_number').val())){
		 $('.numsign').show();
		 }
	 });
	 */
	 
	// function으로 파라미터값을 받아옴  
  	function getParam(sname) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);
	    var sval = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == sname) { sval = temp[1]; }
	    }
	    return sval;
	};  
	 
	// 존재하는 아이디 알람
	var existId = getParam("existId");
	
	if (existId == 1) {
		alert("이미 존재하는 아이디입니다.");
	};
	 
	
	 $('.login_btn').on('click',function(){
		 
	
$.each($('.auth_form_box input'), function(index,value){
	$('.email_area').focusout(function(){
		if($('.email_sign').val()==""){
			$('#emailerror').css('display','inline-block');
			
		}else if(f != ""){
			 $("#emailerror").css('display', 'none');
		}
	});
	
	$('.password_box').focusout(function(){
		if($('.password_input').val()==""){
			$('#pwerror').css('display','inline-block');
			
		}else if(f != ""){
			 $("#pwerror").css('display', 'none');
		}
	});
	
	$('.phone_area').focusout(function(){
		if($('.phone_number').val()==""){
			$('#numerror').css('display','inline-block');
			
		}else if(f != ""){
			 $("#numerror").css('display', 'none');
		}
	});
	
});  //.each

if (!chkemail($('.email_sign').val())) {
	alert('이메일을 확인해 주세요');
	$('.email_sign').focus();
	return false;
}

if (!chkpw($('.password_input').val())) {
	alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.');
	$('.password_input').focus();
	return false;
} 


if (!chkhp($('.phone_number').val())) {
	alert('핸드폰 번호를 확인해 주세요');
	$('phone_number').focus();
	return false;
}


	 });
}); //ready function
function chkemail(str) { //이메일
	var Reg_email = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

	if (!Reg_email.test(str)) {
		console.log(str);

		return false;
	}
	return true;
}

function chkpw(str) { //비밀번호 제약조건
	var Rex_pw = /^[A-Za-z0-9]{6,15}$/;
    var chk_num = str.search(/[0-9]/g);
    var chk_eng = str.search(/[a-z]/ig);

    if(chk_num < 0 || chk_eng < 0)

  
        return false;
    

	if (!Rex_pw.test(str))
		return false;
	
	return true;
}

function chkhp(str) { //핸드폰번호 제약조건
	var Reg_hp =  /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	if (!Reg_hp.test(str))
		return false;
	return true;
}