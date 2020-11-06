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
	var flag = getParam("flag");
	if(flag == "d"){
		alert("성공적으로 신고되었습니다.");
	}
	
	// 찜 버튼
	$('.bt-tle').on('click', '.bt-heart', function(){
		var itemid = $('#itemId').val();
		var membername = $('#memberName').val();
		var sellername = $('#sellerName').val();
		var session = $('.session_id').val();
		var memberid = $("#memberId").val();
		var itemStatus = $("#itemStatus").val();
		if(session == ''){
			$('.modallogin').toggle();
			return false;
		}
		if(session == memberid){
			alert("본인의 상품은 찜 할 수 없습니다!");
			return false;
		}
		if(itemStatus == 'n'){
			alert("이미 판매완료된 상품입니다!");
			return false;
		}
		if (session != ''){
			if($('.bt-heart').is('#btNotWant')){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'clickWantProcess.do?memberName='+membername+'&sellerName='+sellername+'&itemId='+itemid,
					success: after_insert_want,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
			else if($('.bt-heart').is('#btWant')){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'unclickWantProcess.do?memberName='+membername+'&itemId='+itemid,
					success: after_remove_want,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		} else{
			$('.modallogin').toggle();
			return false;
		}
	});
	
	function after_insert_want(res){
		$(".bt-container").empty();
		$(".sa-tle").empty();
		
		var source = "<button type='button' class='bt bt-heart' id='btWant' style='background: #FF6A6A;'>"
					+ "<img src='image/safill.png' width='18' height='18' alt='찜 아이콘'>"
					+ "<span>찜</span>"
					+ "</button>";
		
		var source2 = "<img src='image/safill.png' id='sa-img' width=16px; height=16px;alt='상품 상태 아이콘'>"
					+ "<div class='sa-count'>"+res.itemWantCnt+"</div>";
		
		$('.bt-container').append(source);
		$('.sa-tle').append(source2);
	}
	
	function after_remove_want(res){
		$(".bt-container").empty();
		$(".sa-tle").empty();

		var source = "<button type='button' class='bt bt-heart' id='btNotWant' style='background: rgb(204, 204, 204);'>"
					+ "<img src='image/sa.png' width='18' height='18' alt='찜 아이콘'>"
					+ "<span>찜</span>"
					+ "</button>";

		var source2 = "<img src='image/sa.png' id='sa-img' width=16px; height=16px;alt='상품 상태 아이콘'>"
					+ "<div class='sa-count'>"+res.itemWantCnt+"</div>";
		
		
		$('.bt-container').append(source);
		$('.sa-tle').append(source2);
	}
	
	// 채팅 버튼
	$('.bt2').on('click', function() {
		 var session= $('#mynameid').val();
		 var session2 = $('.session_id').val();
		 var btn = document.getElementById("mychatBtn");
		 var modal = document.getElementById('chatModal');
		 var itemStatus = $("#itemStatus").val();
		 if(session2 == ''){
			$('.modallogin').toggle();
			return false;
		}
		 if(itemStatus == 'n'){
			 alert("이미 판매완료된 상품입니다!");
			 return false;
		 }
		if(session!=''){
				if (btn.className == 'active') {
					btn.classList.toggle('active')
					$('#friends').children('.friend').remove()
					
				} else {
					
				}
				btn.classList.toggle('active')
			modal.style.display = "block";
			 $.ajax({
	                type: 'POST',
	                dataType: 'json',
	                async: false,
	                url: 'addstart.do' ,
	                data :'itemId='+$('#itemId').val()+'&memberName='+session,
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
			
			
			
		}else{
			$('.modallogin').toggle();
			return false;
		}
		
	})
	
	
	// 신고하기 모달창
	   
		$('#decl-btn').click(function(){
			 var session= $('.session_id2').val();
			 if(session!=''){
				 $('.modal').toggle();
			}else{
				$('.modallogin').toggle();
				return false;
			}
		});
	
		
		$('.close').click(function(){
			$('#decl-modal').css("display","none");
		});

	////////////////////////////////////////////////
	
	//신고하기 토글
		$(".1").hide();	

		$(".2").hide();
		
		$(".3").hide();
		
		$(".4").hide();
		
		$(".5").hide();
		
		$("#d1").hover(function() {
			$(".1").toggle();
			
		});

		$("#d2").hover(function() {
			$(".2").toggle();
		});

		$("#d3").hover(function() {
			$(".3").toggle();
		});

		$("#d4").hover(function() {
			$(".4").toggle();
		});

		$("#d5").hover(function() {
			$(".5").toggle();
		});
		//////////////////////////////////
		
		//////////신고하기
		$('#itemflagsubmit1').on('click',function(){
			console.log("submit");
			$('#if1').submit();
		});
		$('#itemflagsubmit2').on('click',function(){
			console.log("submit");
			$('#if2').submit();
		});
		$('#itemflagsubmit3').on('click',function(){
			console.log("submit");
			$('#if3').submit();
		});
		$('#itemflagsubmit4').on('click',function(){
			console.log("submit");
			$('#if4').submit();
		});
		$('#itemflagsubmit5').on('click',function(){
			console.log("submit");
			$('#if5').submit();
		});
		// //////////////////////////////////////////
		
		/////////////////////////찜하기
		
		$("#btnwant").click(function(){
		    if(confirm("해당 상품을 찜하시겠습니까?")){
		        document.form1.action="want.do";
		        document.form1.submit();
		        
		        alert("찜하였습니다.")
		        
		        }
		});		
		////////////////////////////////////
		
		////////////////삭제
		$('#deleteEvent').on('click',delItemRun);
		
		function delItemRun(){
			var itemStatus = $("#itemStatus").val();
			if(itemStatus == 'n'){
				alert("판매완료된 상품은 삭제할 수 없습니다!");
				return false;
			}
			console.log('나와라');
			$('form.up-de-class').attr('action','deleteItem.do').submit();
		}
		
		// 수정 버튼 클릭 수정 페이지로 이동
		$(".up-bt").on("click", function(){
			var itemStatus = $("#itemStatus").val();
			if(itemStatus == 'n'){
				alert("판매완료된 상품은 수정할 수 없습니다!");
				return false;
			}
			$('form.up-de-class').attr('action', 'itemUploadPage.do').submit();
		});
		
})