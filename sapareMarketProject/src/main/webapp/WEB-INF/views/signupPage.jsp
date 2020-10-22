<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
    padding: 3px 3px 3px 14px;
    font-size: 14px;
}

.email_title ,.password_title ,.phone_title ,.terms_text{
margin-top: 25px;
margin-bottom: 10px;
}

.sign_box .phone_area .phone_number {
    width: 300px;
    margin-right: 5px;
}

.sign_box .phone_area button {
    width: 75px;
    height: 40px;
    border: 1px solid #0484f6;
    color: #0484f6;
    font-size: 14px;
    border-radius: 3px;
}

button{
background: none;
cursor: pointer;}

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
margin-left: 13px;
font-size: 14px;
color: red;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="signup">
		<div class="sign_box auth_common_box">
			<div class="title">
				<span class="title_text">회원가입</span>
			</div>
			<div class="auth_form_box">
				<form>
					<div class="email_title">아이디(이메일)</div>
					<div class="email_area">
						<input type="email" value="" class="email_sign"
							placeholder="이메일 주소 입력" name="email">
					</div>
					<div><div class="error_msg">이메일을 입력해주세요.</div></div>
					<div class="password_title">비밀번호</div>
					<div class="password_box">
						<input type="password" class="password_input" value=""
							placeholder="영문, 숫자, 특수문자 포함 6~15자" name="password">
						
					</div>
					<div><div class="error_msg">비밀번호를 입력해주세요.</div></div>
					<div class="phone_title">휴대폰번호</div>
					<div class="phone_area">
						<input type="tel" name="phoneNumber" class="phone_number"
							placeholder="숫자만 입력" value="">
						<button type="button" id="reAuthcode">인증요청</button>
					</div>
					<div><div class="error_msg">전화번호를 입력해주세요.</div></div>
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
						<button class="login_btn" type="submit">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
