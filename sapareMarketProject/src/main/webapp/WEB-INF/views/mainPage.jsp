<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

/* 메인 전체 박스 */
.main_body {
	width: 100%;
	height: auto;
	border: 1px solid black;
	background-color: gray;
}

/* 메인 베너 박스 */
.banner_main_bg {
	width: 100%;
	height: 240px;
	background-color: skyblue;
}

.main_banner_box {
	width: 50%;
	background-color: blue;
	margin: auto;
}

.main_banner_box p {
	width: 100%;
	height: 200px;
	margin: auto;
	background-color: yellow;
}

/* 메인 아이콘 박스 */
.main_icon {
	margin: auto;
	width: 100%;
	height: 400px;
	background-color: beige;
}

.main_icon_box {
	position: relative;
	margin: 0 auto;
	width: 50%;
	height: 340px;
	/* padding: 30px; */
	background-color: green;
}

/* 메인 콘텐츠 박스 */
.main_content {
	margin: auto;
	width: 100%;
	height: 80%;
}

.main_content_box {
	margin: auto;
	width: 50%;
	height: 500px;
}

.main_content_item {
	width: 300px;
	heigth: 400px;
	background-color: aqua;
}
.main_content_item li{
	border-color: maroon;
}
.main_item_box{
	overflow: hidden;
}


</style>
<title>메인</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

	<!-- 메인페이지 -->
	<section class="main_body">

		<!-- 배너 위치 -->
		<div class="main_banner">
			<div class="main_banner_box">
				<p>광고 & 이미지 위치 공간</p>
			</div>
		</div>

		<!-- 아이콘 위치 -->
		<div class="main_icon">

			<div class="main_icon_box">
				아이콘이 들어가야하는 자리
				<!-- <button type="button" value="아이콘 버튼" style="width: 20%; height: 170px; "></button> -->

			</div>
		</div>
		<!-- 상품 위치 -->
	<h2>최신</h2>
		<div class="main_content">
			<div class="main_content_box" style="height: auto; overflow: hidden auto;">
					<ul class="main_row">
						<c:forEach items="${itemList}" var="main_item">
								<li class="main_item_box" style="display: block; text-align: center; margin: 10px 10px; float: left;">
									<a href="www.qweqwe.com">
									<img alt="image" src="image/imgtest.jpg" style="width: 200px; height: 250px;" >
									<p style="text-align: center; width: 250px; height: 20px; overflow: hidden;">
									제목</p><br/>
									<p>20,000원</p>
									</a>
								</li>
						</c:forEach>
					</ul>
				<!-- 				<img src="pineapple.jpg" alt="Pineapple" style="width: 170px; height: 170px; margin-right: 15px; margin-top: 15px"> -->
			</div>
		</div>
	</section>


	<!-- 하단푸터 -->
	<footer> footer area </footer>



</body>
</html>