<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 채팅</title>
<link rel="stylesheet" type="text/css" href="css/ChatCss.css">
<style type="text/css">
body {
	margin: 0;
}

#aaa {
	margin: 0;
	padding: 0;
	border: 0px solid;
	width: 100vw;
	height: 100vh;
}
</style>
</head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src="js/jquery-ui.js">
</script>
<script type="text/javascript">
var  myid = '<%=(String) session.getAttribute("memberName")%>';
var login =	'<%=(String) session.getAttribute("logOk")%>';
var websocket;
	$(document)
			.ready(
					function() {
						if(login=="ok")
							{
						        websocket = new WebSocket("ws://localhost:8090/sapare/chatws.do");
						        // 웹 소켓 이벤트 처리 -> 로그인 할때 달아주기(주소 바꿔서)
						        websocket.onopen = onOpen;
						        websocket.onmessage = onMessage;
						        websocket.onclose = onClose;
							
							}
						console.log("btn.onclick")	
						var modal = document.getElementById('chatModal');
						var btn = document.getElementById("mychatBtn");
						btn.onclick = function() {
							  btn.classList.toggle('active')
							if (btn.className == 'active') {
								modal.style.display = "block";
								 $.ajax({
						                type: 'GET',
						                dataType: 'json',
						                async: false,
						                url: 'start.do?memberName='+'<%=(String) session.getAttribute("memberName")%>' ,
						                success: function (chatviewDTO) {
												$(chatviewDTO).each(function(value){
													var a	= '<div class="friend"><input type="hidden" id="itemId" value="'+$(this)[0].itemId+'"> '
													+ '<input type="hidden" id="chatRoomId" value="'+$(this)[0].chatRoomId+'">'
													+ '<input type="hidden" class="memberName" value="'+$(this)[0].memberName+'">  '
													+ '<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" />'
													+ '<p><strong>"'+$(this)[0].memberName+'"</strong> <span>상품</span></p>'
													if($(this)[0].isreadcount>0)
													+ '<div class="readcount"><span>'+$(this)[0].isreadcount+'</span></div></div>'
												$('#friends').prepend(a);
												})
						                }
								 })
								 addfriend()
								closeanim();
							} else {
								colse(modal);
							}
							
							
						}
						$('#cclose').click(function(){
							btn.classList.toggle('active')
						colse(modal);
							
						})
						$("#chatModal").draggable({
							containment : 'parent',
							handle : '#topmenu',
							scroll : false
						})



});
$(document).keydown(function (e) {
  
	if (e.keyCode === 27) {
		var modal = document.getElementById('chatModal');
		var btn = document.getElementById("mychatBtn");
		if (btn.className == 'active'){
		btn.classList.toggle('active')
    	colse(modal);}
    }
	
	})
   function colse(e){
		e.style.display = "none";
		$('#friends').children(".friend").remove();
		if (chatRoom != null) {
			chatmessgcolse();
		}
   
   }
</script>
<script type="text/javascript" src="js/ChatJS.js"></script>
<body>
	<div id="aaa">
		<div id="mychatBtn">
			<div class="background"></div>
			<svg class="chat-bubble" width="100" height="100"
				viewBox="0 0 100 100">
        <g class="bubble">
          <path class="line line1"
					d="M 30.7873,85.113394 30.7873,46.556405 C 30.7873,41.101961
          36.826342,35.342 40.898074,35.342 H 59.113981 C 63.73287,35.342
          69.29995,40.103201 69.29995,46.784744" />
          <path class="line line2"
					d="M 13.461999,65.039335 H 58.028684 C
            63.483128,65.039335
            69.243089,59.000293 69.243089,54.928561 V 45.605853 C
            69.243089,40.986964 65.02087,35.419884 58.339327,35.419884" />
        </g>
        <circle class="circle circle1" r="1.9" cy="50.7" cx="42.5" />
        <circle class="circle circle2" cx="49.9" cy="50.7" r="1.9" />
        <circle class="circle circle3" r="1.9" cy="50.7" cx="57.3" />
      </svg>
		</div>



<!-- 		<div id="myModal" class="modal"> -->
		<div id="chatModal" class="chatmodal">
			<!-- Modal content -->
			<div class="chatmodal-content">
				<link
					href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700"
					rel="stylesheet" type="text/css" />

				<div id="chatbox">
					<div id="friendslist">
						<div id="topmenu">
							<div id="cclose">
								<div class="cyy"></div>
								<div class="cxx"></div>
							</div>
						</div>
						<!-- 여기서 데이터 추가 for each문 -->

						<div id="friends">
							<div id="chatsearch">
								<input type="text" id="searchfield" value="Search contacts..." />
							</div>
						</div>
					</div>

					<div id="chatview" class="p1">
						<div id="profile">
							<div id="close">
								<div class="cy"></div>
								<div class="cx"></div>
							</div>
							<p>"${dto.memberName}"</p>
							<span>상품</span>
							<!-- 대화창 프로필 -->
						</div>
						<div id="chat-messages">
							<div class="message"></div>
							<div id="sendmessage">
								<input type="text" value="Send message..." />
								<button id="send"></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>