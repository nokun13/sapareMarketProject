<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	text-decoration: none;
	margin: 0;
  	padding: 0;
}

input{
	border: 1px solid #e8ebed;
	font-size: 16px;
}

button{
	cursor:pointer;
}

input, button{
	outline: none;
}

div{
	overflow: hidden;
}

header {
	position: sticky;
	top: 0;
	left: 0;
	width: 100%;
	height: 100px;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	transition: 0.6s;
	z-index: 100;
	background-color: cornflowerblue;
}

footer {
	bottom: 0;
	left: 0;
	width: 100%;
	height: 150px;
	display: flex;
	/* justify-content: space-between;*/
	align-items: center;
	z-index: 100;
	background-color: cornflowerblue;
}

header ul {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

ul {
	list-style: none;
	line-height: 10px;
}

header ul li a {
	position: relative;
	margin: 0 5px;
	color: white;
	letter-spacing: 2px;
	font-weight: 500;
	transition: 0.6s;
	font-size: 16px;
}

.side-logo-container {
	display: flex;
}

.text {
	display: flex;
}

.profileArea{
	background-color: lightgray;
	margin: auto;
	width: 950px;
	margin-top: 25px;
}

.flagArea{
	height: 50px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	border-top: #8AB8F4 solid 1px;
}

#memberFlag{
	margin-right: 20px;
}

#profileImageBox{
	position: relative;
	margin-left: 30px;
	margin-top: 20px;
	height: 250px; 
	width: 320px;
	border: #8AB8F4 groove 5px;
	border-radius: 25px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.profileContainer{
	display: flex;
	width: 100%;
	border-top: #8AB8F4 solid 1px;
	border-bottom: #8AB8F4 solid 1px;
}

.memberInfoContainer{
	display: flex;
	width: 100%;
	flex-direction: column;
	margin-left: 20px;
}

.nicknameBox{
	display: inline-flex;
	height: 50px;
	justify-content: space-between;
	align-items: center;
	width: 45%;
	border: #8AB8F4 solid 1px;
}

.memberAbout{
	display: inline-flex;
    align-items: flex-start;
    width: 80%;
    height: 165px;
    border: #8AB8F4 solid 1px;
}

.memberAbout textarea{
	resize: none;
    font-size: 14px;
    border: none;
	outline: none;
}

.memberPointArea{
	height: 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 20%;
	border: #8AB8F4 solid 1px;
}

.menuAndContentArea{
	display: flex;
    width: 100%;
    flex-direction: row;
    height: 1150px;
}

.profileMenu{
	display: flex;
	justify-content: center;
	width: 25%;
}

.menuButtons {
	list-style-type: none;
    margin: 0;
    padding: 0;
    display: flow-root;
    margin-top: 20px;
    width: 100%;
}

.menuButtons li {
	margin-top: 10px;
	width: 85%;
	border-top: #8AB8F4 solid 1px;
	border-bottom: #8AB8F4 solid 1px;
	border-right: #8AB8F4 solid 1px;
	text-align: center;
	border-radius: 0px 20px 20px 0px;
}

/* 현재 페이지에 해당하는 메뉴 버튼 더 길게 만들기 */
.menuButtons li:nth-child(5) {
	width: 100%
}

.menuButtons li a{
	display: block;
	text-decoration: none;
	padding: 20px 0px;
	color: #00008B;
	border-radius: 0px 20px 20px 0px;
}

.menuButtons li a:hover:not(.active) {
    background-color: #694228;
    color: white;
}

/* 현재 페이지에 해당하는 메뉴 버튼 색깔 바꿔주기 */
.menuButtons li:nth-child(5) a {
	background-color: #8AB8F4;
    color: white;
}

.profileContent{
	display: flex;
	width: 80%;
	height: 1150px;
	margin-left: 15px;
	margin-top: 30px;
	flex-direction: column;
}

.contents{
	display: flex;
	flex-direction: column;
	width: 100%;
	height: 100%;
	margin-top: 35px;
	margin-left: 15px;
}

