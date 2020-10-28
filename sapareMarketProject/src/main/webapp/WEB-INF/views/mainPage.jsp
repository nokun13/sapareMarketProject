<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사파리 마켓</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<style type="text/css">

/* 푸터부분 */
footer {
	display: flex;
	min-height: 300px;
	flex-direction: column;
}

#footer_wrap {
	top: 0;
	left: 0;
	right: 0;
	height: 128px;
	width: 1300px;
	min-width: 1300px;
	margin: 0 auto
}

address {
	float: none;
	padding-left: 250px;
}

#bottom_1, #bottom_2, #bottom_3, #bottom_4 {
	float: left;
	margin-left: 150px;
}

#bottom_1 dt, #bottom_2 dt, #bottom_3 dt, #bottom_4 dt {
	font-weight: bold;
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

@font-face {
	font-family: 'LotteMartHappy';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff2')
		format('woff2'),
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff')
		format('woff');
}

@font-face {
	font-family: 'LotteMartHappy';
	font-style: normal;
	font-weight: 700;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff2')
		format('woff2'),
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff')
		format('woff');
}

.lottemarthappy * {
	font-family: 'LotteMartHappy', sans-serif;
}

body, div, ul, li, p {
	margin: 0;
	padding: 0;
}

img {
	border: none;
	vertical-align: top;
	padding: 5px;
	border-radius: 15px;
}

.touch_bullet li {
	list-style: none;
}

/*GLOBALS*/
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

a {
	text-decoration: none;
	color: #666;
}

a:hover {
	color: dodgerblue;
}

#wrapper {
	width: 1000px;
	margin: 15px auto;
	height: 250px;
	position: relative;
	color: #fff;
	text-shadow: rgba(0, 0, 0, 0.1) 2px 2px 0px;
}

#slider-wrap {
	width: 1000px;
	height: 250px;
	position: relative;
	overflow: hidden;
}

#slider-wrap ul#slider {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

#slider-wrap ul#slider li {
	float: left;
	position: relative;
	width: 1000px;
	height: 250px;
}

#slider-wrap ul#slider li>div {
	position: absolute;
	top: 20px;
	left: 35px;
}

#slider-wrap ul#slider li>div h3 {
	font-size: 36px;
	text-transform: uppercase;
}

#slider-wrap ul#slider li>div span {
	font-family: Neucha, Arial, sans serif;
	font-size: 21px;
}

#slider-wrap ul#slider li img {
	display: block;
	width: 100%;
	height: 100%;
	padding: 0px;
}

/*btns*/
.btns {
	position: absolute;
	width: 50px;
	height: 60px;
	top: 50%;
	margin-top: -25px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	background: rgba(0, 0, 0, 0.1);
	z-index: 100;
	-webkit-user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-ms-user-select: none;
	-webkit-transition: all 0.1s ease;
	-moz-transition: all 0.1s ease;
	-o-transition: all 0.1s ease;
	-ms-transition: all 0.1s ease;
	transition: all 0.1s ease;
}

.btns:hover {
	background: rgba(0, 0, 0, 0.3);
}

#next {
	right: -50px;
	border-radius: 7px 0px 0px 7px;
}

#previous {
	left: -50px;
	border-radius: 0px 7px 7px 7px;
}

#counter {
	top: 30px;
	right: 35px;
	width: auto;
	position: absolute;
}

#slider-wrap.active #next {
	right: 0px;
}

#slider-wrap.active #previous {
	left: 0px;
}

/*bar*/
#pagination-wrap {
	min-width: 20px;
	margin-top: 270px;
	margin-left: auto;
	margin-right: auto;
	height: 15px;
	position: relative;
	text-align: center;
}

#pagination-wrap ul {
	width: 100%;
}

#pagination-wrap ul li {
	margin: 0 4px;
	display: inline-block;
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background: #fff;
	opacity: 0.5;
	position: relative;
	top: 0;
}

#pagination-wrap ul li.active {
	width: 12px;
	height: 12px;
	top: 3px;
	opacity: 1;
	box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}

#quick_menu {
	width: 95px;
	text-align: left;
	position: absolute;
	top: 100px;
	right: -150px;
	float: left;
}

#quick_menu img {
	width: 45px;
	height: 45px;
	opacity: 0.7;
	filter: alpha(opacity = 70); /* For IE8 and earlier */
}

/*Header*/
h1, h2 {
	text-shadow: none;
	text-align: center;
}

h1 {
	color: #666;
	text-transform: uppercase;
	font-size: 36px;
}

