<%@page import="dto.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
	String contentPage = request.getParameter("");
	if (contentPage == null)
		contentPage = "mainPage.jsp";

	String fid = (String) session.getAttribute("logOk");
	String id = (String) session.getAttribute("id");
	System.out.println(id);
	boolean logok = false;
	boolean admin = false;
	if (fid != null)
		if (fid.equals("ok")) {
			logok = true;
			if (id.equals("admin@gg.com")) {
				admin = true;
				System.out.println("admin");
			}
		}
%>



<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">

/* -------------카테고리--------------*/
.menubtn {
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
}

.dropdown-content {
	position: absolute;
	background-color: #f1f1f1;
	min-width: 795px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	display: none;
	margin: -5px 0 0 17px;
}

.dropdown-content li {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	height: auto;
	float: left;
	width: 100px;
	height: auto;
	list-style: none;
}

.dropdown-content li:hover {
	background-color: #ddd;
}

.categorymenu:hover .dropdown-content {
	display: flex;
	flex-direction: column;
	z-index: 101;
}

* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	/* color: #ffffff; */
}

.clear {
	clear: both;
}

/* ---------- 헤더 ------------- */
#top {
	display: flex;
	justify-content: center;
	width: max-content;
	padding-top: 10px;
	margin: auto;
}

.wrap {
	/* width: 1191.34px; */
	width: 1245px;
	margin-left: 47px;
}

.categorymenu {
	float: left;
	display: inline-block;
	position: relative;
	padding-right: 10px;
}

.categorymenu img {
	width: 55px;
	height: 50px;
	margin-top: 22px;
	padding-bottom: 40px;
}

#logo {
	float: left;
	margin-top: 30px;
	padding-right: 40px;

	/*  border:solid 1px #000000; */
}

#logo img {
	margin-left: -10%;
	width: 186px;
	height: 68px;
}

#search {
	float: left;
	font-family: "Sans-serif";
	font-size: 12px;
	color: #ffffff;
	margin-top: 42px;
	border: solid 2px #F2F2F2;
}

#search_form {
	float: left;
	width: 450px;
	height: 30px;
	background-color: #ffffff;
	border: solid 1px #ffffff;
	margin-left: 5px;
	outline: none;
	margin-top: 3px;
	font-size: large;
	font-family: inherit;
}

.ss {
	background-repeat: no-repeat;
	margin-top: 2px;
	width: 42px;
	height: 32px;
	border: 0px;
	outline: none;
	cursor: pointer;
}

/* 상단 메뉴 */
#top_menu {
	padding-left: 60px;
	position: relative;
	float: left;
	margin-top: 53px;
	/* border:solid 1px #000000; */
}

#top_menu .signup, #mylogin, .logout, .mypage {
	font-size: 17px;
	font-weight: bolder;
	color: #999999;
	margin-left: 10px;
	text-decoration: none;
}

.sale {
	background-color: rgb(41, 171, 226);
	border: 1px rgb(41, 171, 226);
	font-size: 17px;
	font-weight: bolder;
	color: white;
	text-decoration: none;
	margin-left: 2px;
	padding: 10px 20px 10px 20px;
	border-radius: 5px;
	margin-right: 20px;
}

/* 메인 메뉴 */
#main_menu {
	min-width: 1300px;
	height: 38px;
	background-color: #ffffff;
	border-bottom: solid 2px #F2F2F2;
	margin-top: -45px;
}

#headerend {
	clear: both;
}

#signup {
	display: flex;
	justify-content: center;
	margin-top: 150px;
}

div .title_text {
	font-size: 30px;
	font-weight: 600;
	letter-spacing: 5px;
	margin-left: 35%;
}

