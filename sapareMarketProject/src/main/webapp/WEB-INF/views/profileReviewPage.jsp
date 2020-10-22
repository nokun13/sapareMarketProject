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
.menuButtons li:nth-child(4) {
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
.menuButtons li:nth-child(4) a {
	background-color: #8AB8F4;
    color: white;
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

.reviewBox{
	display: flex;
    width: 100%;
    height: 150px;
    background-color: #F0F8FF;
    flex-direction: row;
    margin-bottom: 2%;
    border-radius: 5px;
}

.reviewerImgBox{
	height: 100%;
    width: 20%;
    border-radius: 5px;
}

.reviewerImgBox a{
	height: 100%;
    width: 100%;
}

.reviewerImgBox a img{
	height: 100%;
    width: 100%;
}

.reviewInfoBox{
	display: flex;
    flex-direction: column;
    width: 80%;
    height: 100%;
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
								<option value="reviewGet">받은 후기</option>
								<option value="reviewSend">작성한 후기</option>
							</select>
						</div>
						<div class="contents">
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							
							
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							<div class="reviewBox">
								<div class="reviewerImgBox">
									<a href="#"><img class="reviewerImg" src="/sapareMarket/images/${dto.profileImg }"></a>
								</div>
								<div class="reviewInfoBox">
									<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.memberName }구매자 닉네임</div>
									<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }후기 내용</div>
									<div class="reviewStar" style="margin-top:5px; margin-left: 5px; height: 18%; font-size: 14px;">${dto.reviewStar} 별점 5개</div>
								</div>
							</div>
							<!-- c:forEach로 reviewBox를 감싼다 -->
							<!--<c:forEach items="${reviewBoxList}" var="dto"> -->
							<!-- </c:forEach> -->
						</div>
					</div>
				</div>
				
			</div>
		</div>

	<footer> footer area </footer>
</body>
</html>