h2 {
	color: #7f8c8d;
	font-family: Neucha, Arial, sans serif;
	font-size: 18px;
	margin-bottom: 30px;
}

/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li {
	-webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-moz-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-ms-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}

#visual {
	position: relative;
}

.c {
	display: block;
	width: 1000px;
	margin: 20px auto;
	/* padding-left: 105px; */
	position: relative;
}

#poptext p {
	font-weight: 500;
	font-size: 30px;
	text-align: center;
	font-family: 'LotteMartHappy';
	font-style: normal;
	font-weight: 400;
	border-bottom: 1px solid #f2f2f2;
	width: 47%;
	margin: auto;
}

.btn {
	background-color: white;
	padding: 8px 18px;
	font-size: 16px;
	cursor: pointer;
	margin-left: 46%;
	outline: none;
}

/* Orange */
.moreButton {
	border-color: dodgerblue;
	color: #0042a5;
	border-radius: 15px;
	width: 100px;
	height: 40px;
	outline: none;
	margin-bottom: 20px;
	font-weight: bolder;
	font-size: 15px;
}

.moreButton:hover {
	background: dodgerblue;
	color: white;
	border-radius: 15px;
}

.loadMore {
	display: flex;
	justify-content: center;
}

.icon_section {
	width: 100%;
	height: 270px;
	margin: auto;
}

.icon_section_body {
	width: 50%;
	height: 270px;
	margin: auto;
}

.icon_button {
	width: 600px;
	height: 270px;
	margin: auto;
}

.icon {
	margin: 0 2.5% 2.5% 2.5%;
}

/* 아이콘 구분선 */
.icon_line {
	position: absolute;
	left: 0;
	right: 0;
}

.icon_line_right1 {
	left: 0;
	right: 0;
	height: 1px;
	border-bottom: 1px solid black;
}

.icon_line_bottom1, .icon_line_bottom2, .icon_line_bottom3 {
	
}

/*퀵메뉴*/
.quickmenu {
	margin-left: 1100px;
	text-align: center;
	width: 80px;
	height: auto;
	position: absolute;
}

.saveproduct, .recentlyproduct, .buttontop {
	color: #595959;
	font-size: 15px;
	font-weight: bolder;
}

.recentlyproduct {
	padding-bottom: 5px;
	border-bottom: 2px dotted rgb(136, 136, 136);
}

.save {
	padding: 10px;
	width: 100%;
	border: 1px solid rgb(204, 204, 204);
	background: rgb(255, 255, 255);
	margin-bottom: 6px;
}

.recently {
	padding: 10px;
	width: 100%;
	border: 1px solid rgb(204, 204, 204);
	background: rgb(255, 255, 255);
	margin-bottom: 6px;
}

.buttontop {
	padding: 10px;
	width: 100%;
	border: 1px solid rgb(204, 204, 204);
	background: rgb(255, 255, 255);
	margin-bottom: 6px;
}

.bt {
	background: none;
	border: white;
	font-size: 14px;
	font-weight: bolder;
	color: #595959;
	outline: none;
	cursor: pointer;
}

.nothing {
	color: #BFBFBF;
}
</style>
</head>
<!-- 해더부분 -->
<!--    <header>
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
         <li><a href="itemUploadPage.do" class="headerba">판매등록</a></li>
         <li><a href="log/sign" class="headerba">로그인/회원가입</a></li>
         <li><a href="my?page=main" class="headerba">마이페이지</a></li>
      </ul>
   </header> -->
<jsp:include page="header.jsp" flush="false" />

