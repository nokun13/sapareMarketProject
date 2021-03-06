<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.net.URLEncoder"%>
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

.c1 img {
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
	height: 210px;
	position: relative;
	color: #fff;
	text-shadow: rgba(0, 0, 0, 0.1) 2px 2px 0px;
}

#slider-wrap {
	width: 1000px;
	height: 210px;
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
	height: 210px;
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
	cursor: pointer;
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
	height: 240px;
	margin: auto;
	margin-top: 40px;
}

.icon_section_body {
	width: 57%;
	height: 240px;
	margin: auto;
}

.icon_button {
	width: 810px;
	height: 220px;
	margin: auto;
}

.icon {
	margin: 0 6% 2.5% 6%;
}

img.icon {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
/*상단 이미지 6개 브랜드*/
img.icon:hover {
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
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

/* .nothing {
	color: #BFBFBF;
} */
</style>
</head>

<jsp:include page="header.jsp" flush="false" />
<body>

	<div id="wrap">
		<div id="visual">

			<div id="wrapper">
				<div id="#quick_menu">
					<div class="quickmenu">
						<c:if test="${sessionScope.memberName != null}">
						<div class="save">
							<div class="saveproduct">
								<a class="spi" href="profileWant.do?memberName=${sessionScope.memberName }">찜한상품 <!-- <img src="data:imgae/png" width="9"	height="9" alt="">0 -->
								</a>
							</div>
						</div>
						<div class="recently">
							<div class="recentlyproduct">
								<ul>
									<c:forEach items="${wantList }" var="dto">
									<li class="wantItemBox" style="height: 110px;">
										<a class="wantItemCard" href="itemViewPage.do?itemId=${dto.itemId }">
											<div class="wantItemInside">
												<div class="itemImageBox">
													<c:if test="${fn:contains(dto.itemStatus, 'n')}">
												    	<img src="/sapare/img/soldout.png" width=75 height=75 style="object-fit:contain;">
													</c:if> 
													<c:if test="${fn:contains(dto.itemStatus, 'y')}">
													    <img src="/sapare/img/${dto.itemImagePath}" onerror="this.src='/sapare/img/defaultAD.png'" width=75 height=75 style="object-fit:contain;">
													</c:if> 
												</div>
												<div class="itemDescribeBox">
													<div>
														<div class="itemName" style="font-size: smaller;line-height: 15px;white-space:nowrap;overflow:hidden;">${dto.itemName }</div>
													</div>
												</div>
											</div>
										</a>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						</c:if>
						<div class="buttontop">
							<button class="bt" onclick="topUP">TOP</button>
						</div>
					</div>
					<!-- quickmenu -->
				</div>
				
				<!-- left banner -->
				<div class="ADD">
					<div class="ADD_position">
						<a href="http://www.naver.com" target="_blank">
						<img id="#left_banner_" alt="banner_" src="/sapare/img/banner11.jpeg">
						</a>
					</div>
				</div>
				<!-- left banner -->

				<div id="slider-wrap">
					<ul id="slider">
						<li>
							<div>
							</div> <img src="/sapare/img/banner1.jpg" style="object-fit:cover;">
						</li>

						<li>
							<div>
							</div> <img src="/sapare/img/banner2.png" style="object-fit:cover;">
						</li>

						<li>
							<div>
							</div> <img src="/sapare/img/banner3.jpg" style="object-fit:cover;">
						</li>

						<li>
							<div>
							</div> <img src="/sapare/img/banner4.jpg" style="object-fit:cover;">
						</li>
						<li>
							<div>
							</div> <img src="/sapare/img/banner5.jpg" style="object-fit:cover;">
						</li>
						<li>
							<div>
							</div> <img src="/sapare/img/banner6.jpg" style="object-fit:cover;">
						</li>
						<li>
							<div>
							</div> <img src="/sapare/img/banner7.jpg" style="object-fit:cover;">
						</li>
						<li>
							<div>
							</div> <img src="/sapare/img/banner8.jpg" style="object-fit:cover;">
						</li>
						<li>
							<div>
							</div> <img src="/sapare/img/banner9.jpg" style="object-fit:cover;">
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
				<a href="searchcategory.do?searchWord=의류">
					<img class="icon" alt="버튼 1" src="/sapare/img/clothes.png" style="width: 100px; height: 100px;">
				</a> 
				<a href="searchcategory.do?searchWord=스포츠">
					<img class="icon" alt="버튼 2" src="/sapare/img/bicycle.png" style="width: 100px; height: 100px;">
				</a> 
				<a href="searchcategory.do?searchWord=화장품">
					<img class="icon" alt="버튼 3" src="/sapare/img/cosmetics.png" style="width: 100px; height: 100px;">
				</a> 
				<a href="searchcategory.do?searchWord=음식">
					<img class="icon" alt="버튼 4" src="/sapare/img/fork.png" style="width: 100px; height: 100px;"> 
				</a> 
				
				<br />
				<a href="searchcategory.do?searchWord=게임">
					<img class="icon" alt="버튼 5" src="/sapare/img/console.png" style="width: 100px; height: 100px;">
				</a> 
				<a href="searchcategory.do?searchWord=책">
					<img class="icon" alt="버튼 6" src="/sapare/img/book.png" style="width: 100px; height: 100px;"> 
				</a> 
				<a href="searchcategory.do?searchWord=전자">
					<img class="icon" alt="버튼 7" src="/sapare/img/desktop.png" style="width: 100px; height: 100px;">
				</a> 
				<a href="search.do?searchWord=유아">
					<img class="icon" alt="버튼 8" src="/sapare/img/baby-products.png" style="width: 100px; height: 100px;"> 
				</a>
			</div>
			<!-- icon_button End -->
		</div>
	</div>

	<hr width="1000px" style="width: 1000px; margin: auto;" >
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
				<c:if test="${fn:contains(dto.itemStatus, 'n')}"> <!-- JSTL: itemStatus = 판매상태 ('n'이면 판매완료) -->
			    	<img src="/sapare/img/soldout.png" style="object-fit:contain;" width="235" height="235">
				</c:if> 
				<c:if test="${fn:contains(dto.itemStatus, 'y')}"> <!-- JSTL: itemStatus = 판매상태 ('y'이면 판매중) -->
				    <img src="/sapare/img/${dto.itemImagePath}" onerror="this.src='/sapare/img/defaultAD.png'" width="235" height="235">
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
	//
	// recent item    
	var Cpage; // 현재 페이지 
	var pagingSize = 4; // 원하는 페이지 사이즈로 조정하세용 
	function chkRecent(a) {
		var itemID = getCookie("${itemId}");
		$("#recentlyproduct ul").html(''); // 일단 Ul 내용 지우기... 
		if (itemID) {
			var totcount = itemID.split('&').length - 1; //
			var totpage = Math.ceil(totcount / pagingSize) * 1;
			
			Cpage = (totpage >= a) ? a : 1;
			Cpage = (Cpage < 1) ? totpage : Cpage;
			
			var start = (Cpage - 1) * pagingSize;
			
			for (i = start; i <= start + (pagingSize - 1); i++) {
			var thisItem = itemID.split('&')[i];
				if (thisItem) {
					var itemId = thisItem.split(':')[0];
					var itemImg = thisItem.split(':')[1];
					
					var ap = "<li><a href='http://localhost:8090/sapare/itemViewPage.do?itemId='"+itemId
							+ "' target='_top'><img src='/sapare/img/"+itemImg
							+ "' width='75' border=1></a>"
							+ "<div class='detail'><a href='javascript:removeRecentItem('\'"+itemname+"'\')' class='btn_delete'>삭제</a></div></li>";
							
					$("#recentlyproduct ul").append(ap);
				}
			}
			$("#paging").show();
		} else {
			$("#recentlyproduct ul").append('<p class="noData">최근 본 상품이<br> 없습니다.</p>');
			$("#paging").hide();
			$("#recentCnt").text('');
		}
		updateRecentPage(totcount, Cpage);
	}
	chkRecent(1);
	
/* 	function removeRecentItem(itemname) {
		var itemID = getCookie("${itemId}");
		itemID = itemID.replace(itemname + "&", "");
		setCookie("${itemId}", itemID, 1);
		chkRecent(Cpage);
	} */
	/* function updateRecentPage(totcount, Cpage) { //
		
		$("#recentCnt").text(totcount); //
		
		$("#totalPageCount").text("/" + Math.ceil((totcount / pagingSize) * 1));
		if (Math.ceil((totcount / pagingSize) * 1) < Cpage) {
			$("#currentPage").text(Math.ceil((totcount / pagingSize) * 1));
		} else {
			$("#currentPage").text(Cpage); //
		}
	} */
	$(".btn_next").on('click', function() {
		chkRecent(Cpage + 1);
	});
	$(".btn_prev").on('click', function() {
		chkRecent(Cpage - 1);
	});
	</script>
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
    	var noid = getParam("noId");
    	var itemFlag = getParam("itemFlag");
    	var loginFirst = getParam("loginFirst");
    	
    	// 없는 아이디 로그인 시
    	if(noid == 1){
    		alert("회원가입이 안 된 아이디입니다.");
    	}
    	// 탈퇴/신고처리 확인
  		if (cancel == 1) {
  			alert("탈퇴한 회원입니다.");
  		};
  		if (flag == 1) {
  			alert("신고처리된 회원입니다.");
  		};  
  		if (itemFlag == 1){
  			alert("신고처리된 회원입니다.");
  		}
  		if (loginFirst == 1){
  			alert("로그인을 먼저 해주세요!");
  		}
    	 
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
				}, 0);
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