.auth_form_box {
	margin-top: 50px;
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

.email_title, .password_title {
	margin-top: 25px;
	margin-bottom: 10px;
}

.login_btn {
	width: 100%;
	height: 57px;
	background: none;
	background-color: #0484f6;
	font-size: 17px;
	color: #fff;
	margin-bottom: 30px;
	outline: none;
	border: none;
	cursor: pointer;
}

.error_msg {
	margin-left: 8px;
	font-size: 14px;
	color: red;
}

.hh {
	margin-top: 50px;
	display: flex;
	justify-content: center;
	display: flex;
}

.ask {
	font-size: 14px;
}

.modallogin {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-contentlogin {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 23%;
	height: 53%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.emailid {
	margin-top: 12%
}

input[type=email] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	outline: none;
}

.password_input {
	width: 100%;
	height: 95%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	outline: none;
	resize: none;
}

.ll {
	display: grid;
	height: 50px;
}

.modalbtnlogin {
	background-color: #29ABE2;
	color: white;
	font-size: 18px;
	font-weight: bolder;
	border: 1px solid #29ABE2;
	cursor: pointer;
	outline: none;
}

.bottom {
	display: flex;
	justify-content: center;
}

#mylogin {
	background-color: white;
	border: none;
	outline: none;
	cursor: pointer;
}

#gg {
	display: block;
}

#searchbtn {
	background-color: white;
	border: none;
	outline: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	//윈도우 창을 닫을 때 로그아웃 처리
	function closePage(event) {
		if (event.clientY < 0) {
			// 로그아웃 처리
		}

	}

	document.onkeydown = function() {
		// 새로고침 방지 ( Ctrl+R, Ctrl+N, F5 )
		if (event.ctrlKey == true
				&& (event.keyCode == 78 || event.keyCode == 82)
				|| event.keyCode == 116) {
			event.keyCode = 0;
			event.cancelBubble = true;
			event.returnValue = false;
		}

		// 창 닫기( Alt+F4 ) 방지 
		if (event.keyCode == 115) { // F4 눌렀을 시
			// 로그아웃 처리

		}

		// 윈도우 창이 닫힐 경우
		if (event.keyCode == 505) {
			alert(document.body.onBeforeUnload);
		}
	}

	var login =
<%=logok%>
	;
	var admin =
<%=admin%>
	;
	$(document).ready(function() {
		$('.mypage').hide();
		$('.modalbtnlogin').on('click', modalRun);

		$('#mylogin').on('click', function() {
			$(".modallogin").css("display", "block");
		});

		$('.close').on('click', function() {
			$(".modallogin").css("display", "none");
		});

		$('.error_msg').hide();

		$('.login_btn').on('click', function() {

			$.each($('.auth_form_box input'), function(index, value) {
				$('.email_area').focusout(function() {
					if ($('.email_sign').val() == "") {
						$('#emailerror').css('display', 'inline-block');

					} else if (f != "") {
						$("#emailerror").css('display', 'none');
					}
				});

			}); //.each

			if (!chkemail($('.email_sign').val())) {
				alert('이메일을 확인해 주세요');
				$('.email_sign').focus();
				return false;
			}
			if ($('.password_input').val() == "") {
				alert('비밀번호를 입력해주세요');
				$('.password_input').focus();
				return false;
			}

			if (!chkpw($('.password_input').val())) {
				alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');
				$('.password_input').focus();
				return false;
			}

			// 엔터 기능 추가
			var pw_input1 = document.getElementById("email_sign");
			var pw_input2 = document.getElementById("password_input");

			pw_input1.addEventListener("keyup", function(event) {
				if (event.keyCode === 13) {
					event.preventDefault();
					document.getElementById("login_btn").click();
				}
			});

			pw_input2.addEventListener("keyup", function(event) {
				if (event.keyCode === 13) {
					event.preventDefault();
					document.getElementById("login_btn").click();
				}
			});
		});
		///////////////////////////////////

		var id = $('#top_menu a:nth-child(3)').text();

		console.log(admin);
		console.log(login);

		$('#top_menu a:nth-child(2)').hide();
		/* if(admin==false)
			$('#admin').remove(); */

		if (login == true) {

			$('.login').each(function() {
				$('.logout').show();
				$('.login').hide();
				$('.signup').hide();
				$('.mypage').show();
			});
		} else if (login == false) {

			$('.logout').click(function() {
				$('.logout').hide();
				$('.login').show();
				$('.signup').show();
				console.log(login);
			});

		}

		$(".ss").click(function() {
			$("#searchform").attr("action", "search.do");
		});

	}); //Readyfunction

	//모달 
	function modalRun() {
		$('.mo').attr('action', 'helpPage.do').submit();
	}////////////////

	function chkemail(str) { //이메일
		var Reg_email = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

		if (!Reg_email.test(str)) {

			return false;
		}
		return true;
	}

	function chkpw(str) { //비밀번호 제약조건
		var Rex_pw = /^[A-Za-z0-9]{6,15}$/;

		if (!Rex_pw.test(str))
			return false;

		return true;
	}