<body>

	<div id="wrap">
		<div id="visual">

			<div id="wrapper">
				<div id="#quick_menu">
					<div class="quickmenu">
						<div class="save">
							<div class="saveproduct">찜한상품</div>
							<div class="saveproducticon">
								<a class="spi" href=""><img src="data:imgae/png;" width="9"
									height="9" alt="">0</a>
							</div>
						</div>
						<div class="recently">
							<div class="recentlyproduct">최근본상품</div>

							<!-- 	<div class="rp">
								<div class="rpc">0</div>
							</div> -->
							<div class="rpi">
								<img src="image/my.png" width="70" height="70" alt="">
								<div class="nothing">
									최근 본 상품이<br>없습니다.
								</div>
							</div>
							<!-- 	<div class="sc-fYxtnH jueUQB">
				<button disabled="" class="sc-tilXH jJexRU">
					<img
						src=""
						width="5" height="9" alt="화살표 아이콘">
				</button>
				<div class="sc-hEsumM cZEqyY">1/1</div>
				<button disabled="" class="sc-tilXH jJexRU">
					<img
						src=""
						width="5" height="9" alt="화살표 아이콘">
				</button>
			</div> -->
						</div>
						<div class="buttontop">
							<button class="bt" onclick="topUP">TOP</button>
						</div>
					</div>
					<!-- quickmenu -->
				</div>
				<!-- quick_menu -->

				<div id="slider-wrap">
					<ul id="slider">
						<li>
							<div>
								<h3>Slide #1</h3>
							</div> <img src="image/banner1.jpg">
						</li>

						<li>
							<div>
								<h3>Slide #2</h3>
							</div> <img src="image/banner2.png">
						</li>

						<li>
							<div>
								<h3>Slide #3</h3>
							</div> <img src="image/banner3.jpg">
						</li>

						<li>
							<div>
								<h3>Slide #4</h3>
							</div> <img src="image/banner4.jpg">
						</li>
						<li>
							<div>
								<h3>Slide #5</h3>
							</div> <img src="image/banner5.jpg">
						</li>
						<li>
							<div>
								<h3>Slide #6</h3>
							</div> <img src="image/banner6.jpg">
						</li>
						<li>
							<div>
								<h3>Slide #7</h3>
							</div> <img src="image/banner7.jpg">
						</li>
						<li>
							<div>
								<h3>Slide #8</h3>
							</div> <img src="image/banner8.jpg">
						</li>
						<li>
							<div>
								<h3>Slide #9</h3>
							</div> <img src="image/banner9.jpg">
						</li>

					</ul>
					<!--controls-->
					<div class="btns" id="next">
						<i class="fa fa-arrow-right"></i>
					</div>
					<div class="btns" id="previous">
						<i class="fa fa-arrow-left"></i>
					</div>
					<div id="counter"></div>

					<div id="pagination-wrap">
						<ul>
						</ul>
					</div>
					<!--controls-->
				</div>

			</div>
			<!-- wrap -->

		</div>
	</div>

	<!-- 아이콘 -->
	<div class="icon_section">
		<div class="icon_section_body">
			<div class="icon_line">
				<i class="icon_line_right1"></i> <i class="icon_line_bottom1"></i> <i
					class="icon_line_bottom2"></i> <i class="icon_line_bottom3"></i>
			</div>
			<div class="icon_button">
				<a href="www.fork.com"><img class="icon" alt="버튼 1" src="image/fork.png"
					style="width: 100px; height: 100px;"></a> <a href="www.bicycle.com"><img
					class="icon" alt="버튼 2" src="image/bicycle.png"
					style="width: 100px; height: 100px;"></a> <a href="www.fork.com"><img
					class="icon" alt="버튼 3" src="image/book.png"
					style="width: 100px; height: 100px;"></a> <a href="www.book.com"><img
					class="icon" alt="버튼 4" src="image/clothes.png"
					style="width: 100px; height: 100px;"></a> <br /> <a href="www.clothes.com"><img
					class="icon" alt="버튼 5" src="image/console.png"
					style="width: 100px; height: 100px;"></a> <a href="www.console.com"><img
					class="icon" alt="버튼 6" src="image/cosmetics.png"
					style="width: 100px; height: 100px;"></a> <a href="www.cosmetics.com"><img
					class="icon" alt="버튼 7" src="image/desktop.png"
					style="width: 100px; height: 100px;"></a> <a href="www.desktop.com"><img
					class="icon" alt="버튼 8" src="image/digital-marketing.png"
					style="width: 100px; height: 100px;"></a>
			</div>
		</div>
	</div>

	<div id="poptext">
		<p>최신 게시물</p>
	</div>
	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	<table class="c">
		
		<c:forEach items="${itemList}" var="dto">
			<c:if test="${i%j == 0 }">
				<tr style="display: none">
			</c:if>

			<td class="c1"><a href="product.do?view=${dto.itemName}"
				style="text-decoration: none;"> <img
					src="image/${dto.itemName}.jpg" width="240" height="240">
					<p
						style="text-align: center; width: 240px; height: 20px; overflow: hidden;">
						${dto.itemName} <br />
					</p>
					<p
						style="text-align: center; width: 240px; height: 20px; overflow: hidden;">
						${dto.itemPrice}원</p>
			</a></td>

			<c:if test="${i%j == j-1 }">
			</c:if>
			<c:set var="i" value="${i+1 }" />
		</c:forEach>

	</table>
	<div class="loadMore" id="loadMore">
		<button class="moreButton">더보기</button>
	</div>


	<script>
		/* 더보기버튼 기능 */
		const tbody = document.querySelector("tbody");
		const rows = tbody.querySelectorAll("tr");
		const moreButton = document.querySelector(".moreButton");
		let count = 4;
		if (count > rows.length) {
			count = rows.length;
		}

		function showItem(count) {
			for (let i = 0; i < count; i++) {
				rows[i].style.display = 'block';
			}
		}

		showItem(count);

		let cnt = 0;

		moreButton.addEventListener("click", function() {
			if (cnt < 3) {

				var scrollPos = $(window).scrollTop();

				count += 3;
				if (count > rows.length) {
					count = rows.length;
				}
				showItem(count);

				$(window).scrollTop(scrollPos);
				cnt += 1;

				if (cnt == 3) {
					$("#loadMore").fadeOut('fast');
				}
			}

		});
		/* 더보기버튼 기능 끝 */

		
		/* 배너 */
		//current position
		var pos = 0;
		//number of slides
		var totalSlides = $('#slider-wrap ul li').length;
		//get the slide width
		var sliderWidth = $('#slider-wrap').width();

		$(document).ready(function() {

			//set width to be 'x' times the number of slides
			$('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

			//next slide    
			$('#next').click(function() {
				slideRight();
			});

			//previous slide
			$('#previous').click(function() {
				slideLeft();
			});

			//automatic slider
			var autoSlider = setInterval(slideRight, 3000);

			//for each slide 
			$.each($('#slider-wrap ul li'), function() {

				//create a pagination
				var li = document.createElement('li');
				$('#pagination-wrap ul').append(li);
			});

			//counter
			countSlides();

			//pagination
			pagination();

			//hide/show controls/btns when hover
			//pause automatic slide when hover
			$('#slider-wrap').hover(function() {
				$(this).addClass('active');
				clearInterval(autoSlider);
			}, function() {
				$(this).removeClass('active');
				autoSlider = setInterval(slideRight, 3000);
			});

			///퀵메뉴 스크롤 
			var defaultTop = parseInt($('.quickmenu').css('top'));
			$(document).on('scroll', function() {
				var scv = $(document).scrollTop();
				$('.quickmenu').stop().animate({
					'top' : scv + defaultTop + 'px'
				}, 1000);
			});

			$('.bt').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 1);
				return false;
			});

		});//DOCUMENT READY

		
		/* 배너 좌우 버튼 */
		function slideLeft() {
			pos--;
			if (pos == -1) {
				pos = totalSlides - 1;
			}
			$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

			//*> optional
			countSlides();
			pagination();
		}

		function slideRight() {
			pos++;
			if (pos == totalSlides) {
				pos = 0;
			}
			$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

			//*> optional 
			countSlides();
			pagination();
		}

		function countSlides() {
			$('#counter').html(pos + 1 + ' / ' + totalSlides);
		}

		function pagination() {
			$('#pagination-wrap ul li').removeClass('active');
			$('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
		}
	</script>

</body>
<hr>
<footer>
	<div id="footer_wrap">
		<div id="inner_footer">
			<dl id="bottom_1">
				<dt>안내문</dt>
				<br>
				<dd>1234-1234</dd>
				<dd>평일 09:00~18:00</dd>
				<dd>점심 13:00~14:00</dd>
				<dd>휴무 (토, 일, 공휴일)</dd>
			</dl>
			<dl id="bottom_2">
				<dt>은행</dt>
				<br>
				<dd>농협 123-123-123</dd>
				<dd>신한 1234-1234-12</dd>
				<dd>국민 123456-12345</dd>
				<dd>예금주 (주)사파리</dd>
			</dl>
			<dl id="bottom_3">
				<dt>배송관련</dt>
				<br />
				<dd>배송문의</dd>
				<dd>반품주소</dd>
				<dd>서울특별시 구로구 구로동</dd>
				<dd>시흥대로163길 33 주호타워 2층</dd>
			</dl>
			<dl id="bottom_4">
				<dt>자주하는 질문</dt>
				<br />
				<dd>
					<a href="자주하는 질문">자주하는 질문</a>
				</dd>
				<dd>
					<a href="공지사항">공지사항</a>
				</dd>
				<dd>
					<a href="Q&A">Q&A</a>
				</dd>
			</dl>
		</div>
		<address>
			<img
				alt="대표 OOO 사업자등록번호 000-00-0000 통신판매업신고 2020-0000-0000 대표전화 (02) 000-0000 팩스 (02) 000-000 이매일 00000@naver.com 주소 서울특별시 구로구 구로동 시흥대로 163길 33주호타워 2층,3층"
				src="image/address.png">
		</address>
	</div>

</footer>

</html>