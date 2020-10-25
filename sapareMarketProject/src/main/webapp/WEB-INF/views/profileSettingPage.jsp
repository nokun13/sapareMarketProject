<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	text-decoration: none;
	margin: 0;
  	padding: 0;
}

.contents input{
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

.profileContainer button{
    font-size: 15px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: black;
}

.nicknameBox div {
    margin-right: 10px;
    width: auto;
    white-space: nowrap;
    overflow: hidden;
    flex-direction: row;
    display: flex;
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
	align-items: center;
	width: 95%;
	border: #8AB8F4 solid 1px;
	cursor: default
}

.nicknameBox div{
	margin-right: 10px;
	width: auto;
	white-space: nowrap; 
	overflow: hidden;
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
    font-size: 15px;
    border: none;
    outline: none;
    background-color: lightgray;
    cursor: default;
    font-family: Montserrat;
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
    height: auto;
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
	height: auto;
	margin-left: 15px;
	margin-top: 30px;
	margin-right: 10px;
	flex-direction: column;
}

.contents{
	display: flex;
	flex-direction: column;
	width: 100%;
	height: 100%;
	margin-top: 35px;
	margin-left: 15px;
	margin-bottom: 15px;
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
				// $("#alert-success").hide(); 
				// $("#alert-danger").hide(); 
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
		/* $("#alert-success").hide(); 
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
		}); */
		
		// 비밀번호 변경 input 엔터 기능
		var pw_input1 = document.getElementsByClassName("memberPwNow")[0];
		var pw_input2 = document.getElementsByClassName("memberPwNew")[0];
		
		pw_input1.addEventListener("keyup", function(event){
		  if (event.keyCode === 13) {
		    event.preventDefault();
		    document.getElementById("changePwBtn").click();
		  }
		});
		
		pw_input2.addEventListener("keyup", function(event){
		  if (event.keyCode === 13) {
		    event.preventDefault();
		    document.getElementById("changePwBtn").click();
		  }
		});
		
		// 현재/신규 비밀번호 일치, 확인 버튼 누를 시 현재 비밀번호 가지고 온다
		$("#changePwBtn").click(function(){
			$.ajax({
				type:'GET',
				dataType:'json',
				url:'memberInfoGet.do?memberName=${member.memberName}',
				success: change_password
			});
		});
		
		function change_password(res){
			
			var pwd1=$(".memberPwNow").val(); 
			var pwd2=$(".memberPwNew").val(); 
			var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{6,15}$/;
			
			if(pwd1 === pwd2){
				alert("새 비밀번호를 입력해 주세요.");
			} else if(reg.test(pwd2) === false){
				alert("비밀번호는 최소 6-15자이며 문자와 숫자가 포함되어야 합니다.");
				$(".memberPwNew").val("");
			} else if(pwd1 === res.memberPw){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'memberPwChange.do?memberName=${member.memberName}&memberPw='+$(".memberPwNew").val()
				});
				alert("비밀번호가 성공적으로 변경되었습니다.");
				$(".memberPwNow").val("");
				$(".memberPwNew").val("");
				$(".changePwBtn").click();
			} else{
				alert("현재 비밀번호가 틀렸습니다.");
				$(".memberPwNow").val("");
			}
		};
			
		// 닉네임 변경 버튼 클릭 후 현재 닉네임 가져오기
		$("#changeNick").click(function(){
			
			$.ajax({
				type:'GET',
				dataType:'json',
				url:'memberInfoGet.do?memberName=${member.memberName}',
				success: change_nickname
			});
			
		});
		
		// 닉네임 중복 체크
		function change_nickname(res){
			
			$("#changeNick").prev().html('<input type="text" id="newNickname" maxlength="15" value="'+res.nickname+'" style="font-size:16px;outline:none;"> <button type="button" id="submitNick" style="cursor:pointer;">확인</button>');
			$("#changeNick").hide();
			
			// 닉네임 변경 엔터 버튼 클릭 기능
			var input = document.getElementById("newNickname");
			
			input.addEventListener("keyup", function(event){
			  if (event.keyCode === 13) {
			    event.preventDefault();
			    document.getElementById("submitNick").click();
			  }
			});
			
			$('#submitNick').click(function(){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'checkNickname.do?nickname=' + $("#newNickname").val(),
					success: get_new_nickname
				});
			});
		};
		
		// 닉네임 변경
		function get_new_nickname(res){
			if(res == 1){
				alert("이미 존재하는 닉네임입니다.");
			} else{
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'changeNickname.do?memberName=${member.memberName}&nickname=' + $("#newNickname").val(),
					success: change_to_new_nickname
				});
			}
		};
		
		// 닉네임 변경 후 변경 된 닉네임으로 바꿔주고 수정버튼 재생성
		function change_to_new_nickname(res){
			$('.nickname').html(res.nickname);
			$('#changeNick').show();
		};
		
		
		// 소개글 변경 버튼 클릭 후 소개글 가져오기
		$("#changeAbout").click(function(){
			
			$.ajax({
				type:'GET',
				dataType:'json',
				url:'memberInfoGet.do?memberName=${member.memberName}',
				success: change_about_content
			});
			
		});
		
		// textarea 변경가능으로 바꾸고 소개글 뿌려주기, 확인 버튼 누르면 저장
		function change_about_content(res){
			
			$(".memberAbout").html('<textarea id="aboutContent" rows="8" cols="65" maxlength="80" style="background-color:white;border:1px solid black;cursor:auto;">'+res.memberAbout+'</textarea>')
			$(".aboutChangeBox").append('<button type="button" id="submitAbout" style="margin: 10px; cursor:pointer;">확인</button>');
			
			$("#changeAbout").hide();
			
			$("#submitAbout").click(function(){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'changeMemberAbout.do?memberName=${member.memberName}&memberAbout='+$("#aboutContent").val(),
					success: after_about_change
				});
			});
			
		};
		
		// 소개글 저장 후 textarea 복구, 버튼 복구
		function after_about_change(res){
			
			$("#submitAbout").remove();
			$("#changeAbout").show();
			$(".memberAbout").html('<textarea readonly id="aboutContent" rows="8" cols="65" maxlength="80">'+res.memberAbout+'</textarea>');
		};
		
		// 프로필 사진이나 사진수정버튼 누르면 '사진 고르기' 버튼 클릭
		$("#profileImgChange").click(function() {
		    $("#filepath").click();
		});
		$("#memberImg").click(function() {
		    $("#filepath").click();
		});
		
		// 새로운 프로필 사진 선택 후
		$('#filepath').on('change', function(){
			var str = $('#filepath').val();
		
			// 이미지 첨부파일인지 체크
			var patt = /(.jpeg$|.jpg$|.gif$|.png$)/gi;
			var result = str.match(patt);
			
			if($("#filepath").val() === ""){
				alert("프로필 사진 변경을 취소하였습니다.")
				$('#memberImg').attr("src", "image/${member.profileImg }");
				$(".imgChangeBox").html('<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
				return false;
			}
			
			if(!result){
				alert('jpeg, jpg, gif, png만 가능합니다.');
				$('#filepath').val("");
				$('#memberImg').attr("src", "image/${member.profileImg }");
				$(".imgChangeBox").html('<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
				return false;
			}
			
			// 파일첨부 사이즈 체크
			if(this.files[0].size > 100000000){
				alert('100MB 이하만 가능합니다.');
				$('#filepath').val("");
				$('#memberImg').attr("src", "image/${member.profileImg }");
				$(".imgChangeBox").html('<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
				return false;
			}
			
			// 파일을 읽기 위한 FileReader객체 생성
			var reader = new FileReader();
			
			// File내용을 읽어 dataURL형식의 문자열 저장
			reader.readAsDataURL(this.files[0]); // 배열 형식이기에 꼭 [i] 배열의 순서를 알려줘야한다.
			
			// 파일 일거들이기를 성공했을 때 호출되는 이벤트 메소드
			reader.onload = function(e){
				// img요소의 src속성에 읽어들인 File내용을 지정해준다.
				$('#memberImg').attr('src', e.target.result);
			};
			
			// 프로필사진수정 버튼을 확인 버튼으로 교체
			if(!($("#submitProfileImg").length)){
				$("#profileImgChange").hide();
				$(".imgChangeBox").append('<button type="button" id="submitProfileImg" style="margin: 5px; cursor:pointer;">확인</button>')
			}
		
			$("#submitProfileImg").click(function(){
				// 첨부파일을 Form안에 담아내기 위해서 작성한다.
				var form_data = new FormData();
				form_data.append('memberName', '${member.memberName}');
				form_data.append('profileFile', $("#filepath")[0].files[0]);
				
				// 변경된 프로필 사진 저장
				$.ajax({
					type:'POST',
					dataType:'json',
					// 첨부파일을 ajax로 보내기 위하여 아래 3개의 문을 사용한다. 
					contentType:false,
					enctype:'filename/form-data',
					processData:false,
					url:'profileImgChange.do',
					// data는 첨부파일을 포함한 form_data를 사용할 수 있다
					data:form_data,
					success:profile_img_change,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }
				});
			});	
		}); // end change()
		
		// 변경된 프로필 사진으로 보이게끔 한다
		function profile_img_change(res){
			$("#memberImg").attr('src', "image/"+res.profileImg);
			$("#submitProfileImg").remove();
			$("#profileImgChange").show();
		};
		
	}); // end ready()
