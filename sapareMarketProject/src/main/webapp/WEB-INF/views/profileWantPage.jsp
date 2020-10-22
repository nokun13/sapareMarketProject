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
		
		// 후기 toggle 기능 
		$(".reviewToggleBtn").click(function(e){
	        $('.' + this.id).slideToggle(500);
	        $('.' + this.id).css('display', 'flex');
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
						<div class="contentOptions">
							<select>
								<option value="everyItem">전체</option>
								<option value="lastWeek">지난 7일</option>
								<option value="lastMonth">지난 30일</option>
								<option value="lastSixMonths">지난 6개월</option>
							</select>
						
							<select>
								<option value="wantOrder">찜한 상품순</option>
								<option value="wantNumOrder">찜이 많은 상품순</option>
								<option value="lowPriceOrder">저가순</option>
							</select>
							
							<button type="button" style="margin: 0 10px; width:40px;">적용</button>
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
													<img src="image/profileWantPage/wombat.jpg" />
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
													<img src="image/profileWantPage/fox.jpg" />
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
													<img src="image/profileWantPage/quokka.jpg" />
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
													<img src="image/profileWantPage/kiwi.jpg" />
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
													<img src="image/profileWantPage/kiwi2.png" />
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
													<img src="image/profileWantPage/kiwi3.png" />
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
													<img src="image/profileWantPage/kiwi3.png" />
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
													<img src="image/profileWantPage/kiwi3.png" />
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
													<img src="image/profileWantPage/kiwi3.png" />
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
													<img src="image/profileWantPage/kiwi3.png" />
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