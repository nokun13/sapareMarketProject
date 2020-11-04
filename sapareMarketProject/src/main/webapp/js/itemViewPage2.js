$(document).ready(function() {
	// 채팅 버튼
	$('.bt2').on('click', function() {
		alert("안녕하세요");
		
	})
    ////////////////////////////////////////////////   
	
	// 신고하기 모달창
	   
		$('#decl-btn').click(function(){
			$('.modal').toggle();
			return false;
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
		$('#itemflagsubmit').on('click',function(){
			console.log("submit");
			$('#if').submit();
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