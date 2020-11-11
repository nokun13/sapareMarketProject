	$(document).ready(function() {
		
		$('.list').on('click', backRun);
		$('.upt').on('click', updateRun);

	/* 	$('.del').on('click', function() {
			$('form').attr('action', 'delete.do');
			$('form').submit();
		}); */
	});

	function backRun() {
		//history.back();
		$('#frm').attr('action', 'helpPage.do').submit();
	}
	function updateRun() {
		$('#frm').attr('action', 'helpNoticeUpdate.do').submit();
	}
