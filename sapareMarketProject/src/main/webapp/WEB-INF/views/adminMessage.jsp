<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	text-decoration: none;
	margin: 0;
	padding: 0;
}

.contents input {
	border: 1px solid #e8ebed;
	font-size: 16px;
}

button {
	cursor: pointer;
}

input, button {
	outline: none;
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
	cursor: default
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
.menuButtons li:nth-child(5) {
	width: 100%
}

.menuButtons li a {
	display: block;
	text-decoration: none;
	padding: 20px 0px;
	color: #00008B;
	border-radius: 0px 20px 20px 0px;
}

.menuButtons li a:hover:not (.active ) {
	background-color: #694228;
	color: white;
}

/* 현재 페이지에 해당하는 메뉴 버튼 색깔 바꿔주기 */
.menuButtons li:nth-child(5) a {
	background-color: #8AB8F4;
	color: white;
}

.profileContent {
	display: flex;
	width: 80%;
	height: 100%;
	margin-left: 15px;
	margin-top: 30px;
	margin-right: 10px;
	flex-direction: column;
}

.contents {
	display: flex;
	flex-direction: column;
	width: 100%;
	height: 100%;
	margin-top: 35px;
	margin-left: 15px;
	margin-bottom: 15px;
	overflow:auto;
}

.contents ul {
	list-style: none;
	margin: 0;
}

.contents ul li {
	margin-bottom: 15px;
	display: flex;
	height: 40px;
	flex-wrap: wrap;
}

.contents ul li>div {
	float: left;
}

.contents ul li>div:first-child {
	width: 25%;
	line-height: 35px;
	font-size: 16px;
}

.contents ul li>div:nth-child(2) {
	width: 50%;
}

.contents ul li>div:nth-child(2) div {
	line-height: 35px;
	font-size: 16px;
}

.contents ul li>div:nth-child(2) input {
	width: 97%;
	border-radius: 3px;
	height: 38px;
	font-size: 16px;
}

.contents ul li>div:nth-child(3) {
	width: 15%;
}

.contents ul li>div:nth-child(3) button {
	border: 1px solid #8AB8F4;
	border-radius: 3px;
	text-align: center;
	color: #8AB8F4;
	padding: 7px 0;
	width: 100%;
	font-size: 15px;
}

.contents ul li button {
	box-shadow: 0px 3px 1px -2px rgba(0, 0, 0, 0.2), 0px 2px 2px 0px
		rgba(0, 0, 0, 0.14), 0px 1px 5px 0px rgba(0, 0, 0, .12);
	transition: box-shadow 280ms cubic-bezier(0.4, 0, 0.2, 1);
}

.contents ul li button:hover {
	box-shadow: 0px 2px 4px -1px rgba(0, 0, 0, 0.2), 0px 4px 5px 0px
		rgba(0, 0, 0, 0.14), 0px 1px 10px 0px rgba(0, 0, 0, .12);
	background-color: #E6F6FB;
}

.contents ul li input:focus {
	border: 1px solid rgba(81, 203, 238, 1);
}

.memberIdCheck {
	margin-top: 10px;
}

.memberIdInput {
	height: 38px;
	width: 97%;
	border-radius: 3px;
	margin-top: 10px;
}

.contents ul li:nth-child(2) {
	margin-bottom: 30px;
}

.contents ul li:nth-child(4) {
	
}

.contents ul li:nth-child(5) {
	height: 65px;
	flex-wrap: unset;
}

.contents ul li:nth-child(7) {
	
}

.phoneNumCheck {
	margin-top: 10px;
}

.phoneNumInput {
	height: 38px;
	width: 97%;
	border-radius: 3px;
	margin-top: 10px;
}

.deleteBtnBox {
	margin-top: 30%;
	margin-left: 82%;
}

.deleteBtnBox button {
	outline: none;
	color: gray;
	border: none;
	padding: 10px;
	text-align: center;
	background-color: lightgray;
}
</style>
<meta charset="UTF-8">
<title>문의 메세지 관리</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
						<li><a href="adminItemFlag.do">상품 신고접수</a></li>
						<li><a href="adminMessage.do">문의메세지</a></li>
					</ul>
				</div>
				<div class="profileContent">
					<div class="contents" style="height: 800px; ">
					<table class="table">
						<tr class="table-primary">
							<th scope="col">문의번호</th>
							<th scope="col">문의이메일</th>
							<th scope="col">문의내용</th>
						</tr>
					   <c:forEach items="${Messages}" var="dto">
							<tr>
								<td>${dto.qNo}<input hidden="hidden" name="qNo" value="${dto.qNo}"/></td>
								<td>${dto.qEmail}</td>
								<td>${dto.qContent}</td>
								<%-- <td><button type="button" id="Updd${dto.memberFlagNo}" class="Updd">처리</button></td> --%>
								<!-- <a href='<c:url value='memberFlagUpdate.do=${memberFlagNo}'/>'>처리</a> -->
							</tr>
						</c:forEach>
					</table>
					</div>
				</div>
			</div>
		</div>
</body>
<jsp:include page="footer.jsp" />
</html>