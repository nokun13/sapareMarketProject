$(document).ready(function() {
		
		// 닉네임 변경 버튼 클릭 후 현재 닉네임 가져오기
		$("#changeNick").click(function(){
			
			$.ajax({
				type:'GET',
				dataType:'json',
				url:'memberInfoGet.do?memberName=${member.memberName}',
				success: change_nickname,
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
		});
		
		// 닉네임 중복 체크
		function change_nickname(res){
			
			$("#changeNick").prev().html('<input type="text" id="newNickname" maxlength="15" value="'+res.nickname+'" style="font-size:16px;outline:none;"> <button type="button" id="submitNick" style="cursor:pointer;">확인</button>');
			$("#changeNick").hide();
			
			// 닉네임 변경 엔터 버튼 클릭 기능
			var input = document.getElementById("newNickname");
			
			input.addEventListener("keyup", function(event){
			  if (event.keyCode === 13) {
			    event.preventDefault();
			    document.getElementById("submitNick").click();
			  }
			});
			
			$('#submitNick').click(function(){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'checkNickname.do?nickname=' + $("#newNickname").val(),
					success: get_new_nickname,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
		};
		
		// 닉네임 변경
		function get_new_nickname(res){
			if(res == 1){
				alert("이미 존재하는 닉네임입니다.");
			} else{
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'changeNickname.do?memberName=${member.memberName}&nickname=' + $("#newNickname").val(),
					success: change_to_new_nickname,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		};
		
		// 닉네임 변경 후 변경 된 닉네임으로 바꿔주고 수정버튼 재생성
		function change_to_new_nickname(res){
			$('.nickname').html(res.nickname);
			$('#changeNick').show();
		};
		
		
		// 소개글 변경 버튼 클릭 후 소개글 가져오기
		$("#changeAbout").click(function(){
			
			$.ajax({
				type:'GET',
				dataType:'json',
				url:'memberInfoGet.do?memberName=${member.memberName}',
				success: change_about_content,
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
		});
		
		// textarea 변경가능으로 바꾸고 소개글 뿌려주기, 확인 버튼 누르면 저장
		function change_about_content(res){
			if(res.memberAbout === null){
				res.memberAbout = "";
			}
			$(".memberAbout").html('<textarea id="aboutContent" rows="8" cols="65" maxlength="80" style="background-color:white;border:1px solid black;cursor:auto;">'+res.memberAbout+'</textarea>')
			$(".aboutChangeBox").append('<button type="button" id="submitAbout" style="margin: 10px; cursor:pointer;">확인</button>');
			
			$("#changeAbout").hide();
			
			$("#submitAbout").click(function(){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'changeMemberAbout.do?memberName=${member.memberName}&memberAbout='+$("#aboutContent").val(),
					success: after_about_change,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
			
		};
		
		// 소개글 저장 후 textarea 복구, 버튼 복구
		function after_about_change(res){
			if(res.memberAbout === null){
				res.memberAbout = "";
			}
			$("#submitAbout").remove();
			$("#changeAbout").show();
			$(".memberAbout").html('<textarea readonly id="aboutContent" rows="8" cols="65" maxlength="80">'+res.memberAbout+'</textarea>');
		};
		
		// 프로필 사진이나 사진수정버튼 누르면 '사진 고르기' 버튼 클릭
		$("#profileImgChange").click(function() {
		    $("#filepath").click();
		});
		$("#memberImg").click(function() {
		    $("#filepath").click();
		});
		
		// 새로운 프로필 사진 선택 후
		$('#filepath').on('change', function(){
			var str = $('#filepath').val();
		
			// 이미지 첨부파일인지 체크
			var patt = /(.jpeg$|.jpg$|.gif$|.png$)/gi;
			var result = str.match(patt);
			
			if($("#filepath").val() === ""){
				$(".imgChangeBox").empty();
				alert("프로필 사진 변경을 취소하였습니다.")
				$('#memberImg').attr("src", "/sapare/img/${member.profileImg }");
				$(".imgChangeBox").html('<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
				return false;
			}
			
			if(!result){
				$(".imgChangeBox").empty();
				alert('jpeg, jpg, gif, png만 가능합니다.');
				$('#filepath').val("");
				$('#memberImg').attr("src", "/sapare/img/${member.profileImg }");
				$(".imgChangeBox").html('<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
				return false;
			}
			
			// 파일첨부 사이즈 체크
			if(this.files[0].size > 100000000){
				$(".imgChangeBox").empty();
				alert('100MB 이하만 가능합니다.');
				$('#filepath').val("");
				$('#memberImg').attr("src", "/sapare/img/${member.profileImg }");
				$(".imgChangeBox").html('<button type="button" id="profileImgChange" style="cursor:pointer; margin: 5px 0;">프로필사진수정</button>');
				return false;
			}
			
			// 파일을 읽기 위한 FileReader객체 생성
			var reader = new FileReader();
			
			// File내용을 읽어 dataURL형식의 문자열 저장
			reader.readAsDataURL(this.files[0]); // 배열 형식이기에 꼭 [i] 배열의 순서를 알려줘야한다.
			
			// 파일 일거들이기를 성공했을 때 호출되는 이벤트 메소드
			reader.onload = function(e){
				// img요소의 src속성에 읽어들인 File내용을 지정해준다.
				$('#memberImg').attr('src', e.target.result);
			};
			
			// 프로필사진수정 버튼을 확인 버튼으로 교체
			if(!($("#submitProfileImg").length)){
				$("#profileImgChange").hide();
				$(".imgChangeBox").append('<button type="button" id="submitProfileImg" style="margin: 5px; cursor:pointer;">확인</button>')
			}
		
			$("#submitProfileImg").click(function(){
				// 첨부파일을 Form안에 담아내기 위해서 작성한다.
				var form_data = new FormData();
				form_data.append('memberName', '${member.memberName}');
				form_data.append('profileFile', $("#filepath")[0].files[0]);
				
				// 변경된 프로필 사진 저장
				$.ajax({
					type:'POST',
					dataType:'json',
					// 첨부파일을 ajax로 보내기 위하여 아래 3개의 문을 사용한다. 
					contentType:false,
					enctype:'filename/form-data',
					processData:false,
					url:'profileImgChange.do',
					// data는 첨부파일을 포함한 form_data를 사용할 수 있다
					data:form_data,
					success:profile_img_change,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }
				});
			});	
		}); // end change()
		
		// 변경된 프로필 사진으로 보이게끔 한다
		function profile_img_change(res){
			$("#memberImg").attr('src', "/sapare/img/"+res.profileImg);
			$("#submitProfileImg").remove();
			$("#profileImgChange").show();
		};
		
		// 찜 순서 옵션 선택
		$("#chooseOrder").on('change', function(){
			var option = $("#chooseOrder option:selected").val();
			if(option == "newWantOrder"){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'newWantProcess.do?memberName=${member.memberName}&searchWord='+$(".searchText").val(),
					success: after_review_change,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			} else if(option == "wantNumOrder"){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'wantNumProcess.do?memberName=${member.memberName}&searchWord='+$(".searchText").val(),
					success: after_review_change,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			} else if(option == "lowPriceOrder"){
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'wantPriceProcess.do?memberName=${member.memberName}&searchWord='+$(".searchText").val(),
					success: after_review_change,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		});
		
		// 찜 순서 뿌려주기
		function after_review_change(res){
			$(".wantItemBox").remove();
			$.each(res, function(index, value){
				var source = "<li class='wantItemBox'><a class='wantItemCard' href='itemViewPage.do?itemId="+value.itemId+"'>"
							+ "<div class='wantItemInside'><div class='itemImageBox'><img onerror='this.src='/sapare/img/default.png'' src='/sapare/img/"+value.itemImagePath+"'/></div>"
							+ "<div class='itemDescribeBox'><div><div class='itemName'>"+value.itemName+"</div>"
							+ "<div class='itemPrice'>"+value.itemPrice+"</div></div></div></div></a>"
							+ "<input class='wantItemNo' hidden='hidden' value='"+value.itemId+"'/>"
							+ "<div class='heartContainer' id='heartContainer"+value.itemId+"' style='position:absolute;transform: translate(180px,-80px);'>"
							+ "<button type='button' class='wantItemBtn' style='border:none; background-color:#f0f8ff;outline:none;'>"
							+ "<svg version='1.0' xmlns='http://www.w3.org/2000/svg' width='35px' height='35px' viewBox='0 0 25 25'"
							+ "fill='#f44336' fill-opacity='1' stroke='#ffffff' stroke-width='2' focusable='false' aria-label='찜하기'"
							+ "role='img' stroke-linecap='round' stroke-linejoin='round' preserveAspectRatio='xMidYMid meet'>"
							+ "<g><path d='m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6'/>"
							+ "</g></svg></button></div></li>";
				$(".wantItemWrapper ul").append(source);
			});
		};
		
		// 검색 엔터 기능
		var searchEnter = document.getElementById("searchText");
		
		searchEnter.addEventListener("keyup", function(event){
		  if (event.keyCode === 13) {
		    event.preventDefault();
		    $(".searchBtn").click();
		  }
		});
		
		// 찜 검색 기능
		$(".searchBtn").on('click', function(){
			$.ajax({
				type:'GET',
				dataType:'json',
				url:'newWantProcess.do?memberName=${member.memberName}&searchWord='+$(".searchText").val(),
				success: after_review_change,
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		// 찜 하트 클릭 시 빼주기 기능
		$(".wantItemWrapper").on("click",".heartContainer", function(){
			var num = $(this).prev().val();
			// $("#heartContainer"+num+" svg").css("fill", "#484848");
			
			if (confirm("찜 목록에서 제거하시겠습니까?")) {
				$.ajax({
					type:'GET',
					dataType:'json',
					url:'removeWantProcess.do?memberName=${member.memberName}&searchWord=&itemId='+num,
					success: after_remove_want,
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			} else {
				$("#heartContainer"+num+" svg").css("fill", "#f44336");
			}
		});
		
		// 찜 목록에서 상품 제거 후
		function after_remove_want(res){
			console.log('찜 목록에서 제거 되었습니다.');
			$(".wantItemBox").remove();
			$.each(res, function(index, value){
				var source = "<li class='wantItemBox'><a class='wantItemCard' href='itemViewPage.do?itemId="+value.itemId+"'>"
							+ "<div class='wantItemInside'><div class='itemImageBox'><img onerror='this.src='/sapare/img/default.png'' src='/sapare/img/"+value.itemImagePath+"'/></div>"
							+ "<div class='itemDescribeBox'><div><div class='itemName'>"+value.itemName+"</div>"
							+ "<div class='itemPrice'>"+value.itemPrice+"</div></div></div></div></a>"
							+ "<input class='wantItemNo' hidden='hidden' value='"+value.itemId+"'/>"
							+ "<div class='heartContainer' id='heartContainer"+value.itemId+"' style='position:absolute;transform: translate(180px,-80px);'>"
							+ "<button type='button' class='wantItemBtn' style='border:none; background-color:#f0f8ff;outline:none;'>"
							+ "<svg version='1.0' xmlns='http://www.w3.org/2000/svg' width='35px' height='35px' viewBox='0 0 25 25'"
							+ "fill='#f44336' fill-opacity='1' stroke='#ffffff' stroke-width='2' focusable='false' aria-label='찜하기'"
							+ "role='img' stroke-linecap='round' stroke-linejoin='round' preserveAspectRatio='xMidYMid meet'>"
							+ "<g><path d='m 17.5 2.9 c -2.1 0 -4.1 1.3 -5.4 2.8 c -1.6 -1.6 -3.8 -3.2 -6.2 -2.7 c -1.5 0.2 -2.9 1.2 -3.6 2.6 c -2.3 4.1 1 8.3 3.9 11.1 c 1.4 1.3 2.8 2.5 4.3 3.6 c 0.4 0.3 1.1 0.9 1.6 0.9 s 1.2 -0.6 1.6 -0.9 c 3.2 -2.3 6.6 -5.1 8.2 -8.8 c 1.5 -3.4 0 -8.6 -4.4 -8.6'/>"
							+ "</g></svg></button></div></li>";
							
				$(".wantItemWrapper ul").append(source);
			});
		};
		
	}); // end ready()