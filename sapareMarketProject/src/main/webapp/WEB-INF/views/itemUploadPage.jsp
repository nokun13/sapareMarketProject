<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel='stylesheet' href='css/itemUploadPage.css'>
<meta charset="UTF-8">
<title>상품작성</title>
<!-- <link rel="stylesheet" href="css/itemUploadPage.css"> -->
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="all">
	<br>
	<div id='basic' class='container'>
		<h3>기본정보</h3> 
	</div>
	<hr/>
	<form id='frm' action="itemUpload.do" method='post' enctype="multipart/form-data">
		<input hidden="hidden" name="nickname" value="${member.memberName }" />
		<input hidden="hidden" name="itemId" value="${item.itemId }" />
		<div id="itemimage" class='container'>
			<span>상품이미지</span>
			<div id='text-center'>
					<label for='filepath'> <!-- <img id="img" style="width: 150px; height: 100px; border: 0px solid white;">-->
						<img src="image/defaultAD.png" class='img-circle'  id='ITEMIMAGEPATH' name='ITEMIMAGEPATH' style="width: 200px; height: 160px;object-fit: contain;" />  
						<input type="file" name='filepath' id='filepath' class='filepath'  style="display: none;" multiple />
					</label>
			</div>
		</div>
		<hr />
		<!-- 제목  -->
		<div id="title" style="font-weight: bold;" class='container'>
			<span>제목 <a style="color: red">*</a> </span>
			<input type="text" style="width: 500px; height: 50px" class="form-control" id='ITEMNAME' name='itemName' placeholder="제목을 입력하세요"  maxlength="15" value="${item.itemName }">
				<a style="color: red; font-size: x-small;">*15자이하로 입력해주세요</a>
		</div>
			
			
		<hr />
		<!-- about -->
		<div id="information" style="font-weight: bold;" class='container'>
			<span>설명</span> 
			<input type="text" style="width: 500px; height: 100px" class="form-control"  maxlength="100"  placeholder="설명을 입력하세요" id='ITEMABOUT' name='itemAbout' value="${item.itemAbout }">
				<a style="color: red; font-size: x-small;">*100자이하로 입력하세요</a>
		</div>
		<hr />

		
		<!-- 가격입력 -->
		<div id="price" class="container">
			<span>가격<a style="color: red">*</a></span> 
			<input type="number" maxlength="9" min="100" style="width: 500px; height: 60px" class="form-control" 
				placeholder="ex)10000~" id="ITEMPRICE" name='itemPrice' value="${item.itemPrice }" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" /> 
				<a style="color: red; font-size: x-small;">*100원이상의 단위로 입력해주세요.</a>
		</div>

		

		<!-- 경매시작가 -->
		<div id="AuctionStartPrice" style="font-weight: bold;" class='container'>
			경매 시작가 <input type="number" name="text" min="100" class="form-control"
				placeholder="ex)10000원부터" style="width: 500px;" id='auction-price'>

		<hr />
			<!-- 경매시간  -->
			<div id="Auction" class='container'>
				<span style="font-weight: bold;">경매시간</span> <select
					class="form-control" style="width: 500px;" id='acution-time'>
					<option value="AuctionTime">경매시간</option>
					<option value="time-1">1시간</option>
					<option value="time-2">2시간</option>
					<option value="time-6">6시간</option>
					<option value="time-12">12시간</option>
					<option value="time-24">24시간</option>
				</select>
			</div>
		</div>
		<hr />
		
	
		<div id="row" class='container'>
			<span>카테고리 <a style="color: red">*</a></span>
			
				<select class="form-control" id="select1"
					onChange="chnQnaType(this.value)" name='itemBigCat'>
						<option value="big">대분류</option>
						<option value="경매">경매</option>
						<option value="스포츠/레저">스포츠/레저</option>
						<option value="디지털/가전">디지털/가전</option>
						<option value="의류">의류</option>
						<option value="도서/티켓/취미">도서/티켓/취미</option>
						<option value="뷰티미용">뷰티미용</option>
						<option value="기타">기타</option>
					</select> 
					<select class="form-control" id="tType" name='itemMidCat'onchange="chnQnaTypes(this.value)"></select> 
					<select class="form-control" id="fType" name='itemSmallCat'></select>
				
		</div>
		<hr />


		<div id="row" class='container'>
			<span>지역선택<a style="color: red">*</a></span> 
		<textarea id='map_info' name='itemCity' placeholder="지역" READONLY ></textarea>
		<input type='button' class="btn btn-success" id='map-btn' value="지역선택" >
		<!-- <input type="text"  id='information' value="주소"> -->
		</div>
</form>
		

<div id='back'>
		<div class="map_wrap">
   			 <div id="menu_wrap" class="bg_white">
       			 <div class="option">
           			 <div>
             		    <form onsubmit="searchPlaces(); return false;  ">
                 		   키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
              	      		<button type="submit" >검색하기</button>
               		    </form> 
            		</div>
       			 </div>
        	<hr/>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
		<div class='container'><input type='button' id='in' value="확인" class="btn btn-primary" ></div>
		<div class='container'><input type='button' class='btn btn-secondary' id='close' value='X'></div>
</div>
		
		<div id="map">
			 <div class="hAddr">
       		 <span class="title">주소정보</span>
      		 <span id="centerAddr"></span>
    		</div>
		</div>  
		 <hr />
	</div>
	
	<div id="click" class='container' style="margin-bottom: 30px;">
		<a href="mainPage.do"><input type="button" value="취소" id="cancel" class="btn btn-secondary"></a> 
		<c:if test="${item.itemName != null}">
			<input type="button" value="수정하기" id="update" class="btn btn-primary">
		</c:if>
		<c:if test="${item.itemName == null }">
			<input type="button" value="판매하기" id="sell" class="btn btn-primary">
		</c:if>
	</div> 
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="js/itemUploadPage.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ecc21974f7a9cd9fe27a0dd05775674a&libraries=services"></script>
</html>