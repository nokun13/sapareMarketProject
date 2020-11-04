/**
 * 
 */
	//선택한 이미지 img요소에 보이기
	 window.onload = function() {

	function onClick() {
        document.querySelector('#map').style.visibility ='visible';
        document.querySelector('#back').style.visibility ='visible';
        document.querySelector('#in').style.visibility ='visible';
        document.querySelector('#close').style.visibility ='visible';
        
    }   
    function offClick() {
        document.querySelector('#map').style.visibility ='hidden';
        document.querySelector('#back').style.visibility ='hidden';
        document.querySelector('#in').style.visibility ='hidden';
        document.querySelector('#close').style.visibility ='hidden';

    }
 
    document.getElementById('map-btn').addEventListener('click', onClick);
    document.querySelector('#in').addEventListener('click', offClick);
    document.querySelector('#close').addEventListener('click', offClick);
   
};

  	$(document).ready(function(){
  	  $('#sell').click(function(){
 		   if($('#ITEMNAME').val().length==0){
 		   alert('제목을 입력하세요.');
 		   $('#ITEMNAME').focus();
 		   return false;
 	      }
 		  if($('#select1').val()=='big'){
 	 		   alert('대분류를 설정해주세요.');
 	 		   $('#select1').focus();
 	 		   return false;
 		  }
 		 if($('#tType').val()=='mid'){
	 		   alert('중분류를 설정해주세요.');
	 		   $('#tType').focus();
	 		   return false;
		  }
 		if($('#fType').val()=='so' && $('#fType').val()==''){
	 		   alert('소분류를 설정해주세요.');
	 		   $('#fType').focus();
	 		   return false;
		  }
 		if($('#map_info').val()==''){
	 		   alert('지역을 선택해주세요.');
	 		   $('#map_info').focus();
	 		   return false;
 		}
 		if($('#ITEMPRICE').val()=='' && $('#select1').val()!='경매'){
	 		   alert('가격을 설정하세요.');
	 		   $('#ITEMPRICE').focus();
	 		   return false;
		}
 		if($('#auction-price').val()==''&& $('#select1').val()=='경매'){
	 		   alert('경매 가격을 설정하세요.');
	 		   $('#auction-price').focus();
	 		   return false;
		}
 		if($('#acution-time').val()=='AuctionTime' && $('#select1').val()=='경매'){
	 		   alert('경매시간을 설정하세요.');
	 		   $('#acution-time').focus();
	 		   return false;
 		}
 		 alert('판매등록되었습니다.');
 		 $('#frm').submit();
 	   }) 
  	
  	   $('#cancel').click(function(){
  		   alert("취소되었습니다.");
  	   })
  	
  	   $('#close').click(function(){
  		   $('#map_info').empty();
  	   })
  	   
  	   
  	var markers = [];
  	
  	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.185268, 126.901390), // 지도의 중심좌표
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
         /*   $("#map_info").html(result[0].address.address_name);*/
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
   
    	$("#map_info").html(result[i].address_name);
   
}
  	});
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
	      $('#ITEMIMAGEPATH').attr('src', e.target.result);
	      };
	   });//end change
	   
	

   
   //다중카테고리
   $(function(){
	    
	    // 질문유형을 선택한다.
	    chnQnaType('big');
	});

	function chnQnaType(type,select,object) {
		
	    $('#tType').empty();
	    
	    $('#tType').css('visibility', 'visible');
	    $('#AuctionStartPrice').hide();
	    $("#price").show()
	    
	    if(type == '스포츠/레저') { // 상품관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='헬스/요가' >헬스/요가</option>'");
	        $('#tType').append("<option value='축구/야구/농구' >축구/야구/농구</option>'");
	        $('#tType').append("<option value='낚시/캠핑' >낚시/캠핑</option>'");
	        $('#tType').append("<option value='볼링/테니스/배드민턴' >볼링/테니스/배드민턴</option>'");
	        $('#tType').append("<option value='스키/스노우보드' >스키/스노우보드</option>'");
	        $('#tType').append("<option value='자건거/MTB' >자건거/MTB</option>'");
	        $('#tType').append("<option value='등산' >등산</option>'");
	        $('#tType').append("<option value='수영' >수영</option>'");	       
	    } else if (type == '디지털/가전') {  // 일반관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='모바일' >모바일</option>'");
	        $('#tType').append("<option value='가전제품' >가전제품</option>'");
	        $('#tType').append("<option value='게임' >게임</option>'");
	        $('#tType').append("<option value='PC/모니터' >PC/모니터</option>'");
	        $('#tType').append("<option value='노트북/넷북' >노트북/넷북</option>'");
	        $('#tType').append("<option value='카메라' >카메라</option>'");
	    } else if ( type == '의류') {  // 주문관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='여성의류' >여성의류</option>'");
	        $('#tType').append("<option value='남성의류' >남성의류</option>'");
	        $('#tType').append("<option value='공통의류' >공통의류</option>'");
	        $('#tType').append("<option value='패션잡화' >패션잡화</option>'");
	    }else if ( type == '도서/티켓/취미') {  // 주문관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='도서' >도서</option>'");
	        $('#tType').append("<option value='취미' >취미</option>'");
	        $('#tType').append("<option value='티켓' >티켓</option>'");
	        $('#tType').append("<option value='도서기타' >기타</option>'");
	    }else if ( type == '뷰티미용') {  // 주문관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='메이크업' >메이크업</option>'");
	        $('#tType').append("<option value='스킨케어' >스킨케어</option>'");
	        $('#tType').append("<option value='미용기기' >미용기기</option>'");
	        $('#tType').append("<option value='네일/페디' >네일/페디</option>'");
	        $('#tType').append("<option value='헤어/바디' >헤어/바디</option>'");
	        $('#tType').append("<option value='향수' >향수</option>'");
	    }else if ( type == '기타') {  // 주문관련
	    	$('#tType').append("<option value='mid' >중분류</option>'");
	        $('#tType').append("<option value='차량용품' >차량용품</option>'");
	        $('#tType').append("<option value='굿즈' >굿즈</option>'");
	        $('#tType').append("<option value='식품' >식품</option>'");
	        $('#tType').append("<option value='가구' >가구</option>'");
	    }else if ( type == 'big') {  // 주문관련
	    	$('#tType').css('visibility', 'hidden');
	    	$('#fType').css('visibility', 'hidden');
	    }else if( type == '경매'){
	    	$('#tType').append("<option value='경매'>경매</option>'");
	    	$('#fType').css('visibility', 'hidden');
	    	$('#AuctionStartPrice').show();
	    	$("#price").hide() //활성화
	    }
	    
	   
	    document.getElementById("tType").style.display = "";
	}
	function chnQnaTypes(type,select,object) {   
	    if ($.trim(select) != "") {
	        $('#select1').val(type);
	        $('#fType').val(select);
	    } 
	    $('#fType').empty();
	    $('#fType').css('visibility', 'visible');
	  
	    //health목록
	    if(type=='헬스/요가'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='헬스의류' >헬스의류</option>'");
	    	$('#fType').append("<option value='헬스용품' >헬스용품</option>'");
	    	$('#fType').append("<option value='요가의류' >요가의류</option>'");
	    	$('#fType').append("<option value='요가용품' >요가용품</option>'");
	    }else if(type=='축구/야구/농구'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='축구용품' >축구용품</option>'");
	    	$('#fType').append("<option value='농구용품' >농구용품</option>'");
	    	$('#fType').append("<option value='야구용품' >야구용품</option>'");
	    	$('#fType').append("<option value='각종 유니폼' >각종 유니폼</option>'");
	    }else if(type=='낚시/캠핑'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='낚시장비' >낚시장비</option>'");
	    	$('#fType').append("<option value='취사용품' >취사용품</option>'");
	    	$('#fType').append("<option value='캠핑야외용품' >캠핑야외용품</option>'");
	    	$('#fType').append("<option value='캠핑편의용품' >캠핑편의용품</option>'");
	    	$('#fType').append("<option value='텐트/그늘막' >텐트/그늘막</option>'");
	    }else if(type=='볼링/테니스/배드민턴'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='볼링장비' >볼링장비</option>'");
	    	$('#fType').append("<option value='배드민턴 장비' >배드민턴 장비</option>'");
	    	$('#fType').append("<option value='테니스 장비' >테니스 장비</option>'");
	    	$('#fType').append("<option value='볼링 보조용품' >볼링 보조용품</option>'");
	    	$('#fType').append("<option value='배드민턴 보조용품' >배드민턴 보조용품</option>'");
	    	$('#fType').append("<option value='테니스 보조용품' >테니스 보조용품</option>'");
	    }else if(type=='스키/스노우보드'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='스키/스노우보드' >스키/스노우보드</option>'");
	    	$('#fType').append("<option value='스키의류/잡화' >스키의류/잡화</option>'");
	    	$('#fType').append("<option value='스키용품' >스키용품</option>'");
	    }else if(type=='자전거/MTB'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='클래식/픽시' >클래식/픽시</option>'");
	    	$('#fType').append("<option value='MTB/산악' >MTB/산악</option>'");
	    	$('#fType').append("<option value='로드/BMX' >로드/BMX</option>'");
	    	$('#fType').append("<option value='기타자전거' >기타자전거</option>'");
	    	$('#fType').append("<option value='자전거 용품' >자전거 용품</option>'");
	    	$('#fType').append("<option value='자전거 부품' >자전거 부품</option>'");
	    }else if(type=='등산'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='여성 등산복' >여성 등산복</option>'");
	    	$('#fType').append("<option value='남성 등산복' >남성 등산복</option>'");
	    	$('#fType').append("<option value='등산화' >등산화</option>'");
	    	$('#fType').append("<option value='등산용품' >등산용품</option>'");
	    	$('#fType').append("<option value='암벽/클라이밍장비' >암벽/클라이밍장비</option>'");
	    	$('#fType').append("<option value='배낭' >배낭</option>'");
	    }else if(type=='수영'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='남성수영복' >남성수영복</option>'");
	    	$('#fType').append("<option value='여성수영복/래쉬가드' >여성수영복/래쉬가드</option>'");
	    	$('#fType').append("<option value='수영용품' >수영용품</option>'");
	    }
	    
	    //digital목록
	    else if(type=='모바일'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='스마트폰' >스마트폰</option>'");
	    	$('#fType').append("<option value='케이스' >케이스</option>'");
	    	$('#fType').append("<option value='보호필름/액세서리' >보호필름/액세서리</option>'");
	    	$('#fType').append("<option value='배터리/충전기' >배터리/충전기</option>'");
	    	$('#fType').append("<option value='케이블/거치대/주변기기' >케이블/거치대/주변기기</option>'");
	    } else if(type=='가전제품'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='소형가전(다리미/밥솥등)' >소형가전(다리미/밥솥등)</option>'");
	    	$('#fType').append("<option value='대형가전(냉장고/세탁기등)' >대형가전(냉장고/세탁기등)</option>'");
	    	$('#fType').append("<option value='TV' >TV</option>'");
	    	$('#fType').append("<option value='기타가전제품 ' >기타가전제품</option>'");
	    }else if(type=='게임'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='PC게임' >PC게임</option>'");
	    	$('#fType').append("<option value='닌텐도/will' >닌텐도/will</option>'");
	    	$('#fType').append("<option value='XBOX/플레이 스테이션' >XBOX/플레이 스테이션</option>'");
	    	$('#fType').append("<option value='게임/타이틀' >게임/타이틀</option>'");
	    }else if(type=='PC/모니터'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='데스크탑/본체' >데스크탑/본체</option>'");
	    	$('#fType').append("<option value='키보드/마우스' >키보드/마우스</option>'");
	    	$('#fType').append("<option value='모니터' >모니터</option>'");
	    	$('#fType').append("<option value='복합/프린터' >복합/프린터</option>'");
	    	$('#fType').append("<option value='각종 PC용품' >각종 PC용품</option>'");
	    }else if(type=='노트북/넷북'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='노트북/넷북' >노트북/넷북</option>'");
	    	$('#fType').append("<option value='테블릿' >테블릿</option>'");
	    	$('#fType').append("<option value='노트북 악세서리' >노트북 악세서리</option>'");
	    	$('#fType').append("<option value='노트북 주변기기' >노트북 주변기기</option>'");
	    }else if(type=='카메라'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='DSLR/미러리스' >DSLR/미러리스</option>'");
	    	$('#fType').append("<option value='필름카메라' >필름카메라</option>'");
	    	$('#fType').append("<option value='기타카메라' >기타카메라</option>'");
	    	$('#fType').append("<option value='렌즈/필터' >렌즈/필터</option>'");
	    	$('#fType').append("<option value='카메라 보조용품 ' >카메라 보조용품</option>'");
	    }
	    
	    //cloth목록
	    else if(type=='여성의류'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='아우터' >아우터</option>'");
	    	$('#fType').append("<option value='치마/스커트' >치마/스커트</option>'");
	    	$('#fType').append("<option value='바지' >바지</option>'");
	    	$('#fType').append("<option value='원피스' >원피스</option>'");
	    	$('#fType').append("<option value='반팔티' >반팔티</option>'");
	    	$('#fType').append("<option value='트레이닝' >트레이닝</option>'");
	    	$('#fType').append("<option value='블라우스' >블라우스</option>'");
	    	$('#fType').append("<option value='니트/스웨터' >니트/스웨터</option>'");
	    	$('#fType').append("<option value='맨투맨/후드' >맨투맨/후드</option>'");
	    }else if(type=='남성의류'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='아우터' >아우터</option>'");
	    	$('#fType').append("<option value='셔츠,남방' >셔츠,남방</option>'");
	    	$('#fType').append("<option value='바지' >바지</option>'");
	    	$('#fType').append("<option value='반팔티' >반팔티</option>'");
	    	$('#fType').append("<option value='트레이닝' >트레이닝</option>'");
	    	$('#fType').append("<option value='니트/스웨터' >니트/스웨터</option>'");
	    	$('#fType').append("<option value='맨투맨/후드' >맨투맨/후드</option>'");
	    }else if(type=='공통의류'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='아우터' >아우터</option>'");
	    	$('#fType').append("<option value='셔츠,남방' >셔츠,남방</option>'");
	    	$('#fType').append("<option value='바지' >바지</option>'");
	    	$('#fType').append("<option value='반팔티' >반팔티</option>'");
	    	$('#fType').append("<option value='트레이닝' >트레이닝</option>'");
	    	$('#fType').append("<option value='니트/스웨터' >니트/스웨터</option>'");
	    	$('#fType').append("<option value='맨투맨/후드' >맨투맨/후드</option>'");
	    }else if(type=='패션잡화'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='가방' >가방</option>'");
	    	$('#fType').append("<option value='신발' >신발</option>'");
	    	$('#fType').append("<option value='시계' >시계</option>'");
	    	$('#fType').append("<option value='안경' >안경</option>'");
	    	$('#fType').append("<option value='주얼리/액세서리' >주얼리/액세서리</option>'");
	    	$('#fType').append("<option value='모자' >모자</option>'");
	    	$('#fType').append("<option value='모자' >지갑</option>'");
	    	$('#fType').append("<option value='기타' >기타</option>'");
	    }
	    
	    //book 관련
	    else if(type=='도서'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='학습/자습/참고서' >학습/자습/참고서</option>'");
	    	$('#fType').append("<option value='만화책' >만화책</option>'");
	    	$('#fType').append("<option value='교양/시사/잡지' >교양/시사/잡지</option>'");
	    	$('#fType').append("<option value='시/소설' >시/소설</option>'");
	    	$('#fType').append("<option value='수필' >수필</option>'");
	    	$('#fType').append("<option value='아동도서' >아동도서</option>'");
	    	$('#fType').append("<option value='여행/취미/건강' >여행/취미/건강</option>'");
	    }else if(type=='취미'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='피규어' >피규어</option>'");
	    	$('#fType').append("<option value='레고/블럭' >레고/블럭</option>'");
	    	$('#fType').append("<option value='보드게임/다트' >보드게임/다트</option>'");
	    	$('#fType').append("<option value='프라모델/건담' >프라모델/건담</option>'");
	    	$('#fType').append("<option value='드론/Rc카' >드론/Rc카</option>'");
	    	$('#fType').append("<option value='팬시' >팬시</option>'");
	    }else if(type=='티켓'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='영화티켓/관람권' >영화티켓/관람권</option>'");
	    	$('#fType').append("<option value='콘서트' >콘서트</option>'");
	    	$('#fType').append("<option value='뮤지컬/연극' >뮤지컬/연극</option>'");
	    	$('#fType').append("<option value='스포츠' >스포츠</option>'");
	    	$('#fType').append("<option value='테마파크/놀이공원/동물원' >테마파크/놀이공원/동물원</option>'");
	    	$('#fType').append("<option value='항공권' >항공권</option>'");
	    	$('#fType').append("<option value='여행/숙박/렌트' >여행/숙박/렌트</option>'");
	    }else if(type=='도서기타'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='수집품/희귀품' >수집품/희귀품</option>'");
	    	$('#fType').append("<option value='골동품' >골동품</option>'");
	    	$('#fType').append("<option value='기프티콘' >기프티콘</option>'");
	    	$('#fType').append("<option value='문화/도서상품권' >문화/도서상품권</option>'");
	    	$('#fType').append("<option value='백화점상품권 ' >백화점상품권</option>'");
	    	$('#fType').append("<option value='외식상품권 ' >외식상품권/option>'");
	    	$('#fType').append("<option value='악기' >악기</option>'");
	    	$('#fType').append("<option value='수공예품' >수공예품</option>'");
	    }
	    
	    //beauty 목록
	    else if(type=='메이크업'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='립스틱/틴트/립밤' >립스틱/틴트/립밤</option>'");
	    	$('#fType').append("<option value='아이섀도우/라이너/브로우/마스카라' >아이섀도우/라이너/브로우/마스카라</option>'");
	    	$('#fType').append("<option value='파운데이션/파우더/팩트' >파운데이션/파우더/팩트</option>'");
	    	$('#fType').append("<option value='프라이머/컨실러' >프라이머/컨실러</option>'");
	    	$('#fType').append("<option value='BB크림' >BB크림</option>'");
	    	$('#fType').append("<option value='메이크업기타' >메이크업기타</option>'");
	    }else if(type=='스킨케어'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='에센스/크림' >에센스/크림</option>'");
	    	$('#fType').append("<option value='스킨/토너/미스트' >스킨/토너/미스트</option>'");
	    	$('#fType').append("<option value='팩/마스크' >팩/마스크</option>'");
	    	$('#fType').append("<option value='클렌징/로션' >클렌징/로션</option>'");
	    }else if(type=='미용기기'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='피부케어기기' >피부케어기기</option>'");
	    	$('#fType').append("<option value='미용가전' >미용가전</option>'");
	    	$('#fType').append("<option value='뷰티소품' >뷰티소품</option>'");
	    	$('#fType').append("<option value='파우치/정리함' >파우치/정리함</option>'");
	    }else if(type=='네일/페디'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='네일아트' >네일아트</option>'");
	    	$('#fType').append("<option value='매니큐어/페디큐어' >매니큐어/페디큐어</option>'");
	    	$('#fType').append("<option value='네일케어도구' >네일케어도구</option>'");
	    }else if(type=='헤어/바디'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='스타일링' >스타일링</option>'");
	    	$('#fType').append("<option value='바디클랜져/로션' >바디클랜져/로션</option>'");
	    	$('#fType').append("<option value='에센스/트리트먼트' >에센스/트리트먼트</option>'");
	    	$('#fType').append("<option value='샴푸/린스' >샴푸/린스</option>'");
	    	$('#fType').append("<option value='염색' >염색</option>'");
	    }else if(type=='향수'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='여성향수' >여성향수</option>'");
	    	$('#fType').append("<option value='남성향수' >남성향수</option>'");
	    	$('#fType').append("<option value='공용향수/아로마/디퓨저' >공용향수/아로마/디퓨저</option>'");
	    }
	    
	    //etc 목록
	    else if(type=='차량용품'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='차량부품' >차량부품</option>'");
	    	$('#fType').append("<option value='튜닝용품' >튜닝용품</option>'");
	    	$('#fType').append("<option value='산업용품/네비/블랙박스' >산업용품/네비/블랙박스</option>'");
	    }else if(type=='굿즈'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='보이그룹' >보이그룹</option>'");
	    	$('#fType').append("<option value='걸그룹' >걸그룹</option>'");
	    	$('#fType').append("<option value='솔로가수(남,여)' >솔로가수(남,여)</option>'");
	    	$('#fType').append("<option value='배우(남,여)' >배우(남,여)</option>'");
	    }else if(type=='식품'){
	    	$('#fType').append("<option value='so' >소분류</option>'");
	    	$('#fType').append("<option value='건강식품' >건강식품</option>'");
	    	$('#fType').append("<option value='차,음료,과자' >차,음료,과자</option>'");
	    	$('#fType').append("<option value='농수산물 ' >농수산물</option>'");
	    }else if(type=='가구'){
	    	$('#fType').append("<option value='so'>소분류</option>'");
	    	$('#fType').append("<option value='인테리어 소품' >인테리어 소품</option>'");
	    	$('#fType').append("<option value='생활가구' >생활가구</option>'");
	    	$('#fType').append("<option value='사무용품' >사무용품</option>'");
	    }else if(type=='mid'){
	    	$('#fType').css('visibility','hidden');
	    }    
	   
	    if($.trim(type) != "") {
	        $('#select2').val(type);
	        $('#fType').val(object);
	    }
	    
	    document.getElementById("fType").style.display = "";
	}
	
