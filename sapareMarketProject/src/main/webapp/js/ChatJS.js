
var chatRoom;
var messagedate =TimeStemp(new Date(Date.now()))[0];
$(document).ready(function () {
	
    $("#send").on('click', function () {
    	sendmessage($(this));
        
    });
    $("#searchfield").focus(function () {
        if ($(this).val() == "Search contacts...") {
            $(this).val("");
        }
    });
    $("#searchfield").focusout(function () {
        if ($(this).val() == "") {
            $(this).val("Search contacts...");
        }
    });
    $("#sendmessage input").focus(function () {
        if ($(this).val() == "Send message...") {
            $(this).val("");
        }
    });
    $("#sendmessage input").focusout(function () {
        if ($(this).val() == "") {
            $(this).val("Send message...");
        }
    });
    $("#sendmessage input").on('keypress',function(){
    	  if ( window.event.keyCode == 13 ) {
    		  sendmessage($(this).next())
          }
    	
    })
    
    //"propertychange change keyup paste input" <- 개발자도구로 바꿔도 먹는 명령문 
    $("#searchfield").on("change keyup paste", function() {
        var currentVal = $(this).val();
        if(currentVal==""||currentVal=="Search contacts..."){
        	$(".friend").each(function(){
        		$(this).show()
        	})
        }
        else{
        	$(".friend").each(function(){
        		var fr =$(this).children(".memberName");
        		console.log(fr.val())
        		console.log(currentVal)
        		
        		if(fr.val().indexOf(currentVal) > -1)
        		{
        			fr.parent().show()
        		}else{
        			fr.parent().hide()
        			
        		}
        	})
        	
        }
    });
    console.log("aa")
    console.log($(".friend"))
   console.log("aa")
    
   
   
});
// ready end//////////////////////////
// websocket이 연결된 경우 호출되는 함수

function chatmessgcolse(){
	chatOpen(chatRoom.children('#chatRoomId').val(),myid,"off")
    chatRoom = null;
    $("#chat-messages, #profile, #profile p").removeClass("animate");
    $(".cx, .cy").removeClass("s1 s2 s3");
    $(".floatingImg").animate({
        width: "40px",
        top: top,
        left: "12px"
    }, 200, function () {
        $(".floatingImg").remove();
    });
    setTimeout(function () {
        $("#chatview").fadeOut();
        $("#friendslist").fadeIn();
    }, 50);
	
}


function TimeStemp(date){
    var aa=new Date( Date.now());
    aa.setUTCHours(aa.getUTCHours()+9)
    aa=aa.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    date.setUTCHours(date.getUTCHours()+9);
    var bb=date.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    if(aa.substring(0,4)==bb.substring(0,4)){
        return bb.substring(5,16).split(' ');
    }else {
    return bb.substring(0,16).split(' ');
    }

}
function chatOpen(room,openUser,status,id){
var ttttt =null;
	$.ajax({
         type: 'GET',
         dataType: 'json',
         async: false,
         url: 'chatFrameOpen.do?roomNum=' + chatRoom.children('#chatRoomId').val()+'&memberid='+openUser+'&status='+status+'&fid='+id,
         success: function(Log){
        	if(Log != null)
        		if(Log.enterTime<Log.exitTime)
        		 ttttt= Log.exitTime
         },erorr: function(e){
        	 console.log(e);
         }
	 
	 })
	return ttttt;
	
}

