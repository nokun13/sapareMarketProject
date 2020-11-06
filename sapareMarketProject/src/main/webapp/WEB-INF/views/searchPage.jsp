<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    position: relative;
    color: #fff;
    text-shadow: rgba(0, 0, 0, 0.1) 2px 2px 0px;
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

#previous {
	left: -50px;
	border-radius: 0px 7px 7px 7px;
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

/* 더보기 */
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


/*퀵메뉴*/
#wrapper {
	width: 1000px;
	margin: 15px auto;
	position: relative;
	color: #fff;
	text-shadow: rgba(0, 0, 0, 0.1) 2px 2px 0px;
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

.searchNameP {
	margin: auto;
	height: 35px;
	width: 990px;
	-webkit-text-stroke: thin;
    font-size: x-large;
}
</style>
</head>

<jsp:include page="header.jsp" flush="false" />
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
			<a href="www.naver.com">
				<img id="#left_banner_" alt="banner_" src="image/banner11.jpeg">
			</a>
		</div>
	</div>
</div>

<body>

	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	<div class="searchNameP">' ${searchWord} ' 에 검색 결과</div>
	<table class="c">

		<c:forEach items="${searchList}" var="dto">
			<c:if test="${i%j == 0 }">
				<tr style="display: none">
			</c:if>
			<td class="c1"><a href="itemViewPage.do?itemId=${dto.itemId}"
				style="text-decoration: none;"> <img
					src="image/${dto.itemImagePath}" width="235" height="240">
					<p
						style="text-align: center; width: 245px; height: 20px; overflow: hidden;">
						${dto.itemName} <br />
					</p>
					<p style="text-align: center; width: 245px; height: 20px; overflow: hidden; margin-bottom: 10px;">
						<fmt:formatNumber value="${dto.itemPrice }" pattern="#,###,###,###" />원</p>
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
		
		$(document).ready(function(){
			
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

		});//ready
	</script>

</body>
<jsp:include page="footer.jsp" />
</html>