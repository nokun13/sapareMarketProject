$(document).ready(function() {
	// 채팅 버튼
	$('.bt2').on('click', function() {
		alert("안녕하세요");
		
	})
    ////////////////////////////////////////////////   
	
	// 신고하기 모달창
		$('#decl-btn').click(function(){
			$('#decl-modal').css("display","block");
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
		
		$(".span-decl-content1").click(function(){
		    $(".1").toggle();
		  });
		
		$(".span-decl-content2").click(function(){
		    $(".2").toggle();
		  });
		
		
		$(".span-decl-content3").click(function(){
		    $(".3").toggle();
		  });
		
		$(".span-decl-content4").click(function(){
		    $(".4").toggle();
		  });
		
		$(".span-decl-content5").click(function(){
		    $(".5").toggle();
		  });
		////////////////////////////////////////////
		
		
		
/*	var modal = document.getElementById('decl-modal');
	var btn = document.getElementById('decl-btn');
	var span = document.getElementById('close')[0];

	btn.onclick = function() {
		modal.style.display = "block";
	}

	span.onclick = function() {
		modal.style.display = "none";
	}
	window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
	}*/
	
})