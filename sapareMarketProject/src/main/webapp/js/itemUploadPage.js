/**
 * 
 */
	//선택한 이미지 img요소에 보이기
  	$(document).ready(function(){
  	   
	   $('#filepath').on('change', function() {
	      var str = $('#filepath').val();
	
	      
	      //이미지 첨부파일인지 체크
	      var patt = /(.jpg$|.jpeg$|.gif$|.png$)/gi;
	      var result = str.match(patt);

	      $('#img').attr('src',str);
	     
	      if (!result) {
	         alert('jpg, gif, png만 가능합니다.');
	         $('#filepath').val('');
	         return false;
	      }

	      //파일첨부 사이즈 체크
	      if (this.files[0].size > 1000000000) {// 1GB보다 작아야한다
	         alert('1GB 이하만 가능합니다.');
	         $('#filepath').val('');
	         return false;
	      }
	      
	      //(https://developer.mozilla.org/ko/docs/Web/API/FileReader/FileReader)
	      //파일을 읽기 위한 FileReader라는 객체 생성
	      var reader = new FileReader();

	      //File내용을 읽어 dataURL형식의 문자열 저장
	      reader.readAsDataURL(this.files[0]);

	      //파일 읽어들이기를 성공했을때 호출되는 이벤트 메소드
	      reader.onload = function(e) {
	         //img요소의 src속성에 읽어들인 File내용을 지정
	      };
	   });//end change
	   
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
		$('#img').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
		}
		} 

 /*  $(document).ready(function() {
     $("#filepath").on('change', function() {
       //Get count of selected files
       var countFiles = $(this)[0].files.length;
       var imgPath = $(this)[0].value;
       var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
       var image_holder = $("#img");
       image_holder.empty();
       if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
         if (typeof(FileReader) != "undefined") {
           //loop for each file selected for uploaded.
           for (var i = 0; i < countFiles; i++) 
           {
             var reader = new FileReader();
             reader.onload = function(e) {
               $("<img />", {
                 "src": e.target.result,
                 "id": "img"
               }).appendTo(image_holder);
             }
             image_holder.show();
             reader.readAsDataURL($(this)[0].files[i]);
           }
         } else {
           alert("This browser does not support FileReader.");
         }
       } else {
         alert("Pls select only images");
       }
     });
   }); */
   //다중카테고리
   $(function(){
	    
	    // 질문유형을 선택한다.
	    chnQnaType('0' , '61' , '111');
	});

	function chnQnaType(type , select, object) {
		
	    $('#tType').empty();
	    
	    $('#tType').css('visibility', 'visible');
	    
	    
	    if(type == '1') { // 상품관련
	        $('#tType').append("<option value='11' >중분류</option>'");
	        $('#tType').append("<option value='12' >헬스/요가</option>'");
	        $('#tType').append("<option value='13' >축구/야구/농구</option>'");
	        $('#tType').append("<option value='14' >낚시/캠핑</option>'");
	        $('#tType').append("<option value='15' >볼링/테니스/배드민턴</option>'");
	        $('#tType').append("<option value='16' >스키/스노우보드</option>'");
	        $('#tType').append("<option value='17' >자건거/MTB</option>'");
	        $('#tType').append("<option value='18' >등산</option>'");
	        $('#tType').append("<option value='19' >수영</option>'");
	       
	    } else if (type == '2') {  // 일반관련
	    	$('#tType').append("<option value='21' >중분류</option>'");
	        $('#tType').append("<option value='22' >이용문의</option>'");
	        $('#tType').append("<option value='23' >회원가입/로그인</option>'");
	        $('#tType').append("<option value='24' >기타문의</option>'");
	    } else if ( type == '3') {  // 주문관련
	    	$('#tType').append("<option value='31' >중분류</option>'");
	        $('#tType').append("<option value='32' >결제문의</option>'");
	        $('#tType').append("<option value='33' >배송문의</option>'");
	        $('#tType').append("<option value='34' >주문취소문의</option>'");
	        $('#tType').append("<option value='35' >반품문의</option>'");
	        $('#tType').append("<option value='36' >기타문의</option>'");
	    }else if ( type == '4') {  // 주문관련
	    	$('#tType').append("<option value='41' >중분류</option>'");
	        $('#tType').append("<option value='42' >결제문의</option>'");
	        $('#tType').append("<option value='43' >배송문의</option>'");
	        $('#tType').append("<option value='44' >주문취소문의</option>'");
	        $('#tType').append("<option value='45' >반품문의</option>'");
	        $('#tType').append("<option value='46' >기타문의</option>'");
	    }else if ( type == '5') {  // 주문관련
	    	$('#tType').append("<option value='51' >중분류</option>'");
	        $('#tType').append("<option value='52' >결제문의</option>'");
	        $('#tType').append("<option value='53' >배송문의</option>'");
	        $('#tType').append("<option value='54' >주문취소문의</option>'");
	        $('#tType').append("<option value='55' >반품문의</option>'");
	        $('#tType').append("<option value='56' >기타문의</option>'");
	    }else if ( type == '0') {  // 주문관련
	    	$('#tType').css('visibility', 'hidden');
	    	$('#fType').css('visibility', 'hidden');
	    }else if( type == '00'){
	    	$('#tType').append("<option value='000'>경매</option>'");
	    	$('#fType').css('visibility', 'hidden');
	    }else{
	    	$('#tType').hide();
	    }
	    
	   
	    document.getElementById("tType").style.display = "";
	}
	function chnQnaTypes(type , select, object) {   
	    if ($.trim(select) != "") {
	        $('#select1').val(type);
	        $('#tType').val(select);
	    } 
	    
	    $('#fType').css('visibility', 'visible');
	    
	    if(type=='12'){
	    	$('#fType').append("<option value='111' >소분류</option>'");
	    	$('#fType').append("<option value='112' >헬스의류</option>'");
	    	$('#fType').append("<option value='113' >헬스용품</option>'");
	    	$('#fType').append("<option value='114' >요가의류</option>'");
	    	$('#fType').append("<option value='115' >요가용품</option>'");
	    }else if(type=='13'){
	    	$('#fType').append("<option value='111' >소분류</option>'");
	    	$('#fType').append("<option value='121' >축구용품</option>'");
	    	$('#fType').append("<option value='121' >농구용품</option>'");
	    	$('#fType').append("<option value='121' >야구용품</option>'");
	    	$('#fType').append("<option value='121' >각종 유니폼</option>'");
	    }else if(type=='14'){
	    	$('#fType').append("<option value='111' >소분류</option>'");
	    	$('#fType').append("<option value='121' >낚시대</option>'");
	    	$('#fType').append("<option value='121' >미끼</option>'");
	    	$('#fType').append("<option value='121' >캠핑도구</option>'");
	    	$('#fType').append("<option value='121' >텐트/장비</option>'");
	    }
	    
	    if($.trim(object) != "") {
	        $('#select2').val(type);
	        $('#fType').val(object);
	    }
	    
	    document.getElementById("fType").style.display = "";
	}
	//중고상품 판매시 경매시간과 경매가격 히든
	function Display(){
		if($("input:radio[name='radio'][value='0']").is(':checked')){
			$('#AuctionStartPrice').hide();
		}else{
			$('#AuctionStartPrice').show();
		}
	}