.contents ul{
	list-style: none;
	margin: 0;
}

.contents ul li{
	margin-bottom: 15px;
	display: flex;
	height: 40px;
	flex-wrap: wrap;
}

.contents ul li>div{
	float: left;
}

.contents ul li>div:first-child{
	width: 25%;
	line-height: 35px;
	font-size: 16px;
}

.contents ul li>div:nth-child(2){
	width: 50%;
}

.contents ul li>div:nth-child(2) div{
	line-height: 35px;
	font-size: 16px;
}

.contents ul li>div:nth-child(2) input{
	width: 97%;
	border-radius: 3px;
	height: 38px;
	font-size: 16px;
}

.contents ul li>div:nth-child(3){
	width: 15%;
}

.contents ul li>div:nth-child(3) button{
	border: 1px solid #8AB8F4;
    border-radius: 3px;
    text-align: center;
    color: #8AB8F4;
    padding: 7px 0;
    width: 100%;
    font-size: 15px;
}

.contents ul li button{
	box-shadow: 0px 3px 1px -2px rgba(0,0,0,0.2),
	0px 2px 2px 0px rgba(0,0,0,0.14),
	0px 1px 5px 0px rgba(0,0,0,.12);
	transition: box-shadow 280ms cubic-bezier(0.4,0,0.2,1);
}

.contents ul li button:hover{
	box-shadow: 0px 2px 4px -1px rgba(0,0,0,0.2),
	0px 4px 5px 0px rgba(0,0,0,0.14),
	0px 1px 10px 0px rgba(0,0,0,.12);
	background-color: #E6F6FB;
}

.contents ul li input:focus{
	border: 1px solid rgba(81, 203, 238, 1);
}

.memberIdCheck{
	margin-top: 10px;
}

.memberIdInput{
	height: 38px;
    width: 97%;
    border-radius: 3px;
    margin-top:10px;
}

.contents ul li:nth-child(2){
	margin-bottom: 30px;
}

.contents ul li:nth-child(4){
}

.contents ul li:nth-child(5){
	height: 65px;
	flex-wrap: unset;
}

.contents ul li:nth-child(7){
}

.phoneNumCheck{
	margin-top: 10px;
}

.phoneNumInput{
	height: 38px;
    width: 97%;
    border-radius: 3px;
    margin-top:10px;
    
}

.deleteBtnBox{
	margin-top: 30%;
	margin-left: 82%;
}

.deleteBtnBox button{
	outline: none;
	color: gray;
	border: none;
	padding: 10px;
	text-align: center;
	background-color: lightgray;
}

