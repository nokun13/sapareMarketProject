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
	cursor: default;
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
.menuButtons li:nth-child(3) {
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
.menuButtons li:nth-child(3) a {
	background-color: #8AB8F4;
    color: white;
}

.profileContent{
	display: flex;
	width: 80%;
	height: auto;
	margin-left: 15px;
	margin-top: 15px;
	margin-right: 10px;
	flex-direction: column;
	overflow: hidden;
}

.contents{
	display: flex;
	flex-direction: column;
	width: 100%;
	height: 100%;
	margin-top: 10px;
	overflow: hidden;
}

.contentOptions{
	display: flex;
	width: 100%;
	height: 5%;
	align-items: center;
	justify-content: flex-end;
}

.contentOptions select{
	margin-left: 20px;
	outline: none;
}

.wantItemWrapper{
	height: auto;
	overflow: hidden;
}

.wantItemWrapper ul{
	margin: 0;
	float: left;
	width: 100%;
	display: flex;
	flex-wrap: wrap;
}

.wantItemWrapper ul li{
	width: 30%;
	margin-right: 2%;
	min-height: auto;
	flex: 0 0 31.3333333%;
}

.wantItemInside{
	display: flex;
	flex-direction: column;
	margin-bottom: 15%;
	margin-top: 5%;
}

.itemImageBox{
	width: 100%;
    background-color: lightgray;
    position: relative;
    display: flex;
    flex-flow: column;
}

.itemImageBox img{
	height: 250px;
	max-width: 100%;
    border-radius: 5px;
    object-fit: cover;
}

.itemDescribeBox{
	height: 50px;
    display: flex;
    flex-direction: row;
    margin-top: 10px;
    margin-left: 5px;
    margin-bottom: 5px;
}

.itemDescribeBox>div:nth-child(1){
	display: flex;
    flex-direction: column;
    height: 100%;
    width: 75%;
}

.itemDescribeBox>div:nth-child(2){
	display: flex;
	align-items: center;
	justify-content: center;
    height: 100%;
    width: 25%;
}

.itemName{
	text-overflow: ellipsis; 
	white-space: nowrap; 
	overflow: hidden;
	height: 60%;
    display: flex;
    align-items: center;
    font-size: 16px;
}

.itemPrice{
	text-overflow: ellipsis; 
	white-space: nowrap; 
	overflow: hidden;
    height: 40%;
    display: flex;
    align-items: center;
    font-size: 20px;
}

</style>
<meta charset="UTF-8">
<title>${sessionScope.account_Name }의 프로필 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
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
						<div class="contentOptions">
							<select>
								<option value="wantOrder">찜한 상품순</option>
								<option value="wantNumOrder">찜이 많은 상품순</option>
								<option value="lowPriceOrder">저가순</option>
							</select>
							
						</div>
						<div class="contents">
							<div class="wantItemWrapper">
								<ul>
									<li>
															<!-- 나중에 찜 사진을 눌렀을 때 상품페이지로 건너가는 메소드로 아래 href를 바꿔줘야 된다 -->
										<a class="wantItemCard" href="searchItem.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<!-- 경로 마지막 부분을 ${dto.itemImagePath }로 바꿔준다 -->
													<img src="image/wombat.jpg" />
												</div>
												
												<div class="itemDescribeBox">
													<div>
														<div class="itemName">찜한 상품이름 ${dto.itemName }</div>
														<div class="itemPrice">15000 ${dto.itemPrice }</div>
													</div>
													
													<div>
														<button type="button" class="wantItemBtn" style="border:none; background-color:lightgray;">
															<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
															 width="35px" height="35px" viewBox="0 0 25 25"
															 fill="#f44336" fill-opacity="1" stroke="#ffffff"
															 stroke-width="2" focusable="false" aria-label="찜하기" 
															 role="img" stroke-linecap="round" stroke-linejoin="round"
															 preserveAspectRatio="xMidYMid meet">
															<metadata>
															Created by potrace 1.15, written by Peter Selinger 2001-2017
															</metadata>
															<g>
															<path d="m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6"/>
															</g>
															</svg>
														</button>
													</div>
												</div>
											</div>
										</a>
									</li>
									
									<li>
															<!-- 나중에 찜 사진을 눌렀을 때 상품페이지로 건너가는 메소드로 아래 href를 바꿔줘야 된다 -->
										<a class="wantItemCard" href="searchItem.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<!-- 경로 마지막 부분을 ${dto.itemImagePath }로 바꿔준다 -->
													<img src="image/fox.jpg" />
												</div>
												
												<div class="itemDescribeBox">
													<div>
														<div class="itemName">찜한 상품이름 ${dto.itemName }</div>
														<div class="itemPrice">15000 ${dto.itemPrice }</div>
													</div>
													
													<div>
														<button type="button" class="wantItemBtn" style="border:none; background-color:lightgray;">
														<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
															 width="35px" height="35px" viewBox="0 0 25 25"
															 fill="#f44336" fill-opacity="1" stroke="#ffffff"
															 stroke-width="2" focusable="false" aria-label="찜하기" 
															 role="img" stroke-linecap="round" stroke-linejoin="round"
															 preserveAspectRatio="xMidYMid meet">
															<metadata>
															Created by potrace 1.15, written by Peter Selinger 2001-2017
															</metadata>
															<g>
															<path d="m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6"/>
															</g>
															</svg>
														</button>
													</div>
												</div>
											</div>
										</a>
									</li>
									
									<li>
															<!-- 나중에 찜 사진을 눌렀을 때 상품페이지로 건너가는 메소드로 아래 href를 바꿔줘야 된다 -->
										<a class="wantItemCard" href="searchItem.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<!-- 경로 마지막 부분을 ${dto.itemImagePath }로 바꿔준다 -->
													<img src="image/quokka.jpg" />
												</div>
												
												<div class="itemDescribeBox">
													<div>
														<div class="itemName">찜한 상품이름 ${dto.itemName }</div>
														<div class="itemPrice">15000 ${dto.itemPrice }</div>
													</div>
													
													<div>
														<button type="button" class="wantItemBtn" style="border:none; background-color:lightgray;">
														<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
															 width="35px" height="35px" viewBox="0 0 25 25"
															 fill="#484848" fill-opacity="1" stroke="#ffffff"
															 stroke-width="2" focusable="false" aria-label="찜하기" 
															 role="img" stroke-linecap="round" stroke-linejoin="round"
															 preserveAspectRatio="xMidYMid meet">
															<metadata>
															Created by potrace 1.15, written by Peter Selinger 2001-2017
															</metadata>
															<g>
															<path d="m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6"/>
															</g>
															</svg>
														</button>
													</div>
												</div>
											</div>
										</a>
									</li>
									
									<li>
															<!-- 나중에 찜 사진을 눌렀을 때 상품페이지로 건너가는 메소드로 아래 href를 바꿔줘야 된다 -->
										<a class="wantItemCard" href="searchItem.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<!-- 경로 마지막 부분을 ${dto.itemImagePath }로 바꿔준다 -->
													<img src="image/kiwi.jpg" />
												</div>
												
												<div class="itemDescribeBox">
													<div>
														<div class="itemName">찜한 상품이름 ${dto.itemName }</div>
														<div class="itemPrice">15000 ${dto.itemPrice }</div>
													</div>
													
													<div>
														<button type="button" class="wantItemBtn" style="border:none; background-color:lightgray;">
														<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
															 width="35px" height="35px" viewBox="0 0 25 25"
															 fill="#f44336" fill-opacity="1" stroke="#ffffff"
															 stroke-width="2" focusable="false" aria-label="찜하기" 
															 role="img" stroke-linecap="round" stroke-linejoin="round"
															 preserveAspectRatio="xMidYMid meet">
															<metadata>
															Created by potrace 1.15, written by Peter Selinger 2001-2017
															</metadata>
															<g>
															<path d="m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6"/>
															</g>
															</svg>
														</button>
													</div>
												</div>
											</div>
										</a>
									</li>
									
									<li>
															<!-- 나중에 찜 사진을 눌렀을 때 상품페이지로 건너가는 메소드로 아래 href를 바꿔줘야 된다 -->
										<a class="wantItemCard" href="searchItem.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<!-- 경로 마지막 부분을 ${dto.itemImagePath }로 바꿔준다 -->
													<img src="image/kiwi2.png" />
												</div>
												
												<div class="itemDescribeBox">
													<div>
														<div class="itemName">찜한 상품이름 ${dto.itemName }</div>
														<div class="itemPrice">15000 ${dto.itemPrice }</div>
													</div>
													
													<div>
														<button type="button" class="wantItemBtn" style="border:none; background-color:lightgray;">
														<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
															 width="35px" height="35px" viewBox="0 0 25 25"
															 fill="#f44336" fill-opacity="1" stroke="#ffffff"
															 stroke-width="2" focusable="false" aria-label="찜하기" 
															 role="img" stroke-linecap="round" stroke-linejoin="round"
															 preserveAspectRatio="xMidYMid meet">
															<metadata>
															Created by potrace 1.15, written by Peter Selinger 2001-2017
															</metadata>
															<g>
															<path d="m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6"/>
															</g>
															</svg>														</button>
													</div>
												</div>
											</div>
										</a>
									</li>
									
									<li>
															<!-- 나중에 찜 사진을 눌렀을 때 상품페이지로 건너가는 메소드로 아래 href를 바꿔줘야 된다 -->
										<a class="wantItemCard" href="searchItem.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<!-- 경로 마지막 부분을 ${dto.itemImagePath }로 바꿔준다 -->
													<img src="image/kiwi3.png" />
												</div>
												
												<div class="itemDescribeBox">
													<div>
														<div class="itemName">찜한 상품이름 ${dto.itemName }</div>
														<div class="itemPrice">15000 ${dto.itemPrice }</div>
													</div>
													
													<div>
														<button type="button" class="wantItemBtn" style="border:none; background-color:lightgray;">
														<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
															 width="35px" height="35px" viewBox="0 0 25 25"
															 fill="#f44336" fill-opacity="1" stroke="#ffffff"
															 stroke-width="2" focusable="false" aria-label="찜하기" 
															 role="img" stroke-linecap="round" stroke-linejoin="round"
															 preserveAspectRatio="xMidYMid meet">
															<metadata>
															Created by potrace 1.15, written by Peter Selinger 2001-2017
															</metadata>
															<g>
															<path d="m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6"/>
															</g>
															</svg>
														</button>
													</div>
												</div>
											</div>
										</a>
									</li>
									
									<li>
															<!-- 나중에 찜 사진을 눌렀을 때 상품페이지로 건너가는 메소드로 아래 href를 바꿔줘야 된다 -->
										<a class="wantItemCard" href="searchItem.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<!-- 경로 마지막 부분을 ${dto.itemImagePath }로 바꿔준다 -->
													<img src="image/kiwi3.png" />
												</div>
												
												<div class="itemDescribeBox">
													<div>
														<div class="itemName">찜한 상품이름 ${dto.itemName }</div>
														<div class="itemPrice">15000 ${dto.itemPrice }</div>
													</div>
													
													<div>
														<button type="button" class="wantItemBtn" style="border:none; background-color:lightgray;">
														<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
															 width="35px" height="35px" viewBox="0 0 25 25"
															 fill="#f44336" fill-opacity="1" stroke="#ffffff"
															 stroke-width="2" focusable="false" aria-label="찜하기" 
															 role="img" stroke-linecap="round" stroke-linejoin="round"
															 preserveAspectRatio="xMidYMid meet">
															<metadata>
															Created by potrace 1.15, written by Peter Selinger 2001-2017
															</metadata>
															<g>
															<path d="m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6"/>
															</g>
															</svg>
														</button>
													</div>
												</div>
											</div>
										</a>
									</li>
									
									<li>
															<!-- 나중에 찜 사진을 눌렀을 때 상품페이지로 건너가는 메소드로 아래 href를 바꿔줘야 된다 -->
										<a class="wantItemCard" href="searchItem.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<!-- 경로 마지막 부분을 ${dto.itemImagePath }로 바꿔준다 -->
													<img src="image/kiwi3.png" />
												</div>
												
												<div class="itemDescribeBox">
													<div>
														<div class="itemName">찜한 상품이름 ${dto.itemName }</div>
														<div class="itemPrice">15000 ${dto.itemPrice }</div>
													</div>
													
													<div>
														<button type="button" class="wantItemBtn" style="border:none; background-color:lightgray;">
														<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
															 width="35px" height="35px" viewBox="0 0 25 25"
															 fill="#f44336" fill-opacity="1" stroke="#ffffff"
															 stroke-width="2" focusable="false" aria-label="찜하기" 
															 role="img" stroke-linecap="round" stroke-linejoin="round"
															 preserveAspectRatio="xMidYMid meet">
															<metadata>
															Created by potrace 1.15, written by Peter Selinger 2001-2017
															</metadata>
															<g>
															<path d="m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6"/>
															</g>
															</svg>
														</button>
													</div>
												</div>
											</div>
										</a>
									</li>
									
									<li>
															<!-- 나중에 찜 사진을 눌렀을 때 상품페이지로 건너가는 메소드로 아래 href를 바꿔줘야 된다 -->
										<a class="wantItemCard" href="searchItem.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<!-- 경로 마지막 부분을 ${dto.itemImagePath }로 바꿔준다 -->
													<img src="image/kiwi3.png" />
												</div>
												
												<div class="itemDescribeBox">
													<div>
														<div class="itemName">찜한 상품이름 ${dto.itemName }</div>
														<div class="itemPrice">15000 ${dto.itemPrice }</div>
													</div>
													
													<div>
														<button type="button" class="wantItemBtn" style="border:none; background-color:lightgray;">
														<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
															 width="35px" height="35px" viewBox="0 0 25 25"
															 fill="#f44336" fill-opacity="1" stroke="#ffffff"
															 stroke-width="2" focusable="false" aria-label="찜하기" 
															 role="img" stroke-linecap="round" stroke-linejoin="round"
															 preserveAspectRatio="xMidYMid meet">
															<metadata>
															Created by potrace 1.15, written by Peter Selinger 2001-2017
															</metadata>
															<g>
															<path d="m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6"/>
															</g>
															</svg>
														</button>
													</div>
												</div>
											</div>
										</a>
									</li>
									
									<!-- li를 c:forEach로 감싸줌 !!! -->
									<!--<c:forEach items="${wantItemList}" var="dto"> -->
									<!-- </c:forEach> -->
									
									<li>
															<!-- 나중에 찜 사진을 눌렀을 때 상품페이지로 건너가는 메소드로 아래 href를 바꿔줘야 된다 -->
										<a class="wantItemCard" href="searchItem.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<!-- 경로 마지막 부분을 ${dto.itemImagePath }로 바꿔준다 -->
													<img src="image/kiwi3.png" />
												</div>
												
												<div class="itemDescribeBox">
													<div>
														<div class="itemName">찜한 상품이름 ${dto.itemName }</div>
														<div class="itemPrice">15000 ${dto.itemPrice }</div>
													</div>
													
													<div>
														<button type="button" class="wantItemBtn" style="border:none; background-color:lightgray;">
														<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
															 width="35px" height="35px" viewBox="0 0 25 25"
															 fill="#f44336" fill-opacity="1" stroke="#ffffff"
															 stroke-width="2" focusable="false" aria-label="찜하기" 
															 role="img" stroke-linecap="round" stroke-linejoin="round"
															 preserveAspectRatio="xMidYMid meet">
															<metadata>
															Created by potrace 1.15, written by Peter Selinger 2001-2017
															</metadata>
															<g>
															<path d="m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6"/>
															</g>
															</svg>
														</button>
													</div>
												</div>
											</div>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>

	<footer> footer area </footer>
</body>
</html>