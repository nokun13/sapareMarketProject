<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	text-decoration: none;
	margin: 0;
  	padding: 0;
}

.side-logo-container {
	display: flex;
}

.text {
	display: flex;
}

.profileArea{
	margin: auto;
	width: 950px;
	margin-top: 25px;
    border-radius: 10px;
    border: 1px solid #f0f5fa;
	background: #f5faff;
    box-shadow: 6px -6px 13px #f0f5fa, -6px 6px 13px #faffff;
}

.flagArea{
	height: 50px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
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
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	border-radius: 8px;
	background: #ebf5ff;
	box-shadow:  -6px 6px 9px #e6f0fa, 
             6px -6px 9px #f0faff;
}

.profileContainer{
	display: flex;
	width: 100%;
	border-bottom: 1px solid #48A4FF;
}

.profileContainer button{
	font-size: 15px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: black;
    border-radius: 7px;
	background: #d1eeff;
	box-shadow: 3px 3px 6px #b0c8d6, -5px -5px 12px #f2ffff;
    outline: none;
    padding: 4px 4px;
    border: none;
}

.profileContainer button:hover{
	border-radius: 7px;
	background: #d1eeff;
	box-shadow: inset 6px 6px 8px #cde9fa, 
            inset -6px -6px 8px #d5f3ff;
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
	align-items: center;
	width: 95%;
	cursor: default
}

.nicknameBox div{
	margin-right: 10px;
	width: auto;
	white-space: nowrap; 
	overflow: hidden;
	flex-direction: row;
    display: flex;
}

.memberAbout{
	display: inline-flex;
    align-items: flex-start;
    width: 80%;
    height: 165px;
}

.memberAbout textarea{
	resize: none;
    font-size: 15px;
    outline: none;
    cursor: default;
    font-family: Montserrat;
    border: 1px solid lightgray;
    border-radius: 5px;
    background: #f0f8ff;
    box-shadow: -6px 6px 14px #ebf3fa, 6px -6px 14px #f5fdff;
}

.memberPointArea{
	height: 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 20%;
}

.menuAndContentArea{
	display: flex;
    width: 100%;
    flex-direction: row;
    height: auto;
}

.profileMenu{
	display: flex;
	justify-content: center;
	width: 25%;
	border-right: 1px solid #48A4FF;
}

.profileContent{
	display: flex;
	width: 80%;
	height: 100%;
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
    margin-right: 10px;
}

.menuButtons li {
	margin-top: 10px;
	width: 85%;
	border-top: #8AB8F4 solid 1px;
	border-bottom: #8AB8F4 solid 1px;
	border-right: #8AB8F4 solid 1px;
	text-align: center;
	border-radius: 0px 5px 5px 0px;
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
	border-radius: 0px 5px 5px 0px;
}

.menuButtons li a:hover:not(.active) {
    background-color: #77A6FF;
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
	margin-bottom: 15px;
}

