$(document)
			.ready(
					function() {
						$('.Updd').click(function(){
							alert('처리되었습니다.');
							$('.'+ this.id).submit();
						});
						
						$(".Modd").on('click', function(){
							$("#frmm").attr('action', 'itemFlagHold.do');
							$('.'+ this.id).submit();
						});	
						
					}); // end ready()