</style>
<meta charset="UTF-8">
<title>${sessionScope.account_Name }의 프로필 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		// 후기 toggle 기능 
		$(".reviewToggleBtn").click(function(e){
	        $('.' + this.id).slideToggle(500);
	        $('.' + this.id).css('display', 'flex');
		});
		
		// 전화번호 숫자만 입력 가능
		$(".phoneNumInput").keyup(function() {
		    this.value = this.value.replace(/[^1-9\.]/g,'');
		});
		
		// 변경 버튼 누를 시 입력창 나오며 '변경'이 '취소'로 바뀌고 입력창이 뜬다.
		$(".changeIdBtn").click(function(){
			var x = document.getElementsByClassName("box2");
			if (x[0].style.display === "none") {
				$(this).html("취소");
				x[0].style.display = "flex";
			} else {
				$(this).html("변경");
				x[0].style.display = "none";
				$(".memberIdInput").val("");
			}
		});
		
		// 변경 버튼 누를 시 입력창 나오며 '변경'이 '취소'로 바뀌고 입력창이 뜬다.
		$(".changePwBtn").click(function(){
			var x = document.getElementsByClassName("box4");
			var y = document.getElementsByClassName("box5");
			if (x[0].style.display == "none" && y[0].style.display == "none") {
				$(this).html("취소");
				x[0].style.display = "flex";
				y[0].style.display = "flex";
			} else {
				$(this).html("변경");
				x[0].style.display = "none";
				y[0].style.display = "none";
				$("#alert-success").hide(); 
				$("#alert-danger").hide(); 
				$(".memberPwNow").val("");
				$(".memberPwNew").val("");
			}
		});
		
		// 변경 버튼 누를 시 입력창 나오며 '변경'이 '취소'로 바뀌고 입력창이 뜬다.
		$(".changePhoneNumBtn").click(function(){
			var x = document.getElementsByClassName("box7");
			if (x[0].style.display == "none") {
				$(this).html("취소");
				x[0].style.display = "flex";
			} else {
				$(this).html("변경");
				x[0].style.display = "none";
				$(".phoneNumInput").val("");
			}
		});
		
		// 비밀번호, 새 비밀번호 값 비교하기
		$("#alert-success").hide(); 
		$("#alert-danger").hide(); 
		$(".memberPwNew, .memberPwNow").keyup(function(){ 
			var pwd1=$(".memberPwNow").val(); 
			var pwd2=$(".memberPwNew").val(); 
			if(pwd1 != "" && pwd2 != ""){ 
				if(pwd1 == pwd2){ 
					$("#alert-success").show(); 
					$("#alert-danger").hide(); 
					// 아래 submit 버튼이랑 연결 해주어야 한다!!!
					$("#submit").removeAttr("disabled"); 
				}else{ 
					$("#alert-success").hide(); 
					$("#alert-danger").show(); 
					// 아래 submit 버튼이랑 연결 해주어야 한다!!!
					$("#submit").attr("disabled", "disabled"); 
				} 
			} 
		});
		
	}); // end ready()
