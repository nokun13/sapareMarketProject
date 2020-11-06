<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.c1 img  {
	border: none;
	vertical-align: top;
	padding: 5px;
	border-radius: 15px;
	object-fit: cover;
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
	border-radius: 10px;
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

/*퀵메뉴*/
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
.quickmenu {
	margin-left: 1050px;
	text-align: center;
	width: 80px;
	height: auto;
	position: absolute;
}
/*퀵메뉴 끝*/

/* left banner */
.ADD {
	position: absolute;
    right: 1050px;
}
.ADD_position {
	border: 0px;
	border-style: none;
}

/* left banner END */

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
	margin-top: 45px;
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
    font-family: 'LotteMartHappy';
    font-style: normal;
    font-weight: 400;
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
	margin-top: 40px;
}

.icon_section_body {
	width: 53%;
	height: 270px;
	margin: auto;
}

.icon_button {
	width: 720px;
	height: 270px;
	margin: auto;
}

.icon {
	margin: 0 4.5% 2.5% 4.5%;
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

/* .icon_line_bottom1, .icon_line_bottom2, .icon_line_bottom3 {
	
} */

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
							<div class="recentlyproduct">최근본상품"${msg}"</div>

							<div class="rpi">
								<img src="image/my.png" width="70" height="70" alt="">
								<div class="nothing">
									최근 본 상품이<br>없습니다.
								</div>
							</div>

						</div>
						<div class="buttontop">
							<button class="bt" onclick="topUP">TOP</button>
						</div>
					</div>
					<!-- quickmenu -->
				</div>
				
				<!-- left banner -->
				<div class="ADD">
					<div class="ADD_position">
						<a href="">
						<img id="#left_banner_" alt="banner_" src="image/banner11.jpeg">
						</a>
					</div>
				</div>
				<!-- left banner -->

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
				<a href="search.do?searchWord=의류"><img class="icon" alt="버튼 1" src="image/clothes.png" style="width: 100px; height: 100px;"></a> 
					<a href="search.do?searchWord=스포츠"><img class="icon" alt="버튼 2" src="image/bicycle.png" style="width: 100px; height: 100px;"></a> 
					<a href="search.do?searchWord=화장품"><img	class="icon" alt="버튼 3" src="image/cosmetics.png" style="width: 100px; height: 100px;"></a> 
					<a href="search.do?searchWord=음식"><img	class="icon" alt="버튼 4" src="image/fork.png" style="width: 100px; height: 100px;"></a> 
					<br /> 
					<a href="search.do?searchWord=게임"><img class="icon" alt="버튼 5" src="image/console.png" style="width: 100px; height: 100px;"></a> 
					<a href="search.do?searchWord=책"><img class="icon" alt="버튼 6" src="image/book.png" style="width: 100px; height: 100px;"></a> 
					<a href="search.do?searchWord=전자"><img class="icon" alt="버튼 7" src="image/desktop.png" style="width: 100px; height: 100px;"></a> 
					<a href="search.do?searchWord=리포트"><img class="icon" alt="버튼 8" src="image/digital-marketing.png" style="width: 100px; height: 100px;"></a>
			</div>
		</div>
	</div>

	<div id="poptext">
		<hr width="1000px" style="width: 1000px; margin: auto;" >
	</div>
	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	<table class="c">
		
		<c:forEach items="${itemList}" var="dto">
			<c:if test="${i%j == 0 }">
				<tr style="display: none">
			</c:if>

			<td class="c1">
				<c:url var="path" value="itemViewPage.do">
	               <c:param name="itemId" value="${dto.itemId}" />
	            </c:url>
				<a href="${path}" style="text-decoration: none;">
				<c:if test="${fn:contains(dto.itemStatus, 'n')}">
			    	<img src="image/soldout.png" style="object-fit:contain;" width="235" height="235">
				</c:if> 
				<c:if test="${fn:contains(dto.itemStatus, 'y')}">
				    <img src="image/${dto.itemImagePath}" width="235" height="235">
				</c:if> 
					<p style="text-align: center; width: 235px; height: 20px; overflow: hidden; ">
						${dto.itemName} <br />
					</p>
					<p style="text-align: center; width: 235px; height: 20px; overflow: hidden; margin-bottom: 10px;">
						<fmt:formatNumber value="${dto.itemPrice }" pattern="#,###,###,###" />원</p>
			</a>
			</td>

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
   		// 탈퇴/신고된 회원이면 파라미터값으로 넘겨준다
    	var cancel = getParam("cancelMember");
    	var flag = getParam("flagMember");
    	// 탈퇴/신고처리 확인
  		if (cancel == 1) {
  			alert("탈퇴한 회원입니다.");
  		};
  		if (flag == 1) {
  			alert("신고처리된 회원입니다.");
  		};  
    	 
		// 로그인 실패 시 알람 
		var msg = getParam("msg");
		
		if (msg == "failure"){
			alert("로그인에 실패하였습니다.");
		}
    	 
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
				}, -1);
			});

			$('.bt').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 0);
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
<jsp:include page="footer.jsp" flush="false" />

</html>