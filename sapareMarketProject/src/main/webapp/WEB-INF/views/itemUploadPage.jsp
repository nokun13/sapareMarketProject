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
<link rel='stylesheet' href='css/itemUploadPage.css'></style>
<meta charset="UTF-8">
<title>상품작성</title>
<!-- <link rel="stylesheet" href="css/itemUploadPage.css"> -->
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="all" class='container'>
		<div id="itemimage" class='container'>
			<span>상품이미지</span>
			<div id='text-center'>
				<form id="form1" enctype="multipart/form-data">
					<label for='filepath'> <!-- <img id="img" style="width: 150px; height: 100px; border: 0px solid white;">-->
						<img src="image/plus.jpg" class='img-circle'  id='img'
						style="width: 200px; height: 160px; object-fit: cover;" /> 
						<input type="file" name='filepath' id='filepath' class='filepath'
						style="display: none;" multiple />
					</label>
					<div class='container'></div>
				</form>
			</div>
		</div>
		<hr />


		<div id="title" style="font-weight: bold;" class='container'>
			<span>제목 <a style="color: red">*</a> </span>
			<input type="text"
				style="width: 500px; height: 50px" class="form-control" id='item-title'
				placeholder="제목을 입력하세요"  maxlength="15">
				<a style="color: red; font-size: x-small;">*15자이하로 입력해주세요</a>
		</div>
			
		<hr />
		<div id="information" style="font-weight: bold;" class='container'>
			<span>설명</span> 
			<input type="text" style="width: 500px; height: 100px" class="form-control"  maxlength="100" 
				placeholder="설명을 입력하세요">
				<a style="color: red; font-size: x-small;">*100자이하로 입력하세요</a>
		</div>
		<hr />

		
		<div id="row" class='container'>
			<span>카테고리 <a style="color: red">*</a></span>
			<tr>
				<td><select class="form-control" id="select1"
					onChange="chnQnaType(this.value)">
						<option value="big">대분류</option>
						<option value="auctions">경매</option>
						<option value="sport">스포츠/레저</option>
						<option value="digital">디지털/가전</option>
						<option value="cloth">의류</option>
						<option value="book">도서/티켓/취미</option>
						<option value="beauty">뷰티미용</option>
						<option value="etc">기타</option>
					</select> 
					<select class="form-control" id="tType" onchange="chnQnaTypes(this.value)"></select> 
					<select class="form-control" id="fType"></select>
				</td>
			</tr>
		</div>
		<hr />


		<div id="row" class='container'>
			<span>지역선택<a style="color: red">*</a></span> 
		<textarea id='map_info' READONLY ></textarea>
		<input type='button' class="btn btn-success" id='map-btn' value="지역선택">
		<!-- <input type="text"  id='information' value="주소"> -->
		</div>
			
<!-- 	 	<div class="map_wrap">
   			 <div id="menu_wrap" class="bg_white">
       			 <div class="option">
           			 <div>
             		   <form onsubmit="searchPlaces(); return false;  ">
                 		   키워드 : 
                 		   <input type="text" value="이태원 맛집" id="keyword" size="15"> 
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
		
		
		<div id="map">
			 <div class="hAddr">
       		 <span class="title">주소정보</span>
      		 <span id="centerAddr"></span>
    	</div>
		</div>   -->
		
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
</div>
		
		<div id="map">
			 <div class="hAddr">
       		 <span class="title">주소정보</span>
      		 <span id="centerAddr"></span>
    	</div>
		</div>  
		 <hr />
		 
		 
		<!-- 가격입력 -->
		<div id="price" class="container">
			<span>가격<a style="color: red">*</a></span> 
			<input type="number" min="100" style="width: 500px; height: 60px" class="form-control" 
				placeholder="ex)10000~"> 
				<a style="color: red; font-size: x-small;">*100원이상의 단위로 입력해주세요.</a>
		</div>


		

		<!-- 경매시작가 -->
		<div id="AuctionStartPrice" style="font-weight: bold;"
			class='container'>
			경매 시작가 <input type="number" name="text" min="100" class="form-control"
				placeholder="ex)10000원부터" style="width: 500px;">

		<hr />
			<!-- 경매시간  -->
			<div id="Auction" class='container'>
				<span style="font-weight: bold;">경매시간</span> <select
					class="form-control" style="width: 500px;">
					<option value="AuctionTime">경매시간</option>
					<option value="AuctionTime">1시간</option>
					<option value="AuctionTime">2시간</option>
					<option value="AuctionTime">6시간</option>
					<option value="AuctionTime">12시간</option>
					<option value="AuctionTime">24시간</option>
				</select>
			</div>
		</div>
		<hr />
		<div id="click" class='container'>
			<a href="mainPage.do"><input type="button" value="취소" id="cancel"
				class="btn btn-secondary"></a> <a href=""><input
				type="button" value="판매하기" id="sell" class="btn btn-primary"></a>
		</div>

	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="js/itemUploadPage.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ecc21974f7a9cd9fe27a0dd05775674a&libraries=services"></script>
</html>