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

.contents input{
	border: 1px solid #e8ebed;
	font-size: 16px;
}

button{
	cursor:pointer;
}

input, button{
	outline: none;
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
	/* margin-left: 30px;
	margin-top: 20px; */
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
    margin-left: 15px;
    margin-bottom: 20px;
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
    padding: 10px;
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
.menuButtons li:nth-child(5) {
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
.menuButtons li:nth-child(5) a {
	background-color: #8AB8F4;
    color: white;
}

.profileContent{
	display: flex;
	width: 80%;
	height: 100%;
	margin-left: 15px;
	margin-top: 30px;
	margin-right: 10px;
	flex-direction: column;
}

.contents{
	display: flex;
	flex-direction: column;
	width: 100%;
	height: 100%;
	margin-top: 35px;
	margin-left: 15px;
	margin-bottom: 15px;
}

.contents ul{
	list-style: none;
	margin: 0;
}

.contents ul li{
	margin-bottom: 15px;
	display: flex;
	height: 40px;
	flex-wrap: wrap;
}

.contents ul li>div{
	float: left;
}

.contents ul li>div:first-child{
	width: 25%;
	line-height: 35px;
	font-size: 16px;
}

.contents ul li>div:nth-child(2){
	width: 50%;
}

.contents ul li>div:nth-child(2) div{
	line-height: 35px;
	font-size: 16px;
}

.contents ul li>div:nth-child(2) input{
	width: 97%;
	border-radius: 3px;
	height: 38px;
	font-size: 16px;
}

.contents ul li>div:nth-child(3){
	width: 15%;
}

.contents ul li>div:nth-child(3) button{
	border: 1px solid #8AB8F4;
    border-radius: 3px;
    text-align: center;
    color: #8AB8F4;
    padding: 7px 0;
    width: 100%;
    font-size: 15px;
}

.contents ul li button{
	box-shadow: 0px 3px 1px -2px rgba(0,0,0,0.2),
	0px 2px 2px 0px rgba(0,0,0,0.14),
	0px 1px 5px 0px rgba(0,0,0,.12);
	transition: box-shadow 280ms cubic-bezier(0.4,0,0.2,1);
}

.contents ul li button:hover{
	box-shadow: 0px 2px 4px -1px rgba(0,0,0,0.2),
	0px 4px 5px 0px rgba(0,0,0,0.14),
	0px 1px 10px 0px rgba(0,0,0,.12);
	background-color: #E6F6FB;
}

.contents ul li input:focus{
	border: 1px solid rgba(81, 203, 238, 1);
}

.memberIdCheck{
	margin-top: 10px;
}

.memberIdInput{
	height: 38px;
    width: 97%;
    border-radius: 3px;
    margin-top:10px;
}

.contents ul li:nth-child(2){
	margin-bottom: 30px;
}

.contents ul li:nth-child(4){
}

.contents ul li:nth-child(5){
	height: 65px;
	flex-wrap: unset;
}

.contents ul li:nth-child(7){
}

.phoneNumCheck{
	margin-top: 10px;
}

.phoneNumInput{
	height: 38px;
    width: 97%;
    border-radius: 3px;
    margin-top:10px;
    
}

.deleteBtnBox{
	margin-top: 30%;
	margin-left: 82%;
}

.deleteBtnBox button{
	outline: none;
	color: gray;
	border: none;
	padding: 10px;
	text-align: center;
	background-color: lightgray;
}

</style>
<meta charset="UTF-8">
<title>${sessionScope.account_Name }의 프로필 페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		// 전화번호 숫자만 입력 가능
		$(".phoneNumInput").keyup(function() {
		    this.value = this.value.replace(/[^0-9\.]/g,'');
		});
		
		// 변경 버튼 누를 시 입력창 나오며 '변경'이 '취소'로 바뀌고 입력창이 뜬다.
		$(".changeIdBtn").click(function(){
			var x = document.getElementsByClassName("box2");
			if (x[0].style.display === "none") {
				$(this).html("취소");
				x[0].style.display = "flex";
			} else {
				$(this).html("변경");
				x[0].style.display = "none";
				$(".memberIdInput").val("");
			}
		});
		
		// 변경 버튼 누를 시 입력창 나오며 '변경'이 '취소'로 바뀌고 입력창이 뜬다.
		$(".changePwBtn").click(function(){
			var x = document.getElementsByClassName("box4");
			var y = document.getElementsByClassName("box5");
			if (x[0].style.display == "none" && y[0].style.display == "none") {
				$(this).html("취소");
				x[0].style.display = "flex";
				y[0].style.display = "flex";
			} else {
				$(this).html("변경");
				x[0].style.display = "none";
				y[0].style.display = "none";
				// $("#alert-success").hide(); 
				// $("#alert-danger").hide(); 
				$(".memberPwNow").val("");
				$(".memberPwNew").val("");
			}
		});
		
		// 변경 버튼 누를 시 입력창 나오며 '변경'이 '취소'로 바뀌고 입력창이 뜬다.
		$(".changePhoneNumBtn").click(function(){
			var x = document.getElementsByClassName("box7");
			if (x[0].style.display == "none") {
				$(this).html("취소");
				x[0].style.display = "flex";
			} else {
				$(this).html("변경");
				x[0].style.display = "none";
				$(".phoneNumInput").val("");
			}
		});
		
		// 비밀번호, 새 비밀번호 값 비교하기 (이걸 왜 한거였더라...?)
		/* $("#alert-success").hide(); 
		$("#alert-danger").hide(); 
		$(".memberPwNew, .memberPwNow").keyup(function(){ 
			var pwd1=$(".memberPwNow").val(); 
			var pwd2=$(".memberPwNew").val(); 
			if(pwd1 != "" && pwd2 != ""){ 
				if(pwd1 == pwd2){ 
					$("#alert-success").show(); 
					$("#alert-danger").hide(); 
					// 아래 submit 버튼이랑 연결 해주어야 한다!!!
					$("#submit").removeAttr("disabled"); 
				}else{ 
					$("#alert-success").hide(); 
					$("#alert-danger").show(); 
					// 아래 submit 버튼이랑 연결 해주어야 한다!!!
					$("#submit").attr("disabled", "disabled"); 
				} 
			} 
		}); */
		
		// 비밀번호 변경 input 엔터 기능
		var pw_input1 = document.getElementsByClassName("memberPwNow")[0];
		var pw_input2 = document.getElementsByClassName("memberPwNew")[0];
		
		pw_input1.addEventListener("keyup", function(event){
		  if (event.keyCode === 13) {
		    event.preventDefault();
		    document.getElementById("changePwBtn").click();
		  }
		});
		
		pw_input2.addEventListener("keyup", function(event){
		  if (event.keyCode === 13) {
		    event.preventDefault();
		    document.getElementById("changePwBtn").click();
		  }
		});
		
		// 현재/신규 비밀번호 일치, 확인 버튼 누를 시 현재 비밀번호 가지고 온다
		$("#changePwBtn").click(function(){
			$.ajax({
				type:'GET',
				dataType:'json',
				url:'memberInfoGet.do?memberName=${member.memberName}',
				success: change_password,
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		function change_password(res){
			
			var pwd1=$(".memberPwNow").val(); 
			var pwd2=$(".memberPwNew").val(); 
			var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{6,15}$/;
			
			if(pwd1 === pwd2){
				alert("새 비밀번호를 입력해 주세요.");
			} else if(reg.test(pwd2) === false){
				alert("비밀번호는 최소 6-15자이며 문자와 숫자가 포함되어야 합니다.");
				$(".memberPwNew").val("");
			} else if(pwd1 === res.memberPw){
				$.ajax({
					type:'GET',
					url:'memberPwChange.do?memberName=${member.memberName}&memberPw='+$(".memberPwNew").val(),
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				alert("비밀번호가 성공적으로 변경되었습니다.");
				$(".memberPwNow").val("");
				$(".memberPwNew").val("");
				$(".changePwBtn").click();
			} else{
				alert("현재 비밀번호가 틀렸습니다.");
				$(".memberPwNow").val("");
			}
		};
			
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
		
		// 전화번호 엔터 기능
		$(".phoneNumInput")[0].addEventListener("keyup", function(event){
			  if (event.keyCode === 13) {
			    event.preventDefault();
				$(".phoneNumCheck").click();
			  }
		});
		// 전화번호 중복 체크
		$(".phoneNumCheck").click(function(){
			var phone = $("#phoneNum").val();
			if($(".phoneNumInput").val().length != 11){
				alert("전화번호는 11자리수로 입력해주세요!");
				$(".phoneNumInput").val("");
				return false;
			}else{
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'checkPhoneNum.do?phoneNum='+$(".phoneNumInput").val().slice(1,11),
					success: after_check_phone,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		});
		function after_check_phone(res){
			if(res == 1){
				alert("이미 사용되고 있는 전화번호입니다.");
				$(".phoneNumInput").val("");
				return false;
			} else{
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'changePhoneNum.do?memberName=${member.memberName}&phoneNum=' + $(".phoneNumInput").val().slice(1,11),
					success: change_to_new_phone,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		};	
		function change_to_new_phone(res){
			$('.phoneNumDiv').html("0"+res.phoneNum);
			alert("전화번호를 변경하였습니다.");
			$(".changePhoneNumBtn").click();
		}
		
		// 탈퇴버튼 기능
		$("#cancelMemberBtn").on('click', function(){
			var pw = $("#cancelMemberPw").val();
			if(pw == ""){
				alert("비밀번호를 입력해야만 탈퇴할 수 있습니다.");
			} else{
				$.ajax({
					type:'GET',
					dataType:'text',
					url:'cancelMember.do?memberName=${member.memberName}&memberPw=' + pw,
					success: function(msg){
						if(msg == "fail"){
							alert("비밀번호가 틀렸습니다.");
							$("#cancelMemberPw").val("");
						} else if(msg == "success"){
							window.location.href = "http://localhost:8090/sapare/mainPage.do";
						} else{
							alert("에러: 회원탈퇴에 실패하였습니다.");
						}
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		});
		
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
						  <li><a href="profileSell.do?memberName=${member.memberName }">판매상품</a>
						  
						  <c:if test="${member.memberName == sessionScope.memberName}">
						  	<li><a href="profileBuy.do?memberName=${member.memberName }">구매상품</a></li>
						  </c:if>
						  
						  <c:if test="${member.memberName == sessionScope.memberName}">
						  	<li><a href="profileWant.do?memberName=${member.memberName }">찜</a></li>
						  </c:if>
						  
						  <li><a href="profileReview.do?memberName=${member.memberName }">후기</a></li>
						  
						  <c:if test="${member.memberName == sessionScope.memberName}">
						  	<li><a href="profileSetting.do?memberName=${member.memberName }">회원정보수정</a></li>
						  </c:if>
						</ul>
					</div>
					<div class="profileContent">
						<div class="contents">
							<!-- memberDTO에 회원 정보 담고 이 jsp로 List 타입으로 dto 명으로 보내줘야 된다 -->
							<ul>
								<li class="box1">
									<div>아이디/이메일</div>
									<div>
										<div class="memberId">${member.memberId }</div>
									</div>
									<!-- <div>
										<button type="button" class="changeIdBtn">변경</button>
									</div> -->
								</li>
								
								<li class="box2" style="display:none;">
									<div>&nbsp;</div>
									<div>
										<input type="email" placeholder="이메일 주소 입력" class="memberIdInput" maxlength="30" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" />
									</div>
									<div>
										<button type="button" class="memberIdCheck">인증요청</button>
									</div>
								</li>
								
								<li class="box3">
									<div>비밀번호</div>
									<div>
										<div class="memberPw">****************</div>
									</div>
									<div>
										<button type="button" class="changePwBtn">변경</button>
									</div>
								</li>
								
								<li class="box4" style="display:none;">
									<div>현재 비밀번호</div>
									<div>
										<input type="password" placeholder="현재 비밀번호를 입력해주세요" class="memberPwNow" maxlength="30" pattern="(?=.*\d)(?=.*[a-zA-Z]).{6,15}" title="비밀번호는 최소 6자에서 15자이며 숫자, 문자를 1개씩 포함해야 합니다."/>
									</div>
								</li>
								
								<li class="box5" style="display:none;">
									<div>신규 비밀번호</div>
									<div>
										<input type="password" placeholder="신규 비밀번호를 입력해주세요" class="memberPwNew" maxlength="30" pattern="(?=.*\d)(?=.*[a-zA-Z]).{6,15}" title="비밀번호는 최소 6자에서 15자이며 숫자, 문자를 1개씩 포함해야 합니다."/>
										<!-- <div class="alert alert-success" id="alert-success" style="color: red; font-size: 13px;">비밀번호가 일치합니다.</div>  -->
										<!-- <div class="alert alert-danger" id="alert-danger" style="color: red; font-size: 13px;">비밀번호가 일치하지 않습니다.</div>  -->
										<div style="font-size: 13px; width: max-content">최소 6~15자 이하 숫자와 문자 포함</div>
									</div>
									<div>
										<button type="button" id="changePwBtn">확인</button>
									</div>
								</li>
								
								<li class="box6">
									<div>휴대폰</div>
									<div>
										<div class="phoneNumDiv">0${member.phoneNum }</div>
									</div>
									<div>
										<input id="phoneNum" hidden="hidden" value="${member.phoneNum }" />
										<button type="button" class="changePhoneNumBtn">변경</button>
									</div>
								</li>
								
								<li class="box7" style="display:none;">
									<div>&nbsp;</div>
									<div>
										<input type="text" placeholder="휴대폰 번호를 입력해주세요" class="phoneNumInput" maxlength="11" />
									</div>
									<div>
										<button type="button" class="phoneNumCheck">확인</button>
									</div>
								</li>
								
							</ul>
							<div class="deleteBtnBox">
								<button type="button" class="memberModalmodalBtn" data-toggle="modal" data-target="#cancelMemberModal" >탈퇴하기</button>
							</div>
								<!-- 탈퇴 모달 창 -->
								<div class="memberModal" style="display:none;" id="cancelMemberModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="memberModal" role="document">
								    <div class="memberModal-content" style="border: 1px solid black;background-color:white;padding:25px;position: fixed;height:20%;top: 50%;left: 50%;transform: translate(-50%, -50%);">
								      <div class="memberModal-header" style="display: flex;flex-direction: row;">
								        <h5 class="memberModal-title" id="exampleModalLongTitle" style="margin-left: 35px;width: 90%;align-self: center;font-family: 'Montserrat';font-size: 22px;text-align: center;">회원 탈퇴</h5>
								        <button type="button" style="width: 10%;color:black;" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="memberModal-body" style="flex-direction: column;align-items: center;display: flex;flex-wrap: wrap;justify-content: center;font-family:'Montserrat';font-size: 14px;height:70%;">
								       	<p> 회원 탈퇴를 하시려면 비밀번호를 입력하고 탈퇴하기 버튼을 눌러주세요.</p>
								       	<input type="password" name="memberPw" id="cancelMemberPw" style="margin-top: 15px;padding:5px;font-size:14px;" maxlength="20" placeholder="비밀번호를 입력해주세요." /> 
								      </div>
								      <div class="memberModal-footer" style="text-align: end;">
								        <button type="button" class="memberModal-cancelBtn" data-dismiss="modal" style="padding: 5px;">취소</button>
								        <button type="button" id="cancelMemberBtn" class="memberModal-acceptBtn" style="padding: 5px;border: none;background-color:white;color:red;">탈퇴하기</button>
								      </div>
								    </div>
								  </div>
								</div>
								<!-- 탈퇴 모달 창 -->
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
</body>
<jsp:include page="footer.jsp" />
</html>