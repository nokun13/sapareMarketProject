$(document)
			.ready(
					function() {
						$('.Updd').click(function(){
							alert('처리되었습니다.');
							$('.'+ this.id).submit();
						});
					
					$(".Modd").on('click', function(){
						$("#frmm").attr('action', 'memberFlagHold.do');
						$('.'+ this.id).submit();
					});
						
					}); // end ready()