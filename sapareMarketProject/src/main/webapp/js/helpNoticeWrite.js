$(document).ready(function(){
	$('select[name="board_category"]').val('${dto.boardCategory}');
	
	$('.canc').on('click',function(){
		$('form').attr('action','helpPage.do');
		$('form').submit();
	});

	$('.modi').on('click',function(){
		$('#frm').attr('action', 'helpNoticeWrite.do');
		$('#frm').submit();
	});




	});