.contentOptions{
	display: flex;
	width: 100%;
	height: 5%;
	align-items: center;
	justify-content: flex-end;
	padding-top: 5px;
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
    background: #f0f8ff;
    box-shadow: 6px 6px 4px #eaf2f6, -6px -6px 4px #f4fcff;
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

.reviewStar label:before{
	content:'\f005';
	font-family: fontAwesome;
	position: relative;
	font-size: 50px;
	color: rgb(255,225,100);
	display: flex;
	cursor: default;
	width: 55px;
	text-shadow: 0 2px 5px rgba(0,0,0,.5);
}

.reviewStar input{
	display: none;
}

.reviewSelect{
	display: none;
	position: absolute;
	background-color: #73BEFF;
	min-width: 160px;
	z-index: 1;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.reviewSelect a{
	float: none;
	color: black;
	text-decoration: none;
  	display: block;
  	text-align: left;
}

.reviewSelect a:hover {
  background-color: #ddd;
  color: black;
}

#reviewOptionsBtn{
	font-size: 15px;
    border: 1px solid rgb(41, 171, 226);
    outline: none;
    color: rgb(41, 171, 226);
    padding: 6px 6px;
    background-color: inherit;
    font-family: inherit;
    margin: 5px;
}

.reviewOptions:hover .reviewSelect {
  display: block;
}

</style>
<meta charset="UTF-8">
<title>${sessionScope.account_Name }의 프로필 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		// 받은 후기/작성한 후기 드롭다운
		$("#reviewOptions").change(function(){
			
			var option = $(this).children("option:selected").val();
			
			if(option == 'reviewGet'){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'gotReviewProcess.do',
					success: review_result,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			} else if(option == 'reviewSend'){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'sentReviewProcess.do',
					success: review_result,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		});
		
		// 닉네임 변경 버튼 클릭 후 현재 닉네임 가져오기
		$("#changeNick").click(function(){
			
			$.ajax({
				type:'GET',
				dataType:'json',
				url:'memberInfoGet.do?memberName=${member.memberName}',
				success: change_nickname,
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
		});
		
		// 닉네임 중복 체크
		function change_nickname(res){
			
			$("#changeNick").prev().html('<input type="text" id="newNickname" maxlength="15" value="'+res.nickname+'" style="font-size:16px;outline:none;"> <button type="button" id="submitNick" style="cursor:pointer;">확인</button>');
			$("#changeNick").hide();
			
			// 닉네임 변경 엔터 버튼 클릭 기능
			var input = document.getElementById("newNickname");
			
			input.addEventListener("keyup", function(event){
			  if (event.keyCode === 13) {
			    event.preventDefault();
			    document.getElementById("submitNick").click();
			  }
			});
			
			$('#submitNick').click(function(){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'checkNickname.do?nickname=' + $("#newNickname").val(),
					success: get_new_nickname,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
		};
		
		// 닉네임 변경
		function get_new_nickname(res){
			if(res == 1){
				alert("이미 존재하는 닉네임입니다.");
			} else{
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'changeNickname.do?memberName=${member.memberName}&nickname=' + $("#newNickname").val(),
					success: change_to_new_nickname,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		};
		
		// 닉네임 변경 후 변경 된 닉네임으로 바꿔주고 수정버튼 재생성
		function change_to_new_nickname(res){
			$('.nickname').html(res.nickname);
			$('#changeNick').show();
		};
		
		
		// 소개글 변경 버튼 클릭 후 소개글 가져오기
		$("#changeAbout").click(function(){
			
			$.ajax({
				type:'GET',
				dataType:'json',
				url:'memberInfoGet.do?memberName=${member.memberName}',
				success: change_about_content,
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
		});
		
		// textarea 변경가능으로 바꾸고 소개글 뿌려주기, 확인 버튼 누르면 저장
		function change_about_content(res){
			
			$(".memberAbout").html('<textarea id="aboutContent" rows="8" cols="65" maxlength="80" style="background-color:white;border:1px solid black;cursor:auto;">'+res.memberAbout+'</textarea>')
			$(".aboutChangeBox").append('<button type="button" id="submitAbout" style="margin: 10px; cursor:pointer;">확인</button>');
			
			$("#changeAbout").hide();
			
			$("#submitAbout").click(function(){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'changeMemberAbout.do?memberName=${member.memberName}&memberAbout='+$("#aboutContent").val(),
					success: after_about_change,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
			
		};
		
		// 소개글 저장 후 textarea 복구, 버튼 복구
		function after_about_change(res){
			
			$("#submitAbout").remove();
			$("#changeAbout").show();
			$(".memberAbout").html('<textarea readonly id="aboutContent" rows="8" cols="65" maxlength="80">'+res.memberAbout+'</textarea>');
		};
		
		// 프로필 사진이나 사진수정버튼 누르면 '사진 고르기' 버튼 클릭
		$("#profileImgChange").click(function() {
		    $("#filepath").click();
		});
		$("#memberImg").click(function() {
		    $("#filepath").click();
		});
		
		// 새로운 프로필 사진 선택 후
		$('#filepath').on('change', function(){
			var str = $('#filepath').val();
		
			// 이미지 첨부파일인지 체크
			var patt = /(.jpeg$|.jpg$|.gif$|.png$)/gi;
			var result = str.match(patt);
			
			if($("#filepath").val() === ""){
				alert("프로필 사진 변경을 취소하였습니다.")
				$('#memberImg').attr("src", "image/${member.profileImg }");
				$(".imgChangeBox").html('<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
				return false;
			}
			
			if(!result){
				alert('jpeg, jpg, gif, png만 가능합니다.');
				$('#filepath').val("");
				$('#memberImg').attr("src", "image/${member.profileImg }");
				$(".imgChangeBox").html('<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
				return false;
			}
			
			// 파일첨부 사이즈 체크
			if(this.files[0].size > 100000000){
				alert('100MB 이하만 가능합니다.');
				$('#filepath').val("");
				$('#memberImg').attr("src", "image/${member.profileImg }");
				$(".imgChangeBox").html('<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
				return false;
			}
			
			// 파일을 읽기 위한 FileReader객체 생성
			var reader = new FileReader();
			
			// File내용을 읽어 dataURL형식의 문자열 저장
			reader.readAsDataURL(this.files[0]); // 배열 형식이기에 꼭 [i] 배열의 순서를 알려줘야한다.
			
			// 파일 일거들이기를 성공했을 때 호출되는 이벤트 메소드
			reader.onload = function(e){
				// img요소의 src속성에 읽어들인 File내용을 지정해준다.
				$('#memberImg').attr('src', e.target.result);
			};
			
			// 프로필사진수정 버튼을 확인 버튼으로 교체
			if(!($("#submitProfileImg").length)){
				$("#profileImgChange").hide();
				$(".imgChangeBox").append('<button type="button" id="submitProfileImg" style="margin: 5px; cursor:pointer;">확인</button>')
			}
		
			$("#submitProfileImg").click(function(){
				// 첨부파일을 Form안에 담아내기 위해서 작성한다.
				var form_data = new FormData();
				form_data.append('memberName', '${member.memberName}');
				form_data.append('profileFile', $("#filepath")[0].files[0]);
				
				// 변경된 프로필 사진 저장
				$.ajax({
					type:'POST',
					dataType:'json',
					// 첨부파일을 ajax로 보내기 위하여 아래 3개의 문을 사용한다. 
					contentType:false,
					enctype:'filename/form-data',
					processData:false,
					url:'profileImgChange.do',
					// data는 첨부파일을 포함한 form_data를 사용할 수 있다
					data:form_data,
					success:profile_img_change,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});	
		}); // end change()
		
		// 변경된 프로필 사진으로 보이게끔 한다
		function profile_img_change(res){
			$("#memberImg").attr('src', "image/"+res.profileImg);
			$("#submitProfileImg").remove();
			$("#profileImgChange").show();
		};
		
		// 받은 후기/작성한 후기 바꾸기
		$("#reviewOptions").on('change', function(){
			var option = $("#reviewOptions option:selected").val();
			if(option == "reviewGet"){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'gotReviewProcess.do?memberName=${member.memberName}',
					success: after_review_change,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			} else if(option == "reviewSend"){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'sentReviewProcess.do?memberName=${member.memberName}',
					success: after_review_change,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		});
		
		// 후기 별점 클릭 불가
		$(".review_radio").attr("disabled", true);
		
	}); // end ready()
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<!-- header 끝 -->
	
	<div class="wrap-profile">
		<div class="profileArea">
			<div class="flagArea">
			<!-- 아래 if 코드 신고하기 버튼 감싸기 !!! -->
			<c:if test="${member.memberName != sessionScope.memberName}">
				<button class="memberFlag" style="cursor:pointer; margin-right:15px;">신고하기</button>
			</c:if>
			</div>
			
			<div class="profileContainer">
				<div id="profileImageBox">
					<img id="memberImg" style="height: 70%; width: 70%; border-radius: 15px;margin-bottom: 5px;cursor:pointer;object-fit:cover;" src="image/${member.profileImg }">
					<div class="nickname">
						${member.nickname }
					</div>
					<div class="imgChangeBox">
						<c:if test="${member.memberName == sessionScope.memberName}">
							<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>
						</c:if>
					</div>
					<input type="file" name="filepath" id="filepath" style="display:none;"/>
					<div class="memberStars" style="margin-top: 10px;">
					<!-- 회원이 받은 총 별점을 계산, avg를 찾고 이쪽으로 리턴해준다. -->
					</div>
				</div>
				<div class="memberInfoContainer">
					<div class="nicknameBox">
						<div class="nickname">
							${member.nickname }
						</div>
							<c:if test="${member.memberName == sessionScope.memberName}">
								<button type="button" id="changeNick" style="cursor:pointer;margin-right:10px;">닉네임수정</button>
						 	</c:if>
						<div class="memberRank">${status.memberRank }</div>
						<%-- <div class="premiumIcon">
							<c:if test="${fn:contains(status.memberPremium, 'n')}">
								프리미엄 아님/나중에 변경
							</c:if>
						</div> --%>
					</div>
					<div class="memberAbout">
						<textarea readonly id="aboutContent" rows="8" cols="65" maxlength="80">${member.memberAbout }</textarea>
					</div>
					<div class="aboutChangeBox">
						 <c:if test="${member.memberName == sessionScope.memberName}">
							<button type="button" id="changeAbout" style="margin: 10px; cursor:pointer;">소개수정</button>
						 </c:if>
					</div>
					<div class="memberPointArea">
						<!-- 	<div class="memberPoint" style="margin: 10px; white-space: nowrap; overflow: hidden;">${status.memberPoint }</div>
							<button class="pointCharge" style="cursor:pointer;">포인트 충전</button> -->
						<!-- <c:if test="${member.memberName == sessionScope.memberName}">
						</c:if> -->
					</div>
				</div>
			</div>
			
				<div class="menuAndContentArea">
					<div class="profileMenu">
						<ul class="menuButtons">
						  <li><a href="profileSell.do">판매상품</a>
						  
						  <c:if test="${member.memberName == sessionScope.memberName}">
						  	<li><a href="profileBuy.do">구매상품</a></li>
						  </c:if>
						  
						  <c:if test="${member.memberName == sessionScope.memberName}">
						  	<li><a href="profileWant.do">찜</a></li>
						  </c:if>
						  
						  <li><a href="profileReview.do">후기</a></li>
						  
						  <c:if test="${member.memberName == sessionScope.memberName}">
						  	<li><a href="profileSetting.do">회원정보수정</a></li>
						  </c:if>
						</ul>
					</div>
					<div class="profileContent">
						<div class="contentOptions">
							<div class="reviewOptions">
								<button id="reviewOptionsBtn">선택</button>
								<div class="reviewSelect">
							      <a href="profileReview.do">받은 후기</a>
							      <a href="sentReviewProcess.do">작성한 후기</a>
							    </div> 
						    </div>
						</div>
						<div class="contents">
							<c:forEach items="${reviewBoxList}" var="dto">
								<div class="reviewBox">
									<div class="reviewerImgBox">
										<a href="#"><img class="reviewerImg" src="image/${dto.profileImg }" style="border-radius:5px;object-fit:cover;"></a>
									</div>
									<div class="reviewInfoBox">
										<div class="reviewerName" style="margin-top:10px; font-weight:bold; overflow: hidden; margin-left: 5px; height: 19%; text-overflow: ellipsis; white-space: nowrap;">${dto.nickname }</div>
										<div class="reviewContent" style="margin-top:7px; overflow: hidden; height: 50%; margin-left: 5px; font-size: 14px; text-overflow: ellipsis; white-space: nowrap;">${dto.reviewContent }</div>
										<div class="reviewStar" style="margin-top: 5px;margin-left: 5px;margin-bottom: 5px;height: 30%;font-size: 14px;display: flex;">
											<c:choose>
												<c:when test="${dto.reviewStar == 5}">
													<input type="radio" name="reviewStar" id="star1${dto.orderId }">
									            	<label for="star1${dto.orderId }"></label>
									            	<input type="radio" name="reviewStar" id="star2${dto.orderId }">
									            	<label for="star2${dto.orderId }"></label>
									            	<input type="radio" name="reviewStar" id="star3${dto.orderId }">
									            	<label for="star3${dto.orderId }"></label>
									            	<input type="radio" name="reviewStar" id="star4${dto.orderId }">
									            	<label for="star4${dto.orderId }"></label>
									            	<input type="radio" name="reviewStar" id="star5${dto.orderId }">
									            	<label for="star5${dto.orderId }"></label>
									            </c:when>
									            <c:when test="${dto.reviewStar == 4}">
													<input type="radio" name="reviewStar" id="star1${dto.orderId }">
									            	<label for="star1${dto.orderId }"></label>
									            	<input type="radio" name="reviewStar" id="star2${dto.orderId }">
									            	<label for="star2${dto.orderId }"></label>
									            	<input type="radio" name="reviewStar" id="star3${dto.orderId }">
									            	<label for="star3${dto.orderId }"></label>
									            	<input type="radio" name="reviewStar" id="star4${dto.orderId }">
									            	<label for="star4${dto.orderId }"></label>
									            </c:when>
									            <c:when test="${dto.reviewStar == 3}">
													<input type="radio" name="reviewStar" id="star1${dto.orderId }">
									            	<label for="star1${dto.orderId }"></label>
									            	<input type="radio" name="reviewStar" id="star2${dto.orderId }">
									            	<label for="star2${dto.orderId }"></label>
									            	<input type="radio" name="reviewStar" id="star3${dto.orderId }">
									            	<label for="star3${dto.orderId }"></label>
									            </c:when>
									            <c:when test="${dto.reviewStar == 2}">
													<input type="radio" name="reviewStar" id="star1${dto.orderId }">
									            	<label for="star1${dto.orderId }"></label>
									            	<input type="radio" name="reviewStar" id="star2${dto.orderId }">
									            	<label for="star2${dto.orderId }"></label>
									            </c:when>
									            <c:when test="${dto.reviewStar == 1}">
													<input type="radio" name="reviewStar" id="star1${dto.orderId }">
									            	<label for="star1${dto.orderId }"></label>
									            </c:when>
											</c:choose>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
			</div>
		</div>
</body>
<jsp:include page="footer.jsp" />
</html>