</script>
</head>
<body onbeforeunload="closePage(event)" oncontextmenu="return false">

	<section id="top">
		<div class="wrap">
			<div id="all">
				<div class="categorymenu">
					<img class="menubtn" src="image/menucategory.png">
					<div class="dropdown-content">
						<ul class="bigCategory">
							<li><a href="search.do?searchWord=스포츠">스포츠/레저</a></li>
							<li><a href="search.do?searchWord=디지털">디지털/가전</a></li>
							<li><a href="search.do?searchWord=의류">의류</a></li>
							<li><a href="search.do?searchWord=취미">취미</a></li>
							<li><a href="search.do?searchWord=뷰티미용">뷰티미용</a></li>
							<li><a href="search.do?searchWord=티켓">티켓</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
							<li><a href="search.do?searchWord=기타">기타</a></li>
						</ul>
					</div>
				</div>

				<a id="logo" href="http://localhost:8090/sapare/mainPage.do"><img
					src="image/saparelogo3.png"></a>

				<div id="gg">
					<div id="search">
						<!-- <div id="search_title">SEARCH</div> -->
						<form id="searchform" method="post" action="search.do">
							<input type="text" id="search_form" name="searchWord"
								placeholder="어떤 상품을 찾고 있나요?">
							<button id="searchbtn">
								<img class="ss" src='image/search1.PNG'>
							</button>
						</form>
					</div>
				</div>
				<div id="top_menu">
					<a class="sale" href="">판매하기</a> <a class="logout"
						href="http://localhost:8090/sapare/logout.do">로그아웃</a>
					<button type="button" id="mylogin">
						<a class="login">로그인</a>
					</button>
					<!-- 로그인 모달창 시작  -->
					<div id="myModallogin" class="modallogin">
						<div id="signup">
							<!-- Modal content -->
							<div class="modal-contentlogin">
								<span class="close">&times;</span>

								<form action="loginCheck.do" class="loginform" method="post">
									<div class="email_title">아이디(이메일)</div>
									<div class="email_area">
										<input type="email" value="" class="email_sign"
											id="email_sign" placeholder="이메일 주소 입력" name="memberId">
									</div>
									<div>
										<div class="error_msg" id="emailerror">이메일을 입력해주세요.</div>
									</div>
									<div class="password_title">비밀번호</div>
									<div class="password_box">
										<input type="password" class="password_input"
											id="password_input" value="" placeholder="비밀번호"
											name="memberPw">

									</div>
									<p></p>
									<div class="bottom">
										<input class="login_btn" id="login_btn" type="submit"
											value="로그인"></input>
									</div>

								</form>

							</div>
						</div>
					</div>

					<!-- 로그인모달창 끝 -->


					<a class="signup" href="http://localhost:8090/sapare/signupPage.do">회원가입</a>
					<a class="mypage" href="http://localhost:8090/sapare/mypage.do">마이페이지</a>


				</div>
			</div>
		</div>
		<!-- top_menu -->
		<div class="clear"></div>
	</section>

	<!-- section top -->

	<nav id="main_menu"></nav>
	<div id="headerend"></div>

</body>
</html>