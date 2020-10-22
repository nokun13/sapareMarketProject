<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="js/itemUploadPage.js"></script>
<style type="text/css">
.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#row {
	
	flex-direction: row;
}

#tType, #fType {
	visibility: hidden;
}
#select1,#tType, #fType {
 width: 200px;
 
}
</style>
<meta charset="UTF-8">
<title>상품작성</title>
<!-- <link rel="stylesheet" href="css/itemUploadPage.css"> -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="all" class='container'>
		<div id="itemimage" class='container'
			style="font-size: large; font-weight: bold;">
			상품이미지
			<div id='text-center'>
				<form id="form1">
					<label for='filepath'>
						<!-- <img id="img" style="width: 150px; height: 100px; border: 0px solid white;"> -->
						<img src="image/plus.jpg" id='img' class='img-circle'
						style="width: 200px; height: 160px" onchange="readURL(input)" />
					</label> <input type="file" name='filepath' id='filepath' class='filepath'
						style='display: none' />
				</form>
				<!-- <div class="container">
			<img id='img'>
			</div> -->

				<!--  <div class="button" onclick="onclick=document.all.file.click()">사진추가</div>  -->
			</div>
		</div>
		<hr />


		<div id="title" style="font-weight: bold;" class='container'>
			제목<a style="color: red">*</a> <input type="text"
				style="width: 500px; height: 50px" class="form-control"
				placeholder="제목을 입력하세요">
		</div>
		<hr />


		<div id="information" style="font-weight: bold;" class='container'>
			설명 <input type="text" style="width: 500px; height: 100px"
				class="form-control" placeholder="설명을 입력하세요">
		</div>
		<hr />
		<span style="font-weight: bold;">카테고리</span> <a style="color: red">*</a>
	<div id="row" class='container'>
	
		<tr>
			<th>
			<td>
			<select class="form-control" id="select1" onChange="chnQnaType(this.value)">
					<option value="0">대분류</option>
					<option value="00">경매</option>
					<option value="1">스포츠/레저</option>
					<option value="2">디지털/가전</option>
					<option value="3">의류</option>
					<option value="4">도서/티켓/취미</option>
					<option value="5">뷰티미용</option>
					<option value="6">기타</option>
			</select> 
			<select class="form-control" id="tType" onchange="chnQnaTypes(this.value)"></select> 
			<select class="form-control" id="fType" ></select>
			</td>
		    </th>
		</tr>
	</div>
</div>
		<!-- 카테고리 -->
		<!-- <div id="category" class='container'>
			<span style="font-weight: bold;" >카테고리</span>
			<a style="color: red">*</a> 
			<select class="form-control" style="width: 500px;">
				<option value="대분류">대분류</option>
				<option value="운동">운동</option>
				<option value="가전제품">가전제품</option>
				<option value="여성의류">여성의류</option>
				<option value="남성의류">남성의류</option>
			</select> 
			
			
			<select class="form-control" style="width: 500px;">
				<option value="중분류">중분류</option>
				<option value="운동">운동</option>
				<option value="가전제품">가전제품</option>
				<option value="여성의류">여성의류</option>
				<option value="남성의류">남성의류</option>
			</select> 
			
			<select class="form-control" style="width: 500px;">
				<option value="소분류">소분류</option>
				<option value="운동">운동</option>
				<option value="가전제품">가전제품</option>
				<option value="여성의류">여성의류</option>
				<option value="남성의류">남성의류</option>
			</select>
		</div> -->
		<hr />

		<div id="category" class='container'>
			<span style="font-weight: bold;">지역선택</span> <a style="color: red">*</a>
			<select class="form-control" style="width: 500px;">
				<option value="0">시/도</option>
				<option value="gwangju">광주광역시</option>
				<option value="gido">경기도</option>
				<option value="daegu">대구광역시</option>
				<option value="deajean">대전광역시</option>
				<option value="busan">부산광역시</option>
				<option value="seoul">서울광역시</option>
				<option value="jeju">제주특별시</option>
				<option value="inchon">인천광역시</option>
			</select> <select class="form-control" style="width: 500px;">
				<option value="중분류">구/시</option>
				<option value="운동">운동</option>
				<option value="가전제품">가전제품</option>
				<option value="여성의류">여성의류</option>
				<option value="남성의류">남성의류</option>
			</select> <select class="form-control" style="width: 500px;">
				<option value="소분류">동</option>
				<option value="운동">운동</option>
				<option value="가전제품">가전제품</option>
				<option value="여성의류">여성의류</option>
				<option value="남성의류">남성의류</option>
			</select>
		</div>

		<!-- 가격입력 -->
		<div id="price" style="font-weight: bold;" class="container">
			가격<a style="color: red">*</a> <input type="number"
				style="width: 500px; height: 20px" class="form-control"
				placeholder="ex)10000~"> <a
				style="color: red; font-size: x-small;">*100원이상의 단위로 입력해주세요.</a>
		</div>
		<hr />



		<!-- 판매분류 -->
		<div id="itemType" class='container'>
			<h4>♥경매물품과 중고물품을 선택해주세요♥</h4>
			<div>
				<input type="radio" name="radio" id="r2" value="1"
					onchange="Display()" checked class="control-input"> <label
					for="r2">경매물품거래</label> <input type="radio" name="radio" id="r1"
					value="0" onchange="Display()" class="control-input"> <label
					for="r1">중고물품거래</label>
			</div>
		</div>

		<!-- 경매시작가 -->
		<div id="AuctionStartPrice" style="font-weight: bold;"
			class='container'>
			경매 시작가 <input type="number" name="text" class="form-control"
				placeholder="ex)10000원부터" style="width: 500px;">


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
		<div id="click" class='container'>
			<a href="mainPage.do"><input type="button" value="취소" id="cancel" class="btn btn-secondary"></a> 
				<a href=""><input type="button" value="판매하기" id="sell" class="btn btn-primary"></a>
		</div>

	</div>
</body>
</html>