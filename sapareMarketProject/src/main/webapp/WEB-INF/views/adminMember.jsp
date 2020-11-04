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
<title>관리페이지</title>
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
						// 후기 toggle 기능 
						$(".reviewToggleBtn").click(function(e) {
							$('.' + this.id).slideToggle();
							$('.' + this.id).css('display', 'flex');
						});

						// 후기 올리기 toggle 기능
						$(".leaveReviewBtn").click(function() {
							$('.' + this.id).slideToggle();
							$('.' + this.id).css('display', 'flex');
						});
						// 닉네임 변경 버튼 클릭 후 현재 닉네임 가져오기
						$("#changeNick")
								.click(
										function() {

											$
													.ajax({
														type : 'GET',
														dataType : 'json',
														url : 'memberInfoGet.do?memberName=${member.memberName}',
														success : change_nickname,
														error : function(
																request,
																status, error) {
															alert("code:"
																	+ request.status
																	+ "\n"
																	+ "message:"
																	+ request.responseText
																	+ "\n"
																	+ "error:"
																	+ error);
														}
													});

										});

						// 닉네임 중복 체크
						function change_nickname(res) {

							$("#changeNick")
									.prev()
									.html(
											'<input type="text" id="newNickname" maxlength="15" value="'+res.nickname+'" style="font-size:16px;outline:none;"> <button type="button" id="submitNick" style="cursor:pointer;">확인</button>');
							$("#changeNick").hide();

							// 닉네임 변경 엔터 버튼 클릭 기능
							var input = document.getElementById("newNickname");

							input.addEventListener("keyup", function(event) {
								if (event.keyCode === 13) {
									event.preventDefault();
									document.getElementById("submitNick")
											.click();
								}
							});

							$('#submitNick').click(
									function() {
										$.ajax({
											type : 'GET',
											dataType : 'json',
											url : 'checkNickname.do?nickname='
													+ $("#newNickname").val(),
											success : get_new_nickname,
											error : function(request, status,
													error) {
												alert("code:" + request.status
														+ "\n" + "message:"
														+ request.responseText
														+ "\n" + "error:"
														+ error);
											}
										});
									});
						}
						;

						// 닉네임 변경
						function get_new_nickname(res) {
							if (res == 1) {
								alert("이미 존재하는 닉네임입니다.");
							} else {
								$
										.ajax({
											type : 'GET',
											dataType : 'json',
											url : 'changeNickname.do?memberName=${member.memberName}&nickname='
													+ $("#newNickname").val(),
											success : change_to_new_nickname,
											error : function(request, status,
													error) {
												alert("code:" + request.status
														+ "\n" + "message:"
														+ request.responseText
														+ "\n" + "error:"
														+ error);
											}
										});
							}
						}
						;

						// 닉네임 변경 후 변경 된 닉네임으로 바꿔주고 수정버튼 재생성
						function change_to_new_nickname(res) {
							$('.nickname').html(res.nickname);
							$('#changeNick').show();
						}
						;

						// 소개글 변경 버튼 클릭 후 소개글 가져오기
						$("#changeAbout")
								.click(
										function() {

											$
													.ajax({
														type : 'GET',
														dataType : 'json',
														url : 'memberInfoGet.do?memberName=${member.memberName}',
														success : change_about_content,
														error : function(
																request,
																status, error) {
															alert("code:"
																	+ request.status
																	+ "\n"
																	+ "message:"
																	+ request.responseText
																	+ "\n"
																	+ "error:"
																	+ error);
														}
													});

										});

						// textarea 변경가능으로 바꾸고 소개글 뿌려주기, 확인 버튼 누르면 저장
						function change_about_content(res) {

							$(".memberAbout")
									.html(
											'<textarea id="aboutContent" rows="8" cols="65" maxlength="80" style="background-color:white;border:1px solid black;cursor:auto;">'
													+ res.memberAbout
													+ '</textarea>')
							$(".aboutChangeBox")
									.append(
											'<button type="button" id="submitAbout" style="margin: 10px; cursor:pointer;">확인</button>');

							$("#changeAbout").hide();

							$("#submitAbout")
									.click(
											function() {
												$
														.ajax({
															type : 'GET',
															dataType : 'json',
															url : 'changeMemberAbout.do?memberName=${member.memberName}&memberAbout='
																	+ $(
																			"#aboutContent")
																			.val(),
															success : after_about_change,
															error : function(
																	request,
																	status,
																	error) {
																alert("code:"
																		+ request.status
																		+ "\n"
																		+ "message:"
																		+ request.responseText
																		+ "\n"
																		+ "error:"
																		+ error);
															}
														});
											});

						}
						;

						// 소개글 저장 후 textarea 복구, 버튼 복구
						function after_about_change(res) {

							$("#submitAbout").remove();
							$("#changeAbout").show();
							$(".memberAbout").html(
									'<textarea readonly id="aboutContent" rows="8" cols="65" maxlength="80">'
											+ res.memberAbout + '</textarea>');
						}
						;

						// 프로필 사진이나 사진수정버튼 누르면 '사진 고르기' 버튼 클릭
						$("#profileImgChange").click(function() {
							$("#filepath").click();
						});
						$("#memberImg").click(function() {
							$("#filepath").click();
						});

						// 새로운 프로필 사진 선택 후
						$('#filepath')
								.on(
										'change',
										function() {
											var str = $('#filepath').val();

											// 이미지 첨부파일인지 체크
											var patt = /(.jpeg$|.jpg$|.gif$|.png$)/gi;
											var result = str.match(patt);

											if ($("#filepath").val() === "") {
												alert("프로필 사진 변경을 취소하였습니다.")
												$('#memberImg')
														.attr("src",
																"image/${member.profileImg }");
												$(".imgChangeBox")
														.html(
																'<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
												return false;
											}

											if (!result) {
												alert('jpeg, jpg, gif, png만 가능합니다.');
												$('#filepath').val("");
												$('#memberImg')
														.attr("src",
																"image/${member.profileImg }");
												$(".imgChangeBox")
														.html(
																'<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
												return false;
											}

											// 파일첨부 사이즈 체크
											if (this.files[0].size > 100000000) {
												alert('100MB 이하만 가능합니다.');
												$('#filepath').val("");
												$('#memberImg')
														.attr("src",
																"image/${member.profileImg }");
												$(".imgChangeBox")
														.html(
																'<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
												return false;
											}

											// 파일을 읽기 위한 FileReader객체 생성
											var reader = new FileReader();

											// File내용을 읽어 dataURL형식의 문자열 저장
											reader.readAsDataURL(this.files[0]); // 배열 형식이기에 꼭 [i] 배열의 순서를 알려줘야한다.

											// 파일 일거들이기를 성공했을 때 호출되는 이벤트 메소드
											reader.onload = function(e) {
												// img요소의 src속성에 읽어들인 File내용을 지정해준다.
												$('#memberImg').attr('src',
														e.target.result);
											};

											// 프로필사진수정 버튼을 확인 버튼으로 교체
											if (!($("#submitProfileImg").length)) {
												$("#profileImgChange").hide();
												$(".imgChangeBox")
														.append(
																'<button type="button" id="submitProfileImg" style="margin: 5px; cursor:pointer;">확인</button>')
											}

											$("#submitProfileImg")
													.click(
															function() {
																// 첨부파일을 Form안에 담아내기 위해서 작성한다.
																var form_data = new FormData();
																form_data
																		.append(
																				'memberName',
																				'${member.memberName}');
																form_data
																		.append(
																				'profileFile',
																				$("#filepath")[0].files[0]);

																// 변경된 프로필 사진 저장
																$
																		.ajax({
																			type : 'POST',
																			dataType : 'json',
																			// 첨부파일을 ajax로 보내기 위하여 아래 3개의 문을 사용한다. 
																			contentType : false,
																			enctype : 'filename/form-data',
																			processData : false,
																			url : 'profileImgChange.do',
																			// data는 첨부파일을 포함한 form_data를 사용할 수 있다
																			data : form_data,
																			success : profile_img_change,
																			error : function(
																					request,
																					status,
																					error) {
																				alert("code:"
																						+ request.status
																						+ "\n"
																						+ "message:"
																						+ request.responseText
																						+ "\n"
																						+ "error:"
																						+ error);
																			}
																		});
															});
										}); // end change()

						// 변경된 프로필 사진으로 보이게끔 한다
						function profile_img_change(res) {
							$("#memberImg").attr('src',
									"image/" + res.profileImg);
							$("#submitProfileImg").remove();
							$("#profileImgChange").show();
						}
						;

					}); // end ready()
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<!-- header 끝 -->

	<div class="wrap">
		<div class="profileArea">
			<div class="flagArea">
				<button class="memberFlag"
					style="cursor: pointer; margin-right: 15px;">신고하기</button>
				<!-- 아래 if 코드 신고하기 버튼 감싸기 !!! -->
				<!-- <c:if test="${requestScope.memberName != sessionScope.memberName}"> -->
				<!-- </c:if> -->
			</div>

			<div class="profileContainer">
				<div id="profileImageBox">
					<img id="memberImg"
						style="height: 70%; width: 70%; border-radius: 15px; margin-bottom: 5px; cursor: pointer;"
						src="image/${member.profileImg }">
					<div class="nickname">${member.nickname }</div>
					<div class="imgChangeBox">
						<button type="button" id="profileImgChange"
							style="cursor: pointer; margin: 5px 0;">프로필사진수정</button>
					</div>
					<input type="file" name="filepath" id="filepath"
						style="display: none;" />
					<div class="memberStars" style="margin-top: 10px;">
						<!-- 회원이 받은 총 별점을 계산, avg를 찾고 이쪽으로 리턴해준다. -->
					</div>
				</div>
				<div class="memberInfoContainer">
					<div class="nicknameBox">
						<div class="nickname">${member.nickname }</div>
						<button type="button" id="changeNick"
							style="cursor: pointer; margin-right: 10px;">닉네임수정</button>
						<div class="memberRank">${status.memberRank }</div>
					</div>
					<div class="memberAbout">
						<textarea readonly id="aboutContent" rows="8" cols="65"
							maxlength="80">${member.memberAbout }</textarea>
					</div>
					<div class="aboutChangeBox">
						<button type="button" id="changeAbout"
							style="margin: 10px; cursor: pointer;">소개수정</button>
					</div>
					<div class="memberPointArea">
						<div class="memberPoint"
							style="margin: 10px; white-space: nowrap; overflow: hidden;">${status.memberPoint }</div>
					</div>
				</div>
			</div>

			<div class="menuAndContentArea">
				<div class="profileMenu">
					<ul class="menuButtons">
						<li><a href="adminPage.do">현황</a>
						<li><a href="adminMember.do" id="memberrule">회원관리</a></li>
						<li><a href="adminMemberFlag.do">회원신고접수</a></li>
						<li><a href="adminItemFlag.do">게시글 신고접수</a></li>
						<li><a href="adminMessage.do">문의메세지</a></li>
					</ul>
				</div>
				<div class="profileContent">
					<div class="contentOptions">
						<select class="form-control" id="selectbox"style="width: 150px;" onchange="if(this.value) location.href=(this.value)">
							<option value="adminMemberorder.do" >이름순</option>
							<option value="adminMember.do">가입일순</option>
							<option value="adminMemberorder.do">등급순</option>
							<option value="flag">구매상품수</option>
						</select>
					</div>
					<div class="contents">
						<div id="members">
							<table class="table table-dark" style="font-size: small;">
								<tr>
									<th scope="col">아이디</th>
									<th scope="col">가입일</th>
									<th scope="col">등급</th>
									<th scope="col">판매상품수</th>
									<th scope="col">구매상품수</th>
									<th scope="col">프리미엄여부</th>
									<th scope="col">탈퇴관리</th>
								</tr>
								<c:forEach items="${memberJo}" var="dto">
									<tr>	
										<form action="adminMemberDelete.do" id="frmm" method="post" class="btn${dto.memberId}">
										<td>${dto.memberId}<input hidden="hidden" name="memberId" value="${dto.memberId}"/></td>
										<td>${dto.enrollDate}</td>
										<td>${dto.memberRank}</td>
										<td>${dto.buyCount}</td>
										<td>${dto.sellCount}</td>
										<td>${dto.memberPremium}</td>
										<td><button type="button" class="btn" id="btn${dto.memberId}">X</button></td>
										</form>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<footer> footer area </footer>
</body>
</html>