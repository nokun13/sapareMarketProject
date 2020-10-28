/**
 * 
 */
	//선택한 이미지 img요소에 보이기
	 window.onload = function() {

	function onClick() {
        document.querySelector('#map').style.visibility ='visible';
        document.querySelector('#back').style.visibility ='visible';
        document.querySelector('#in').style.visibility ='visible';
        document.querySelector('#menu_wrap').style.visibility ='visible';
        
    }   
    function offClick() {
        document.querySelector('#map').style.visibility ='hidden';
        document.querySelector('#back').style.visibility ='hidden';
        document.querySelector('#in').style.visibility ='hidden';

    }
 
    document.getElementById('map-btn').addEventListener('click', onClick);
    document.querySelector('#in').addEventListener('click', offClick);
   
};

  	$(document).ready(function(){
 	
  	
  	   $('#cancel').click(function(){
  		   alert("취소되었습니다.");
  	   })
  	   $('#sell').click(function(){
  		   alert('판매등록되었습니다.') ;
  	   })  	
  	   /*$('#map-btn').click(function(){
  		   $('.map_wrap').css('display','block');
  	   })*/
  	
  	var markers = [];
  	
  	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성 및 객체 리
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
var ps = new kakao.maps.services.Places();

searchPlaces();
// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}


// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                            '</div>';
            console.log( detailAddr);
            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);
            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
            $("#map_info").html(result[0].address.address_name);
        }   
    });
    
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}

	   $('#filepath').on('change', function() {
	      var str = $('#filepath').val();
	
	      
	      //이미지 첨부파일인지 체크
	      var patt = /(.jpg$|.jpeg$|.gif$|.png$)/gi;
	      var result = str.match(patt);

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
	      $('#img').attr('src', e.target.result);
	      };
	   });//end change
	   
	});
	/*function readURL(input) {
		if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
		$('#img').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
		}
		} */

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
             console.log(("#img")._filename)
             image_holder.show();
             reader.readAsDataURL($(this)[0].files[i]);
           }
         } else {
           alert("This browser does not support FileReader.");
         }
       } else {
         alert("Pls select only images");
       }
       $(function(){
    	   $('#img').click(function(){
    		   $('#img').empty();
    	   })
       })
     });
   }); 
  
	});*/
