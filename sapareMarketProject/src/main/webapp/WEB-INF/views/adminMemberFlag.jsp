<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
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

.profileArea {
	background-color: lightgray;
	margin: auto;
	width: 950px;
	margin-top: 25px;
}

.flagArea {
	height: 50px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	border-top: #8AB8F4 solid 1px;
}

#memberFlag {
	margin-right: 20px;
}

#profileImageBox {
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

.profileContainer {
	display: flex;
	width: 100%;
	border-top: #8AB8F4 solid 1px;
	border-bottom: #8AB8F4 solid 1px;
}

.profileContainer button {
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

.memberInfoContainer {
	display: flex;
	width: 100%;
	flex-direction: column;
	margin-left: 20px;
}

.nicknameBox {
	display: inline-flex;
	height: 50px;
	align-items: center;
	width: 95%;
	border: #8AB8F4 solid 1px;
	cursor: default;
}

.nicknameBox div {
	margin-right: 10px;
	width: auto;
	white-space: nowrap;
	overflow: hidden;
}

.memberAbout {
	display: inline-flex;
	align-items: flex-start;
	width: 80%;
	height: 165px;
	border: #8AB8F4 solid 1px;
}

.memberAbout textarea {
	resize: none;
	font-size: 15px;
	border: none;
	outline: none;
	background-color: lightgray;
	cursor: default;
	font-family: Montserrat;
}

.memberPointArea {
	height: 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 20%;
	border: #8AB8F4 solid 1px;
}

.menuAndContentArea {
	display: flex;
	width: 100%;
	flex-direction: row;
	height: auto;
}

.profileMenu {
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

.menuButtons li a {
	display: block;
	text-decoration: none;
	padding: 20px 0px;
	color: #00008B;
	border-radius: 0px 20px 20px 0px;
}

.menuButtons
 
li
 
a
:hover
:not
 
(
.active
 
)
{
background-color
:
 
#694228
;

	
color
:
 
white
;


}

/* 현재 페이지에 해당하는 메뉴 버튼 색깔 바꿔주기 */
.menuButtons li:nth-child(3) a {
	background-color: #8AB8F4;
	color: white;
}

.profileContent {
	display: flex;
	width: 80%;
	height: 100%;
	margin-left: 15px;
	margin-top: 15px;
	margin-right: 10px;
	flex-direction: column;
	overflow: hidden;
}

.contents {
	display: flex;
	flex-direction: column;
	width: 100%;
	height: 100%;
	margin-top: 10px;
	overflow: hidden;
	margin-bottom: 15px;
}

.contentOptions {
	display: flex;
	width: 100%;
	height: 5%;
	align-items: center;
	justify-content: flex-end;
	padding-top: 5px;
}

.contentOptions select {
	margin-left: 20px;
	outline: none;
}

.wantItemWrapper {
	height: auto;
	overflow: hidden;
}

.wantItemWrapper ul {
	margin: 0;
	float: left;
	width: 100%;
	display: flex;
	flex-wrap: wrap;
}

.wantItemWrapper ul li {
	width: 30%;
	margin-right: 2%;
	min-height: auto;
	flex: 0 0 31.3333333%;
}

.wantItemInside {
	display: flex;
	flex-direction: column;
	margin-bottom: 15%;
	margin-top: 5%;
}

.itemImageBox {
	width: 100%;
	background-color: lightgray;
	position: relative;
	display: flex;
	flex-flow: column;
}

.itemImageBox img {
	height: 250px;
	max-width: 100%;
	border-radius: 5px;
	object-fit: cover;
}

.itemDescribeBox {
	height: 50px;
	display: flex;
	flex-direction: row;
	margin-top: 10px;
	margin-left: 5px;
	margin-bottom: 5px;
}

.itemDescribeBox>div:nth-child(1) {
	display: flex;
	flex-direction: column;
	height: 100%;
	width: 75%;
}

.itemDescribeBox>div:nth-child(2) {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
	width: 25%;
}

.itemName {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	height: 60%;
	display: flex;
	align-items: center;
	font-size: 16px;
}

.itemPrice {
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
<title>관리페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('.Updd').click(function(){
							alert('처리되었습니다.');
							$('.'+ this.id).submit();
						});

					}); // end ready()
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<!-- header 끝 -->

	<div class="wrap">
			<div class="menuAndContentArea">
				<div class="profileMenu">
					<ul class="menuButtons">
						<li><a href="adminPage.do">현황</a>
						<li><a href="adminMember.do">회원관리</a></li>
						<li><a href="adminMemberFlag.do">회원신고접수</a></li>
						<li><a href="adminItemFlag.do">게시글 신고접수</a></li>
						<li><a href="adminMessage.do">문의메세지</a></li>
					</ul>
				</div>
				<div id="members" style="height: 800px; ">
				
					<table class="table " style="font-size: small;">
						<tr class="table-primary">
							<th scope="col">신고번호</th>
							<th scope="col">신고자 아이디</th>
							<th scope="col">신고할 아이디</th>
							<th scope="col">신고카테고리</th>
							<th scope="col">신고내용</th>
							<th scope="col">처리유무</th>
						</tr>
						<c:forEach items="${memberFlag}" var="dto">
							<tr>
								<form action="memberFlagUpdate.do" id="frmm" method="post" class="Updd${dto.memberFlagNo}"> 
								<td>${dto.memberFlagNo}<input hidden="hidden" name="memberFlagNo" value="${dto.memberFlagNo}"/></td>
								<td>${dto.memberName}</td>
								<td><a>${dto.memberFlaggerName}</a></td>
								<td>${dto.memberFlagCategory}</td>
								<td>${dto.memberFlagContent}</td>
								<td><button type="button" id="Updd${dto.memberFlagNo}" class="Updd">처리</button></td>
								<!-- <a href='<c:url value='memberFlagUpdate.do=${memberFlagNo}'/>'>처리</a> -->
								</form>
							</tr>
							
						</c:forEach>
						
					</table>
				
				</div>
			</div>
</div>
			<footer> footer area </footer>
</body>
</html>