</script>
</head>
<body>
	<header>
		<div class="side-logo-container" style="display: flex;">
			<span style="font-size: 40px; cursor: pointer; margin-right: 7px;"
				class="side-open-btn">&#9776;</span> <a
				href="http://localhost:8090/sapare/mainPage.do" class="logo"><img
				src="image/header/sapare.jpg" width=50px; height=50px;></a>
		</div>

		<div class="text">
			<input type="text" placeholder="검색어를 입력해 주세요"
				style="width: 300px; height: 23px;">
			<button>
				<img src="image/header/search.gif" width=20px; height=20px;>
			</button>
		</div>
		<ul>
			<li><a href="log/sign" class="headerba">로그인/회원가입</a></li>
			<li><a href="my?page=main" class="headerba">마이페이지</a></li>
		</ul>
	</header>
	<!-- header 끝 -->
	
	<div class="wrap">
		<div class="profileArea">
			<div class="flagArea">
				<button class="memberFlag" style="cursor:pointer; margin-right:15px;">신고하기</button>
			<!-- 아래 if 코드 신고하기 버튼 감싸기 !!! -->
			<!-- <c:if test="${requestScope.memberName != sessionScope.memberName}"> -->
			<!-- </c:if> -->
			</div>
			
			<div class="profileContainer">
				<div id="profileImageBox">
					<img class="memberImg" style="height: 55%; width: 55%; border-radius: 15px;" src="/sapareMarket/images/${dto.profileImg }">
					<button type="button" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>
					<div class="memberStars" style="margin-top: 10px;">별점 총점</div>
				</div>
				<div class="memberInfoContainer">
					<div class="nicknameBox">
						<div class="nickname">닉네임</div>
							<button type="button" id="changeNick" style="cursor:pointer;">닉네임수정</button>
						<div class="memberRank">회원등급</div>
						<div class="premiumIcon">프리미엄</div>
					</div>
					<div class="memberAbout">
						<textarea rows="10" cols="65" maxlength="80">자기 소개 ${dto.memberAbout }</textarea>
					</div>
					<div class="aboutChangeBox">
						<button type="button" id="changeAbout" style="margin: 10px; cursor:pointer;">소개수정</button>
					</div>
					<div class="memberPointArea">
						<div class="memberPoint">포인트</div>
						<button class="pointCharge" style="cursor:pointer;">포인트 충전</button>
					</div>
				</div>
			</div>
			
				<div class="menuAndContentArea">
					<div class="profileMenu">
						<ul class="menuButtons">
						  <li><a href="profileSell.do">판매상품</a>
						  <c:if test="${requestScope.memberName == sessionScope.memberName}">
						  	<li><a href="profileBuy.do">구매상품</a></li>
						  </c:if>
						  <c:if test="${requestScope.memberName == sessionScope.memberName}">
						  	<li><a href="profileWant.do">찜</a></li>
						  </c:if>
						  <li><a href="profileReview.do">후기</a></li>
						  <c:if test="${requestScope.memberName == sessionScope.memberName}">
						  	<li><a href="profileSetting.do">회원정보수정</a></li>
						  </c:if>
						</ul>
					</div>
					<div class="profileContent">
						<div class="contents">
							<!-- memberDTO에 회원 정보 담고 이 jsp로 List 타입으로 dto 명으로 보내줘야 된다 -->
							<ul>
								<li class="box1">
									<div>아이디/이메일</div>
									<div>
										<div class="memberId">임시아이디 ${dto.memberId }</div>
									</div>
									<div>
										<button type="button" class="changeIdBtn">변경</button>
									</div>
								</li>
								
								<li class="box2" style="display:none;">
									<div>&nbsp;</div>
									<div>
										<input type="email" placeholder="이메일 주소 입력" class="memberIdInput" maxlength="30" />
									</div>
									<div>
										<button type="button" class="memberIdCheck">인증요청</button>
									</div>
								</li>
								
								<li class="box3">
									<div>비밀번호</div>
									<div>
										<div class="memberPw">****************</div>
									</div>
									<div>
										<button type="button" class="changePwBtn">변경</button>
									</div>
								</li>
								
								<li class="box4" style="display:none;">
									<div>현재 비밀번호</div>
									<div>
										<input type="password" placeholder="현재 비밀번호를 입력해주세요" class="memberPwNow" maxlength="30" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="비밀번호는 최소 8자 이상이며 반드시 숫자 , 대문자, 소문자를 1개는 포함해야 합니다."/>
									</div>
								</li>
								
								<li class="box5" style="display:none;">
									<div>신규 비밀번호</div>
									<div>
										<input type="password" placeholder="신규 비밀번호를 입력해주세요" class="memberPwNew" maxlength="30" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="비밀번호는 최소 8자 이상이며  반드시 숫자 , 대문자, 소문자를 1개는 포함해야 합니다."/>
										<div class="alert alert-success" id="alert-success" style="color: red; font-size: 13px;">비밀번호가 일치합니다.</div> 
										<div class="alert alert-danger" id="alert-danger" style="color: red; font-size: 13px;">비밀번호가 일치하지 않습니다.</div>
										<div style="font-size: 13px; width: max-content">최소 8~20자 이하의 숫자, 대문자, 소문자 1개 이상씩 포함</div>
									</div>
									<div>
										<button type="button">확인</button>
									</div>
								</li>
								
								<li class="box6">
									<div>휴대폰</div>
									<div>
										<div>01012345678 ${dto.phoneNum }</div>
									</div>
									<div>
										<button type="button" class="changePhoneNumBtn">변경</button>
									</div>
								</li>
								
								<li class="box7" style="display:none;">
									<div>&nbsp;</div>
									<div>
										<input type="text" placeholder="휴대폰 번호를 입력해주세요" class="phoneNumInput" maxlength="11" />
									</div>
									<div>
										<button type="button" class="phoneNumCheck">인증요청</button>
									</div>
								</li>
								
							</ul>
							<div class="deleteBtnBox">
								<button type="button" class="deleteMemberBtn">탈퇴하기</button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>

	<footer> footer area </footer>
</body>
</html>