/*	function readInputFile(input) {
    if(input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#img').html("<img src="+ e.target.result +">");
        }
        reader.readAsDataURL(input.files[0]);
    }
}
 
$("#img").on('change', function(){
    readInputFile(this);
});
 
 
// 등록 이미지 삭제 ( input file reset )
function resetInputFile($input, $preview) {
    var agent = navigator.userAgent.toLowerCase();
    if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
        // ie 일때
        $input.replaceWith($input.clone(true));
        $preview.empty();
    } else {
        //other
        $input.val("");
        $preview.empty();
    }       
}
 
$("#filepath").click(function(event) {
    var $input = $("#filepath");
    var $preview = $('#img');
    resetInputFile($input, $preview);
});
*/

 /*  var sel_files= [];
   
   $(document).ready(function(){
	  $('#filepath').on('change',fileSelect);
   });
   
   function uploadAction(){
	   console.log('fileUploadAction');
	   $('#filepath').trigger('click');
   }
   
   function fileSelect(e){
	   sel_files=[];
	   
	   $('#img').empty();
	   
	   var files =e.target.files;
	   var filesArr = Array.prototype.slice.call(files);
	   
	   var index=0;
	   filesArr.forEach(function(f){
		   if(!f.type.match('image.*')){
			   alert('이미지만 가능합니다.');
			   return;
		   }
		   
		   sel_files.push(f);
		   
		   var reader= new FileReader();
		   reader.onload =function(e){
			   var html ="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\""+e.target.result +"\"data-file='"+f.name+"'class='selProducrFIle' title='Click to remove'></a>";
			   $('#img').append(html);
			   index++;
		   }
		   reader.readAsDataURL(f);
	   });
   }
   */
   //다중카테고리
   $(function(){
	    
	    // 질문유형을 선택한다.
	    chnQnaType('big');
	});

	function chnQnaType(type,object) {
		
	    $('#tType').empty();
	    
	    $('#tType').css('visibility', 'visible');
	    $('#AuctionStartPrice').hide();
	    $("#price").show()
	    
	    if(type == 'sport') { // 상품관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='health' >헬스/요가</option>'");
	        $('#tType').append("<option value='ballsport' >축구/야구/농구</option>'");
	        $('#tType').append("<option value='fising' >낚시/캠핑</option>'");
	        $('#tType').append("<option value='bowilng' >볼링/테니스/배드민턴</option>'");
	        $('#tType').append("<option value='ski' >스키/스노우보드</option>'");
	        $('#tType').append("<option value='bicycle' >자건거/MTB</option>'");
	        $('#tType').append("<option value='Mountain' >등산</option>'");
	        $('#tType').append("<option value='swim' >수영</option>'");	       
	    } else if (type == 'digital') {  // 일반관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='mobile' >모바일</option>'");
	        $('#tType').append("<option value='appliance' >가전제품</option>'");
	        $('#tType').append("<option value='game' >게임</option>'");
	        $('#tType').append("<option value='pc' >PC/모니터</option>'");
	        $('#tType').append("<option value='notebook' >노트북/넷북</option>'");
	        $('#tType').append("<option value='camera' >카메라</option>'");
	    } else if ( type == 'cloth') {  // 주문관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='woman' >여성의류</option>'");
	        $('#tType').append("<option value='man' >남성의류</option>'");
	        $('#tType').append("<option value='common' >공통의류</option>'");
	        $('#tType').append("<option value='stuff' >패션잡화</option>'");
	    }else if ( type == 'book') {  // 주문관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='books' >도서</option>'");
	        $('#tType').append("<option value='hobby' >취미</option>'");
	        $('#tType').append("<option value='ticket' >티켓</option>'");
	        $('#tType').append("<option value='E-etc' >기타</option>'");
	    }else if ( type == 'beauty') {  // 주문관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='makeup' >메이크업</option>'");
	        $('#tType').append("<option value='skin' >스킨케어</option>'");
	        $('#tType').append("<option value='beautyequipment' >미용기기</option>'");
	        $('#tType').append("<option value='nail' >네일/페디</option>'");
	        $('#tType').append("<option value='hair' >헤어/바디</option>'");
	        $('#tType').append("<option value='perfume' >향수</option>'");
	    }else if ( type == 'etc') {  // 주문관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='car' >차량용품</option>'");
	        $('#tType').append("<option value='goods' >굿즈</option>'");
	        $('#tType').append("<option value='food' >식품</option>'");
	        $('#tType').append("<option value='furniture' >가구</option>'");
	    }else if ( type == 'big') {  // 주문관련
	    	$('#tType').css('visibility', 'hidden');
	    	$('#fType').css('visibility', 'hidden');
	    }else if( type == 'auctions'){
	    	$('#tType').append("<option value='auctions'>경매</option>'");
	    	$('#fType').css('visibility', 'hidden');
	    	$('#AuctionStartPrice').show();
	    	$("#price").hide() //활성화

	    }
	    
	   
	    document.getElementById("tType").style.display = "";
	}
	function chnQnaTypes(type,select) {   
	    if ($.trim(select) != "") {
	        $('#select1').val(type);
	        $('#tType').val(select);
	    } 
	    $('#fType').empty();
	    $('#fType').css('visibility', 'visible');
	    $('#fType').append("<option value='mid' >소분류</option>'");
	    //health목록
	    if(type=='health'){
	    	
	    	$('#fType').append("<option value='health-Cloth' >헬스의류</option>'");
	    	$('#fType').append("<option value='health-Supplies' >헬스용품</option>'");
	    	$('#fType').append("<option value='yoga-Cloth' >요가의류</option>'");
	    	$('#fType').append("<option value='yoga-Supplies' >요가용품</option>'");
	    }else if(type=='ballsport'){
	    	$('#fType').append("<option value='soccer' >축구용품</option>'");
	    	$('#fType').append("<option value='basketball' >농구용품</option>'");
	    	$('#fType').append("<option value='baseball' >야구용품</option>'");
	    	$('#fType').append("<option value='uniform' >각종 유니폼</option>'");
	    }else if(type=='fising'){
	    	$('#fType').append("<option value='fishing-Equipment' >낚시장비</option>'");
	    	$('#fType').append("<option value='cooking-Supplies' >취사용품</option>'");
	    	$('#fType').append("<option value='camping-Outdoor' >캠핑야외용품</option>'");
	    	$('#fType').append("<option value='camping-Convenience' >캠핑편의용품</option>'");
	    	$('#fType').append("<option value='tent' >텐트/그늘막</option>'");
	    }else if(type=='bowilng'){
	    	$('#fType').append("<option value='bowilng-Equipment' >볼링장비</option>'");
	    	$('#fType').append("<option value='badminton-Equipment' >배드민턴 장비</option>'");
	    	$('#fType').append("<option value='tennis-Equipment' >테니스 장비</option>'");
	    	$('#fType').append("<option value='bowilng-Assistance' >볼링 보조용품</option>'");
	    	$('#fType').append("<option value='badminton-Assistance' >배드민턴 보조용품</option>'");
	    	$('#fType').append("<option value='tennis-Assistance' >테니스 보조용품</option>'");
	    }else if(type=='ski'){
	    	$('#fType').append("<option value='skiBoard' >스키/스노우보드</option>'");
	    	$('#fType').append("<option value='ski-Cloth' >스키의류/잡화</option>'");
	    	$('#fType').append("<option value='ski-Supplies' >스키용품</option>'");
	    }else if(type=='bicycle'){
	    	$('#fType').append("<option value='bicycle1' >클래식/픽시</option>'");
	    	$('#fType').append("<option value='bicycle2' >MTB/산악</option>'");
	    	$('#fType').append("<option value='bicycle3' >로드/BMX</option>'");
	    	$('#fType').append("<option value='bicycle4' >기타자전거</option>'");
	    	$('#fType').append("<option value='bicycle-Supplies' >자전거 용품</option>'");
	    	$('#fType').append("<option value='bicycle-Part' >자전거 부품</option>'");
	    }else if(type=='Mountain'){
	    	$('#fType').append("<option value='w-Mountain' >여성 등산복</option>'");
	    	$('#fType').append("<option value='m-Mountain' >남성 등산복</option>'");
	    	$('#fType').append("<option value='hikingBoots' >등산화</option>'");
	    	$('#fType').append("<option value='hiking-Supplies' >등산용품</option>'");
	    	$('#fType').append("<option value='rockClimbing' >암벽/클라이밍장비</option>'");
	    	$('#fType').append("<option value='Backpack' >배낭</option>'");
	    }else if(type=='swim'){
	    	$('#fType').append("<option value='m-Swimwear' >남성수영복</option>'");
	    	$('#fType').append("<option value='w-Swimwear' >여성수영복/래쉬가드</option>'");
	    	$('#fType').append("<option value='swim-Supplies' >수영용품</option>'");
	    }
	    
	    //digital목록
	    else if(type=='mobile'){
	    	$('#fType').append("<option value='smartphone' >스마트폰</option>'");
	    	$('#fType').append("<option value='case' >케이스</option>'");
	    	$('#fType').append("<option value='film' >보호필름/액세서리</option>'");
	    	$('#fType').append("<option value='battery' >배터리/충전기</option>'");
	    	$('#fType').append("<option value='cable' >케이블/거치대/주변기기</option>'");
	    } else if(type=='appliance'){
	    	$('#fType').append("<option value='small' >소형가전(다리미/밥솥등)</option>'");
	    	$('#fType').append("<option value='big' >대형가전(냉장고/세탁기등)</option>'");
	    	$('#fType').append("<option value='TV' >TV</option>'");
	    	$('#fType').append("<option value='outside ' >기타가전제품</option>'");
	    }else if(type=='game'){
	    	$('#fType').append("<option value='pcGame' >PC게임</option>'");
	    	$('#fType').append("<option value='nintendo' >닌텐도/will</option>'");
	    	$('#fType').append("<option value='xbox' >XBOX/플레이 스테이션</option>'");
	    	$('#fType').append("<option value='game-Title' >게임/타이틀</option>'");
	    }else if(type=='pc'){
	    	$('#fType').append("<option value='desktop' >데스크탑/본체</option>'");
	    	$('#fType').append("<option value='keyboard' >키보드/마우스</option>'");
	    	$('#fType').append("<option value='moniter' >모니터</option>'");
	    	$('#fType').append("<option value='printer' >복합/프린터</option>'");
	    	$('#fType').append("<option value='pc-Supplies' >각종 PC용품</option>'");
	    }else if(type=='notebook'){
	    	$('#fType').append("<option value='netbook' >노트북/넷북</option>'");
	    	$('#fType').append("<option value='tablet' >테블릿</option>'");
	    	$('#fType').append("<option value='note-Accessories' >노트북 악세서리</option>'");
	    	$('#fType').append("<option value='note-Periphery ' >노트북 주변기기</option>'");
	    }else if(type=='camera'){
	    	$('#fType').append("<option value='camera1' >DSLR/미러리스</option>'");
	    	$('#fType').append("<option value='camera2' >필름카메라</option>'");
	    	$('#fType').append("<option value='camera3' >기타카메라</option>'");
	    	$('#fType').append("<option value='lens' >렌즈/필터</option>'");
	    	$('#fType').append("<option value='camera-Auxiliary ' >카메라 보조용품</option>'");
	    }
	    
	    //cloth목록
	    else if(type=='woman'){
	    	$('#fType').append("<option value='w-Outer' >아우터</option>'");
	    	$('#fType').append("<option value='skirt' >치마/스커트</option>'");
	    	$('#fType').append("<option value='w-Jeans' >바지</option>'");
	    	$('#fType').append("<option value='onepice' >원피스</option>'");
	    	$('#fType').append("<option value='w-Short' >반팔티</option>'");
	    	$('#fType').append("<option value='w-Training' >트레이닝</option>'");
	    	$('#fType').append("<option value='blouse' >블라우스</option>'");
	    	$('#fType').append("<option value='w-Knit' >니트/스웨터</option>'");
	    	$('#fType').append("<option value='w-Mantoman' >맨투맨/후드</option>'");
	    }else if(type=='man'){
	    	$('#fType').append("<option value='m-Outer' >아우터</option>'");
	    	$('#fType').append("<option value='shirts' >셔츠,남방</option>'");
	    	$('#fType').append("<option value='m-Jeans' >바지</option>'");
	    	$('#fType').append("<option value='m-short' >반팔티</option>'");
	    	$('#fType').append("<option value='m-Training' >트레이닝</option>'");
	    	$('#fType').append("<option value='m-Knit' >니트/스웨터</option>'");
	    	$('#fType').append("<option value='m-Mantoman' >맨투맨/후드</option>'");
	    }else if(type=='common'){
	    	$('#fType').append("<option value='c-Outer' >아우터</option>'");
	    	$('#fType').append("<option value='c-Shirts' >셔츠,남방</option>'");
	    	$('#fType').append("<option value='c-Jeans' >바지</option>'");
	    	$('#fType').append("<option value='c-Short' >반팔티</option>'");
	    	$('#fType').append("<option value='c-Training' >트레이닝</option>'");
	    	$('#fType').append("<option value='c-Knit' >니트/스웨터</option>'");
	    	$('#fType').append("<option value='c-Mantoman' >맨투맨/후드</option>'");
	    }else if(type=='stuff'){
	    	$('#fType').append("<option value='bag' >가방</option>'");
	    	$('#fType').append("<option value='shose' >신발</option>'");
	    	$('#fType').append("<option value='clock' >시계</option>'");
	    	$('#fType').append("<option value='glasses' >안경</option>'");
	    	$('#fType').append("<option value='jewelry' >주얼리/액세서리</option>'");
	    	$('#fType').append("<option value='cap' >모자</option>'");
	    	$('#fType').append("<option value='wallet' >지갑</option>'");
	    	$('#fType').append("<option value='cloth-Etc' >기타</option>'");
	    }
	    
	    //book 관련
	    else if(type=='books'){
	    	$('#fType').append("<option value='Learning' >학습/자습/참고서</option>'");
	    	$('#fType').append("<option value='cartoon' >만화책</option>'");
	    	$('#fType').append("<option value='refinement' >교양/시사/잡지</option>'");
	    	$('#fType').append("<option value='poem' >시/소설</option>'");
	    	$('#fType').append("<option value='essay' >수필</option>'");
	    	$('#fType').append("<option value='kidBook' >아동도서</option>'");
	    	$('#fType').append("<option value='travle' >여행/취미/건강</option>'");
	    }else if(type=='hobby'){
	    	$('#fType').append("<option value='Figure' >피규어</option>'");
	    	$('#fType').append("<option value='lego' >레고/블럭</option>'");
	    	$('#fType').append("<option value='boardGame' >보드게임/다트</option>'");
	    	$('#fType').append("<option value='model' >프라모델/건담</option>'");
	    	$('#fType').append("<option value='dron' >드론/Rc카</option>'");
	    	$('#fType').append("<option value='fancy' >팬시</option>'");
	    }else if(type=='ticket'){
	    	$('#fType').append("<option value='movieTicket' >영화티켓/관람권</option>'");
	    	$('#fType').append("<option value='concert' >콘서트</option>'");
	    	$('#fType').append("<option value='Musical' >뮤지컬/연극</option>'");
	    	$('#fType').append("<option value='sport-Ticket' >스포츠</option>'");
	    	$('#fType').append("<option value='zoo' >테마파크/놀이공원/동물원</option>'");
	    	$('#fType').append("<option value='airplane' >항공권</option>'");
	    	$('#fType').append("<option value='accommodation' >여행/숙박/렌트</option>'");
	    }else if(type=='E-etc'){
	    	$('#fType').append("<option value='collection' >수집품/희귀품</option>'");
	    	$('#fType').append("<option value='antiquities' >골동품</option>'");
	    	$('#fType').append("<option value='gift' >기프티콘</option>'");
	    	$('#fType').append("<option value='culture' >문화/도서상품권</option>'");
	    	$('#fType').append("<option value='department ' >백화점상품권</option>'");
	    	$('#fType').append("<option value='eatVoucher ' >외식상품권/option>'");
	    	$('#fType').append("<option value='instrument' >악기</option>'");
	    	$('#fType').append("<option value='handicrafts' >수공예품</option>'");
	    }
	    
	    //beauty 목록
	    else if(type=='makeup'){
	    	$('#fType').append("<option value='rip' >립스틱/틴트/립밤</option>'");
	    	$('#fType').append("<option value='eye' >아이섀도우/라이너/브로우/마스카라</option>'");
	    	$('#fType').append("<option value='foundation' >파운데이션/파우더/팩트</option>'");
	    	$('#fType').append("<option value='concealer' >프라이머/컨실러</option>'");
	    	$('#fType').append("<option value='bbcream' >BB크림</option>'");
	    	$('#fType').append("<option value='make-Etc' >기타</option>'");
	    }else if(type=='skin'){
	    	$('#fType').append("<option value='esense' >에센스/크림</option>'");
	    	$('#fType').append("<option value='skin' >스킨/토너/미스트</option>'");
	    	$('#fType').append("<option value='maskPack' >팩/마스크</option>'");
	    	$('#fType').append("<option value='cleansing' >클렌징/로션</option>'");
	    }else if(type=='beautyequipment'){
	    	$('#fType').append("<option value='skincare' >피부케어기기</option>'");
	    	$('#fType').append("<option value='beauty-appliances' >미용가전</option>'");
	    	$('#fType').append("<option value='beauty-Props' >뷰티소품</option>'");
	    	$('#fType').append("<option value='pouch' >파우치/정리함</option>'");
	    }else if(type=='nail'){
	    	$('#fType').append("<option value='nailArt' >네일아트</option>'");
	    	$('#fType').append("<option value='maniCure' >매니큐어/페디큐어</option>'");
	    	$('#fType').append("<option value='nailCare' >네일케어도구</option>'");
	    }else if(type=='hair'){
	    	$('#fType').append("<option value='styling' >스타일링</option>'");
	    	$('#fType').append("<option value='bodyCleanser' >바디클랜져/로션</option>'");
	    	$('#fType').append("<option value='hairEsense' >에센스/트리트먼트</option>'");
	    	$('#fType').append("<option value='sampoo' >샴푸/린스</option>'");
	    	$('#fType').append("<option value='Dyeing' >염색</option>'");
	    }else if(type=='perfume'){
	    	$('#fType').append("<option value='w-Perfume' >여성향수</option>'");
	    	$('#fType').append("<option value='m-Perfume' >남성향수</option>'");
	    	$('#fType').append("<option value='common-Perfume' >공용향수/아로마/디퓨저</option>'");
	    }
	    
	    //etc 목록
	    else if(type=='car'){
	    	$('#fType').append("<option value='car-part' >차량부품</option>'");
	    	$('#fType').append("<option value='car-Tuning' >튜닝용품</option>'");
	    	$('#fType').append("<option value='industry' >산업용품/네비/블랙박스</option>'");
	    }else if(type=='goods'){
	    	$('#fType').append("<option value='boyGroup' >보이그룹</option>'");
	    	$('#fType').append("<option value='girlGroup' >걸그룹</option>'");
	    	$('#fType').append("<option value='solo' >솔로가수(남,여)</option>'");
	    	$('#fType').append("<option value='actor' >배우(남,여)</option>'");
	    }else if(type=='food'){
	    	$('#fType').append("<option value='healthFood' >건강식품</option>'");
	    	$('#fType').append("<option value='tea' >차,음료,과자</option>'");
	    	$('#fType').append("<option value='agricultural ' >농수산물</option>'");
	    }else if(type=='furniture'){
	    	$('#fType').append("<option value='interior' >인테리어 소품</option>'");
	    	$('#fType').append("<option value='life' >생활가구</option>'");
	    	$('#fType').append("<option value='office' >사무용품</option>'");
	    }
	   
	    if($.trim(type) != "") {
	        $('#select2').val(type);
	        $('#fType').val(select);
	    }
	    
	    document.getElementById("fType").style.display = "";
	}
	
