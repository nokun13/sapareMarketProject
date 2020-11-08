<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 회원가입</title>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    font-weight: 400;
    color: #333;
   }
   
div {
display:block;

}

#signup {
display: flex;
justify-content: center;
margin-top :150px;

}    


div .title_text {
font-size: 30px;
font-weight: 600;
letter-spacing: 5px;
margin-left:35%;
}


.auth_form_box {

margin-top : 50px;


}


.auth_form_box input {
    border-radius: 3px;
    border: 1px solid #e8ebed;
    height: 38px;
    width: 95%;
    background-color: #fff;
    padding: 3px 3px 3px 8px;
    font-size: 14px;
    outline: none;
}

.email_title ,.password_title ,.phone_title ,.terms_text{
margin-top: 25px;
margin-bottom: 10px;
}

.sign_box .phone_area .phone_number {
    width: 300px;
    margin-right: 5px;
}

.sign_box .phone_area #reAuthcode {
    width: 75px;
    height: 40px;
    border: 1px solid #0484f6;
    color: #0484f6;
    font-size: 14px;
    border-radius: 3px;
}

#reAuthcode {
background: none;
cursor: pointer;

}

.login_btn{
background: none;
cursor: pointer;
}
.terms_text {
font-size: 12px;
color: gray;
}

.sign_box .login_btn {
    width: 400px;
    height: 57px;
    background-color: #0484f6;
    font-size: 17px;
    color: #fff;
    margin-bottom: 30px;
}

.error_msg {
margin-left: 8px;
font-size: 14px;
color: red;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
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

 

	</script>
</head>
<body>
	<div id="signup">
		<div class="sign_box auth_common_box">
			<div class="title">
				<span class="title_text">회원가입</span>
			</div>
			<div class="auth_form_box">
				<form action="signup.do" method="post">
					<div class="email_title">아이디(이메일)</div>
					<div class="email_area" >
						<input type="email" name="memberId" value="" class="email_sign"
							placeholder="이메일 주소 입력" name="email">
					</div>
					<div><div class="error_msg" id="emailerror">이메일을 입력해주세요.</div></div>
					<div class="password_title">비밀번호</div>
					<div class="password_box">
						<input type="password" name="memberPw" class="password_input" value=""
							placeholder="영문, 숫자  포함 6~15자" name="password" maxlength="15">
						
					</div>
					<div><div class="error_msg" id="pwerror">비밀번호를 입력해주세요.</div></div>
					<div class="phone_title">휴대폰번호</div>
					<div class="phone_area">
						<input type="tel" name="phoneNum" class="phone_number"
							placeholder="숫자만 입력" maxlength="11" value="" pattern="[0-9]+">
						<!-- <input type="button" id="reAuthcode" value="인증요청 "/>
						<p></p>
						<input type="tel" name="num" class="numsign" placeholder="인증번호 4자리" value="" style="width: 300px"> -->
					</div>
					<div><div class="error_msg" id="numerror">전화번호를 입력해주세요.</div></div>
					<div class="terms_text">
						가입시&nbsp;<a href="http://localhost:8090/sapare/information1.do"
							target="blank" class="under_link">이용약관</a>&nbsp;및&nbsp;<a
							href="http://localhost:8090/sapare/information2.do" target="blank"
							class="under_link">개인정보 취급방침</a>,&nbsp;<a
							href="http://localhost:8090/sapare/information3.do" target="blank"
							class="under_link">위치정보제공</a>에 동의합니다.
					</div>
					<p></p>
					<div class="bottom login_btn">
						<input  class="login_btn" type="submit" value="회원가입"></input>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