function onOpen(evt) {
    console.log("웹 소켓에 연결 성공");
    var nick = myid; // 내 아이디 -> 나중에 수정
    websocket.send("login|" + nick)
}
// 서버에서 메세지가 왔을 때 호출되는 함수
function onMessage(evt) { // 서버가 전송한 메세지 가져오기
    var data = evt.data.split(":");
    var date = new Date(Date.now())
    date.setUTCHours(date.getUTCHours()+9)
    console.log('메세지 왔다')
    console.log(data[0])
    console.log(chatRoom.chatRoomId);
    // 이미지 주소 chat.chatImgPath
    // 아이템 아이디 chat.itemid
    if (chatRoom.children('#chatRoomId').val() == data[0]) 
    {
    	var dateTime;
    	var dateTime = TimeStemp(date);
        if(messagedate != dateTime[0]) {
        	messagedate = dateTime[0];
        	$("#chat-messages").append('<label>'+messagedate+'</label>')
        }
    	
    	
        var message = '<div class="message"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" /> <div class="bubble">' + data[1] + '<div class="corner"></div>' + '<span>' + dateTime[1] + '</span></div></div>';
        $("#chat-messages").append(message)
        var objDiv = document.getElementById("chat-messages");
        objDiv.scrollTop = objDiv.scrollHeight;
    }
    if(data[0]=="on"){
    	$(".isread").remove();
    	
    }
}
// websocket이 연결 해제된 경우 호출되는 함수
function onClose(evt) {
    websocket.send("login:" + "end")
    console.log("웹 소켓에 연결 해제");
}
function addfriend(){
	 $(".friend").each(function () { // 클릭시 대화창 생성 애니메이션
	        $(this).click(function () {
	            chatRoom = $(this);
	            console.log(chatRoom);
	            $.ajax({
	                type: 'GET',
	                dataType: 'json',
	                url: 'chatOpen.do?roomNum=' + $(this).children('#chatRoomId').val(),
	                success: function (chatDTO) {
	                    $("#chat-messages").children(".message").remove();
	                    $("#chat-messages").children("label").remove();
	                    chatRoom.children('.readcount').remove()
	                    var memberName =chatRoom.children('#memberName').val();
	                    websocket.send("chatroomON|" + memberName);
	                   var fLog =  chatOpen(chatRoom.children('#chatRoomId').val(),myid,"on",memberName)
	                    var messagedate;
	                 console.log(fLog)
	                 console.log("aaaaa")
	                
	                    chatDTO.forEach(function (chat) {
	                        var date = TimeStemp(new Date(chat.messageDate));
	                        if(messagedate != date[0]) {
	                        	messagedate = date[0];
	                        	$("#chat-messages").append('<label>'+messagedate+'</label>')
	                        }
	                        var id;
	                        var isread;
	                        if (chat.memberName == myid) 
	                        {   id = '<div class="message right">';
	                        	if(fLog==null){isread=''}
	                        	else if(chat.messageDate>fLog)
	                        		isread = '<span class ="isread">1</span>'
	                        	else
	                        		isread=''
	                        }
	                         else 
	                         {  id = '<div class="message"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" />';
	                         isread =''
	                         }
	                        // 이미지 주소 chat.chatImgPath
	                        // 읽었는지 아닌지 chat.isRead
	                        // 아이템 아이디 chat.itemid
	                        var message = id + '<div class="bubble">' + chat.messageContent + '<div class="corner"></div>' + '<span>' + date[1] + '</span></div>'+isread+'</div>';
	                       $("#chat-messages").append(message)
	                     //   rr.children('.isread').height(rr.children('.right').height()/2);
	                    })
	                   $('.isread').each(function(i,item){
	                	   $(item).css({'padding-top':$(item).prev().height()})
	                	   
	                   });
	               
	           
	                    var objDiv = document.getElementById("chat-messages");
	                    objDiv.scrollTop = objDiv.scrollHeight;
	                },
	                error: function () {
	                    console.log("error");
	                }
	            });
	            var childOffset = $(this).offset();
	            var parentOffset = $(this)
	                .parent()
	                .parent()
	                .offset();
	            var childTop = childOffset.top - parentOffset.top;
	            var clone = $(this)
	                .find("img")
	                .eq(0)
	                .clone();
	            var top = childTop + 12 + "px";
	            $(clone)
	                .css({top: top})
	                .addClass("floatingImg")
	                .appendTo("#chatbox");
	            setTimeout(function () {
	                $("#profile p").addClass("animate");
	                $("#profile").addClass("animate");
	            }, 100);
	            setTimeout(function () {
	                $("#chat-messages").addClass("animate");
	                $(".cx, .cy").addClass("s1");
	                setTimeout(function () {
	                    $(".cx, .cy").addClass("s2");
	                }, 100);
	                setTimeout(function () {
	                    $(".cx, .cy").addClass("s3");
	                }, 200);
	            }, 150);
	            $(".floatingImg").animate({
	                width: "68px",
	                left: "108px",
	                top: "20px"
	            }, 200);
	            var name = $(this).find("p strong").html();
	            var email = $(this).find("p span").html();
	            $("#profile p").html(name);
	            $("#profile span").html(email);
	            $(".message")
	                .not(".right")
	                .find("img")
	                .attr("src", $(clone).attr("src"));
	            $("#friendslist").fadeOut();
	            $("#chatview").fadeIn();
	            $("#close").unbind("click").click(function () {
	            	chatmessgcolse();
	            });
	        });
	    });
}

function closeanim(){
    $(".cxx, .cyy").addClass("s1");
    setTimeout(function () {
        $(".cxx, .cyy").addClass("s2");
    }, 100);
    setTimeout(function () {
        $(".cxx, .cyy").addClass("s3");
    }, 200);
	
}

function sendmessage(sendBtn){
	 var item = chatRoom.children('#itemId').val(); // 아이템번호.
     var Room = chatRoom.children('#chatRoomId').val(); // 아이템번호.
     var nick = chatRoom.children('#memberName').val(); // 상대방 아이디
     var msg = $('#message').val();
     websocket.send("msg|" + item + "|" + Room + "|" + nick + "|" + myid + "|" + sendBtn.prev().val());
     var dateTime;
 	var dateTime = TimeStemp(new Date(Date.now()));
     if(messagedate != dateTime[0]) {
     	messagedate = dateTime[0];
     	$("#chat-messages").append('<label>'+messagedate+'</label>')
     }
 		var isread = '<span class ="isread">1</span>'
     
     var message = '<div class="message right"><div class="bubble">' + sendBtn.prev().val() + '<div class="corner"></div>' + '<span>' + dateTime[1] + '</span></div>'+isread+'</div>';
     $("#chat-messages").append(message)
       $('.isread').each(function(i,item){
	      $(item).css({'padding-top':$(item).prev().height()})
	     });
     var objDiv = document.getElementById("chat-messages");
     objDiv.scrollTop = objDiv.scrollHeight;
     $("#sendmessage input").val("")
	
}
function getParam(sname) {
    var params = location.search.substr(location.search.indexOf("?") + 1);
    var sval = "";
    params = params.split("&");
    for (var i = 0; i < params.length; i++) {
        temp = params[i].split("=");
        if ([temp[0]] == sname) {
            sval = temp[1];
        }
    }
    return sval;
}