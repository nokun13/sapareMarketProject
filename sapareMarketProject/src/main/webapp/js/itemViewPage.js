$(document).ready(function() {
	
	// 찜 버튼
	$('.bt-tle').on('click', '.bt-heart', function(){
		var itemid = $('#itemId').val();
		var membername = $('#memberName').val();
		var sellername = $('#sellerName').val();
		var session = $('.session_id').val();
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
		 var session= $('.session_id').val();
		console.log(session+'aaa')
		if(session!=''){
			alert("채팅을 시작합니다");
			
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
			$('form').attr('action','deleteItem.do').submit();
		}
		


	
})