</script>
</head>
<body>
	<header>
		<div class="side-logo-container" style="display: flex;">
			<span style="font-size: 40px; cursor: pointer; margin-right: 7px;"
				class="side-open-btn">&#9776;</span> <a
				href="http://localhost:8090/sapare/mainPage.do" class="logo"><img
				src="image/sapare.jpg" width=50px; height=50px;></a>
		</div>

		<div class="text">
			<input type="text" placeholder="검색어를 입력해 주세요"
				style="width: 300px; height: 23px;">
			<button>
				<img src="image/search.gif" width=20px; height=20px;>
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
					<img id="memberImg" style="height: 70%; width: 70%; border-radius: 15px;margin-bottom: 5px;cursor:pointer;" src="image/${member.profileImg }">
					<div class="nickname">
						${member.nickname }
					</div>
					<div class="imgChangeBox">
						<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>
					</div>
					<input type="file" name="filepath" id="filepath" style="display:none;"/>
					<div class="memberStars" style="margin-top: 10px;">
					<!-- 회원이 받은 총 별점을 계산, avg를 찾고 이쪽으로 리턴해준다. -->
					</div>
				</div>
				<div class="memberInfoContainer">
					<div class="nicknameBox">
						<div class="nickname">
							${member.nickname }
						</div>
							<button type="button" id="changeNick" style="cursor:pointer;margin-right:10px;">닉네임수정</button>
						<div class="memberRank">${status.memberRank }</div>
						<div class="premiumIcon">
							<c:if test="${fn:contains(status.memberPremium, 'n')}">
								프리미엄 아님/나중에 변경
							</c:if>
						</div>
					</div>
					<div class="memberAbout">
						<textarea readonly id="aboutContent" rows="8" cols="65" maxlength="80">${member.memberAbout }</textarea>
					</div>
					<div class="aboutChangeBox">
						<button type="button" id="changeAbout" style="margin: 10px; cursor:pointer;">소개수정</button>
					</div>
					<div class="memberPointArea">
						<div class="memberPoint" style="margin: 10px; white-space: nowrap; overflow: hidden;">${status.memberPoint }</div>
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
										<div class="memberId">${member.memberId }</div>
									</div>
									<div>
										<button type="button" class="changeIdBtn">변경</button>
									</div>
								</li>
								
								<li class="box2" style="display:none;">
									<div>&nbsp;</div>
									<div>
										<input type="email" placeholder="이메일 주소 입력" class="memberIdInput" maxlength="30" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" />
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
										<input type="password" placeholder="현재 비밀번호를 입력해주세요" class="memberPwNow" maxlength="30" pattern="(?=.*\d)(?=.*[a-zA-Z]).{6,15}" title="비밀번호는 최소 6자에서 15자이며 숫자, 문자를 1개씩 포함해야 합니다."/>
									</div>
								</li>
								
								<li class="box5" style="display:none;">
									<div>신규 비밀번호</div>
									<div>
										<input type="password" placeholder="신규 비밀번호를 입력해주세요" class="memberPwNew" maxlength="30" pattern="(?=.*\d)(?=.*[a-zA-Z]).{6,15}" title="비밀번호는 최소 6자에서 15자이며 숫자, 문자를 1개씩 포함해야 합니다."/>
										<!-- <div class="alert alert-success" id="alert-success" style="color: red; font-size: 13px;">비밀번호가 일치합니다.</div>  -->
										<!-- <div class="alert alert-danger" id="alert-danger" style="color: red; font-size: 13px;">비밀번호가 일치하지 않습니다.</div>  -->
										<div style="font-size: 13px; width: max-content">최소 6~15자 이하 숫자와 문자 포함</div>
									</div>
									<div>
										<button type="button" id="changePwBtn">확인</button>
									</div>
								</li>
								
								<li class="box6">
									<div>휴대폰</div>
									<div>
										<div>0${member.phoneNum }</div>
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