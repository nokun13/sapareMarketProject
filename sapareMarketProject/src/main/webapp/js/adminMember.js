$(document)
			.ready(
					function() {
						
						
						$('.btn').click(function(){
							alert('처리되었습니다.');
							$('.'+ this.id).submit();

						});
							$("#selectbox > option[value="+'<c:out value="${ param.selectbox }"/>'+"]").attr("selected","selected");
					
						
					});