<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.wrap{
	justify-content: center;
	align-items: center;
	
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
	cursor: default;
	border: #8AB8F4 solid 1px;
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
.menuButtons li:nth-child(2) {
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
.menuButtons li:nth-child(2) a {
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

.contentOptions {
	display: flex;
	width: 100%;
	height: 5%;
	align-items: center;
	justify-content: flex-end;
	padding-top: 5px;
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

.contentOptions select {
	outline: none;
}

.buyItemBox {
	display: flex;
	width: 100%;
	height: 150px;
	background-color: gray;
	flex-direction: row;
	margin-bottom: 2%;
	border-radius: 5px;
}

.buyItemImg {
	height: 100%;
	width: 20%;
	border-radius: 5px;
}

.buyItemImg a {
	height: 100%;
	width: 100%;
}

.buyItemImg a img {
	height: 100%;
	width: 100%;
	border-radius: 5px;
}

.buyItemInfo {
	display: flex;
	flex-direction: row;
	width: 80%;
}

.allItemInfo {
	display: flex;
	flex-direction: column;
	width: 75%;
	height: 100%;
}

.itemStatusBox {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 25%;
	height: 100%;
	flex-direction: column;
}

.reviewBox {
	display: none;
	width: 100%;
	height: 150px;
	background-color: #F0F8FF;
	flex-direction: row;
	margin-bottom: 2%;
	border-radius: 5px;
}

.buyerImgBox {
	height: 100%;
	width: 20%;
	border-radius: 5px;
}

.buyerImgBox a {
	height: 100%;
	width: 100%;
}

.buyerImgBox a img {
	height: 100%;
	width: 100%;
}

.buyerReviewBox {
	display: flex;
	flex-direction: column;
	width: 80%;
	height: 100%;
}

.writeReviewWrapper {
	display: none;
	width: 100%;
	height: 150px;
	background-color: #F0F8FF;
	flex-direction: row;
	margin-bottom: 3%;
	border-radius: 5px;
}

.writeReview {
	font-family: sans-serif;
	border: 1px solid #e8ebed;
	font-size: 14px;
	resize: none;
	outline: none;
}

.writeReview:focus {
	border: 1px solid rgba(81, 203, 238, 1);
}

.reviewWriteBox {
	display: flex;
	flex-direction: column;
	width: 80%;
	height: 100%;
	margin-left: 20px;
	margin-top: 10px;
}

.reviewContent {
	margin-bottom: 10px;
}

.reviewInsertBox {
	height: 100%;
	width: 20%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.contents button {
	border: 1px solid #8AB8F4;
	border-radius: 3px;
	text-align: center;
	color: #8AB8F4;
	width: 60%;
	height: 20%;
	font-size: 13px;
	box-shadow: 0px 3px 1px -2px rgba(0, 0, 0, 0.2), 0px 2px 2px 0px
		rgba(0, 0, 0, 0.14), 0px 1px 5px 0px rgba(0, 0, 0, .12);
	transition: box-shadow 280ms cubic-bezier(0.4, 0, 0.2, 1);
	outline: none;
	cursor: pointer;
}

.contents button:hover {
	box-shadow: 0px 2px 4px -1px rgba(0, 0, 0, 0.2), 0px 4px 5px 0px
		rgba(0, 0, 0, 0.14), 0px 1px 10px 0px rgba(0, 0, 0, .12);
	background-color: #E6F6FB;
}
</style>
<meta charset="UTF-8">
<title>사파리 회원관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						
						
						$('.btn').click(function(){
							alert('처리되었습니다.');
							$('.'+ this.id).submit();

						});
							$("#selectbox > option[value="+'<c:out value="${ param.selectbox }"/>'+"]").attr("selected","selected");
					
						
					});
	
				
					
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
						<li><a href="adminMember.do" id="memberrule">회원관리</a></li>
						<li><a href="adminMemberFlag.do">회원신고접수</a></li>
						<li><a href="adminItemFlag.do">상품 신고접수</a></li>
						<li><a href="adminMessage.do">문의메세지</a></li>
					</ul>
				</div>
				<div class="profileContent" style="height: 800px; ">
					<div class="contentOptions">
						<select class="form-control" id="selectbox" name="selectbox" style="width: 150px;" onchange="if(this.value) location.href=(this.value)">
							<option value="">선택</option>
							<option value="adminMemberorder.do?selectbox=adminMemberorder.do" ${param.selectbox eq "adminMemberorder.do" ? "selected":""}>이름순</option>
							<option value="adminDateOrder.do?selectbox=adminDateOrder.do" ${param.selectbox eq "adminDateOrder.do" ? "selected":""}>가입일순</option>
							<option value="adminRankOrder.do?selectbox=adminRankOrder.do" ${param.selectbox eq "adminRankOrder.do" ? "selected":""}>등급순</option>
						</select>
					</div>
					<div class="contents">
						<div id="members">
							<table class="table" style="font-size: small;">
								<tr class="table-primary">
									<th scope="col">닉네임</th>
									<th scope="col">가입일</th>
									<th scope="col">등급</th>
									<th scope="col">판매상품</th>
									<th scope="col">구매상품</th>
									<th scope="col">신고횟수</th>
									<th scope="col">프리미엄</th>
									<th scope="col">탈퇴유무</th>
								</tr>
								<c:forEach items="${memberJo}" var="dto">
									<tr>	
										<td>${dto.nickname}<input hidden="hidden" name="memberId" value="${dto.memberId}"/></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${dto.enrollDate}" /></td>
										<td>${dto.memberRank}</td>
										<td>${dto.buyCount}</td>
										<td>${dto.sellCount}</td>
										<td>${dto.memberFlagCnt}</td>
										<td>${dto.memberPremium}</td>
										<td>${dto.delFlag }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>

</body>
<jsp:include page="footer.jsp" />
</html>