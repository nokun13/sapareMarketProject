<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<!--일반 중고 상품  -->
<html>
<head>
<meta charset="UTF-8">
<title>상품조회</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/itemViewPage.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/itemViewPage.css" />
</head>

<body>
	<jsp:include page="../views/header.jsp" flush="false"></jsp:include>
	<!-- 전체 사이즈 -->
	<div class="main-tle">
		<!--전체 가로 사이즈 -->
		<div class="widthsize">


			<!-- 첫번째 구역 -->
			<div class="first-section">
				<!-- 카테고리 내용 위치 -->
				<div class="ctg-section-location">
					<!-- 카테고리 시작점 -->
					<div class="ctg-start">
						<a href="http://localhost:8090/sapare/mainPage.do"><img
							src="image/home.jpg" width=20px; height=20px alt="홈"> 홈</a>
					</div>
					<!-- 첫번째 카테고리 구역 -->
					<div class="ctg1-section">
						<img src="image/loc.jpg" width=15px; height=15px;
							alt="카테고리 선택 아이콘">
						<!-- 첫번째 카테고리 창 길이 -->
						<div class="ctg1-width">
							<!-- 첫번째 카테고리 틀 -->
							<div class="ctg1-tle">
								<input hidden="hidden" id="bigCatVal" value="${item.itemBigCat }" />
								<select class="form-control bigOption" id="select1" 
								onchange="if(this.value) location.href=(this.value);" name='itemBigCat'>
									<option value="searchcategory.do?searchWord=스포츠/레저" <c:if test="${item.itemBigCat eq '스포츠/레저'}">selected="selected"</c:if>>스포츠/레저</option>
									<option value="searchcategory.do?searchWord=디지털/가전" <c:if test="${item.itemBigCat eq '디지털/가전'}">selected="selected"</c:if>>디지털/가전</option>
									<option value="searchcategory.do?searchWord=의류" <c:if test="${item.itemBigCat eq '의류'}">selected="selected"</c:if>>의류</option>
									<option value="searchcategory.do?searchWord=도서/티켓/취미" <c:if test="${item.itemBigCat eq '도서/티켓/취미'}">selected="selected"</c:if>>도서/티켓/취미</option>
									<option value="searchcategory.do?searchWord=뷰티미용" <c:if test="${item.itemBigCat eq '뷰티미용'}">selected="selected"</c:if>>뷰티미용</option>
									<option value="searchcategory.do?searchWord=기타" <c:if test="${item.itemBigCat eq '기타'}">selected="selected"</c:if>>기타</option>
								</select>  
							</div>
						</div>
					</div>
					<!-- 두번째 카테고리 구역 -->
					<div class="ctg2-section">
						<img src="image/loc.jpg" width=15px; height=15px;
							alt="카테고리 선택 아이콘">
						<!-- 두번째 카테고리 창 길이 -->
						<div class="ctg2-width">
							<!-- 두번째 카테고리 틀 -->
							<div class="ctg2-tle">
								<!-- 카테고리 옵션 -->
								<select class="form-control midOption" id="select2" 
								onchange="if(this.value) location.href=(this.value);" name='itemMidCat'>
								<c:if test="${item.itemBigCat == '스포츠/레저' }">
							        <option value='searchcategory.do?searchWord=헬스/요가' <c:if test="${item.itemMidCat eq '헬스/요가'}">selected='selected'</c:if>>헬스/요가</option>
							        <option value='searchcategory.do?searchWord=축구/야구/농구' <c:if test="${item.itemMidCat eq '축구/야구/농구'}">selected='selected'</c:if>>축구/야구/농구</option>
							        <option value='searchcategory.do?searchWord=낚시/캠핑' <c:if test="${item.itemMidCat eq '낚시/캠핑'}">selected='selected'</c:if>>낚시/캠핑</option>
							        <option value='searchcategory.do?searchWord=볼링/테니스/배드민턴' <c:if test="${item.itemMidCat eq '볼링/테니스/배드민턴'}">selected='selected'</c:if>>볼링/테니스/배드민턴</option>
							        <option value='searchcategory.do?searchWord=스키/스노우보드' <c:if test="${item.itemMidCat eq '스키/스노우보드'}">selected='selected'</c:if>>스키/스노우보드</option>
							        <option value='searchcategory.do?searchWord=자건거/MTB' <c:if test="${item.itemMidCat eq '자건거/MTB'}">selected='selected'</c:if>>자건거/MTB</option>
							        <option value='searchcategory.do?searchWord=등산' <c:if test="${item.itemMidCat eq '등산'}">selected='selected'</c:if>>등산</option>
							        <option value='searchcategory.do?searchWord=수영' <c:if test="${item.itemMidCat eq '수영'}">selected='selected'</c:if>>수영</option>   
							    </c:if>    
							    <c:if test="${item.itemBigCat == '디지털/가전' }">
							        <option value='searchcategory.do?searchWord=모바일' <c:if test="${item.itemMidCat eq '모바일'}">selected='selected'</c:if>>모바일</option>
							        <option value='searchcategory.do?searchWord=가전제품' <c:if test="${item.itemMidCat eq '가전제품'}">selected='selected'</c:if>>가전제품</option>
							        <option value='searchcategory.do?searchWord=게임' <c:if test="${item.itemMidCat eq '게임'}">selected='selected'</c:if>>게임</option>
							        <option value='searchcategory.do?searchWord=PC/모니터' <c:if test="${item.itemMidCat eq 'PC/모니터'}">selected='selected'</c:if>>PC/모니터</option>
							        <option value='searchcategory.do?searchWord=노트북/넷북' <c:if test="${item.itemMidCat eq '노트북/넷북'}">selected='selected'</c:if>>노트북/넷북</option>
							        <option value='searchcategory.do?searchWord=카메라' <c:if test="${item.itemMidCat eq '카메라'}">selected='selected'</c:if>>카메라</option>
							    </c:if>
							    <c:if test="${item.itemBigCat == '의류' }">
							        <option value='searchcategory.do?searchWord=여성의류' <c:if test="${item.itemMidCat eq '여성의류'}">selected='selected'</c:if>>여성의류</option>
							        <option value='searchcategory.do?searchWord=남성의류' <c:if test="${item.itemMidCat eq '남성의류'}">selected='selected'</c:if>>남성의류</option>
							        <option value='searchcategory.do?searchWord=공통의류' <c:if test="${item.itemMidCat eq '공통의류'}">selected='selected'</c:if>>공통의류</option>
							        <option value='searchcategory.do?searchWord=패션잡화' <c:if test="${item.itemMidCat eq '패션잡화'}">selected='selected'</c:if>>패션잡화</option>
							    </c:if>
							    <c:if test="${item.itemBigCat == '도서/티켓/취미' }">
							        <option value='searchcategory.do?searchWord=도서' <c:if test="${item.itemMidCat eq '도서'}">selected='selected'</c:if>>도서</option>
							        <option value='searchcategory.do?searchWord=취미' <c:if test="${item.itemMidCat eq '취미'}">selected='selected'</c:if>>취미</option>
							        <option value='searchcategory.do?searchWord=티켓' <c:if test="${item.itemMidCat eq '티켓'}">selected='selected'</c:if>>티켓</option>
							        <option value='searchcategory.do?searchWord=도서기타' <c:if test="${item.itemMidCat eq '기타'}">selected='selected'</c:if>>기타</option>
							    </c:if>    
							    <c:if test="${item.itemBigCat == '뷰티미용' }">
							        <option value='searchcategory.do?searchWord=메이크업' <c:if test="${item.itemMidCat eq '메이크업'}">selected='selected'</c:if>>메이크업</option>
							        <option value='searchcategory.do?searchWord=스킨케어' <c:if test="${item.itemMidCat eq '스킨케어'}">selected='selected'</c:if>>스킨케어</option>
							        <option value='searchcategory.do?searchWord=미용기기' <c:if test="${item.itemMidCat eq '미용기기'}">selected='selected'</c:if>>미용기기</option>
							        <option value='searchcategory.do?searchWord=네일/페디' <c:if test="${item.itemMidCat eq '네일/페디'}">selected='selected'</c:if>>네일/페디</option>
							        <option value='searchcategory.do?searchWord=헤어/바디' <c:if test="${item.itemMidCat eq '헤어/바디'}">selected='selected'</c:if>>헤어/바디</option>
							        <option value='searchcategory.do?searchWord=향수' <c:if test="${item.itemMidCat eq '향수'}">selected='selected'</c:if>>향수</option>
							    </c:if>
							    <c:if test="${item.itemBigCat == '기타' }">
							        <option value='searchcategory.do?searchWord=차량용품' <c:if test="${item.itemMidCat eq '차량용품'}">selected='selected'</c:if>>차량용품</option>
							        <option value='searchcategory.do?searchWord=굿즈' <c:if test="${item.itemMidCat eq '굿즈'}">selected='selected'</c:if>>굿즈</option>
							        <option value='searchcategory.do?searchWord=식품' <c:if test="${item.itemMidCat eq '식품'}">selected='selected'</c:if>>식품</option>
							        <option value='searchcategory.do?searchWord=가구' <c:if test="${item.itemMidCat eq '가구'}">selected='selected'</c:if>>가구</option>
							    </c:if>
								</select>
							</div>
						</div>
					</div>
					<!-- 세번째 카테고리 구역 -->
					<div class="ctg3-section">
						<img src="image/loc.jpg" width=15px; height=15px;
							alt="카테고리 선택 아이콘">
						<!-- 세번째 카테고리 창 길이 -->
						<div class="ctg3-width">
							<!-- 세번째 카테고리 틀 -->
							<div class="ctg3-tle">
								<!-- 카테고리 옵션 -->
								<select class="form-control smallOption" id="select3" 
								onchange="if(this.value) location.href=(this.value);" name='itemSmallCat'>
								<c:if test="${item.itemMidCat == '헬스/요가' }">
								  	<option value='searchcategory.do?searchWord=헬스의류' <c:if test="${item.itemSmallCat eq '헬스의류'}">selected='selected'</c:if>>헬스의류</option>
								  	<option value='searchcategory.do?searchWord=헬스용품' <c:if test="${item.itemSmallCat eq '헬스용품'}">selected='selected'</c:if>>헬스용품</option>
								  	<option value='searchcategory.do?searchWord=요가의류' <c:if test="${item.itemSmallCat eq '요가의류'}">selected='selected'</c:if>>요가의류</option>
								  	<option value='searchcategory.do?searchWord=요가용품' <c:if test="${item.itemSmallCat eq '요가용품'}">selected='selected'</c:if>>요가용품</option>
								</c:if>
								<c:if test="${item.itemMidCat == '축구/야구/농구' }">
								  	<option value='searchcategory.do?searchWord=축구용품' <c:if test="${item.itemSmallCat eq '축구용품'}">selected='selected'</c:if>>축구용품</option>
								  	<option value='searchcategory.do?searchWord=농구용품' <c:if test="${item.itemSmallCat eq '농구용품'}">selected='selected'</c:if>>농구용품</option>
								  	<option value='searchcategory.do?searchWord=야구용품' <c:if test="${item.itemSmallCat eq '야구용품'}">selected='selected'</c:if>>야구용품</option>
								  	<option value='searchcategory.do?searchWord=각종 유니폼' <c:if test="${item.itemSmallCat eq '각종 유니폼'}">selected='selected'</c:if>>각종 유니폼</option>
								</c:if>
								<c:if test="${item.itemMidCat == '낚시/캠핑' }">
								  	<option value='searchcategory.do?searchWord=낚시장비' <c:if test="${item.itemSmallCat eq '낚시장비'}">selected='selected'</c:if>>낚시장비</option>
								  	<option value='searchcategory.do?searchWord=취사용품' <c:if test="${item.itemSmallCat eq '취사용품'}">selected='selected'</c:if>>취사용품</option>
								  	<option value='searchcategory.do?searchWord=캠핑야외용품' <c:if test="${item.itemSmallCat eq '캠핑야외용품'}">selected='selected'</c:if>>캠핑야외용품</option>
								  	<option value='searchcategory.do?searchWord=캠핑편의용품' <c:if test="${item.itemSmallCat eq '캠핑편의용품'}">selected='selected'</c:if>>캠핑편의용품</option>
								  	<option value='searchcategory.do?searchWord=텐트/그늘막' <c:if test="${item.itemSmallCat eq '텐트/그늘막'}">selected='selected'</c:if>>텐트/그늘막</option>
								</c:if>
								<c:if test="${item.itemMidCat == '볼링/테니스/배드민턴' }">
								  	<option value='searchcategory.do?searchWord=볼링장비' <c:if test="${item.itemSmallCat eq '볼링장비'}">selected='selected'</c:if>>볼링장비</option>
								  	<option value='searchcategory.do?searchWord=배드민턴 장비' <c:if test="${item.itemSmallCat eq '배드민턴 장비'}">selected='selected'</c:if>>배드민턴 장비</option>
								  	<option value='searchcategory.do?searchWord=테니스 장비' <c:if test="${item.itemSmallCat eq '테니스 장비'}">selected='selected'</c:if>>테니스 장비</option>
								  	<option value='searchcategory.do?searchWord=볼링 보조용품' <c:if test="${item.itemSmallCat eq '볼링 보조용품'}">selected='selected'</c:if>>볼링 보조용품</option>
								  	<option value='searchcategory.do?searchWord=배드민턴 보조용품' <c:if test="${item.itemSmallCat eq '배드민턴 보조용품'}">selected='selected'</c:if>>배드민턴 보조용품</option>
								  	<option value='searchcategory.do?searchWord=테니스 보조용품' <c:if test="${item.itemSmallCat eq '테니스 보조용품'}">selected='selected'</c:if>>테니스 보조용품</option>
								</c:if>
								<c:if test="${item.itemMidCat == '스키/스노우보드' }">
								  	<option value='searchcategory.do?searchWord=스키/스노우보드' <c:if test="${item.itemSmallCat eq '스키/스노우보드'}">selected='selected'</c:if>>스키/스노우보드</option>
								  	<option value='searchcategory.do?searchWord=스키의류/잡화' <c:if test="${item.itemSmallCat eq '스키의류/잡화'}">selected='selected'</c:if>>스키의류/잡화</option>
								  	<option value='searchcategory.do?searchWord=스키용품' <c:if test="${item.itemSmallCat eq '스키용품'}">selected='selected'</c:if>>스키용품</option>
								</c:if>
								<c:if test="${item.itemMidCat == '자전거/MTB' }">
								  	<option value='searchcategory.do?searchWord=클래식/픽시' <c:if test="${item.itemSmallCat eq '클래식/픽시'}">selected='selected'</c:if>>클래식/픽시</option>
								  	<option value='searchcategory.do?searchWord=MTB/산악' <c:if test="${item.itemSmallCat eq 'MTB/산악'}">selected='selected'</c:if>>MTB/산악</option>
								  	<option value='searchcategory.do?searchWord=로드/BMX' <c:if test="${item.itemSmallCat eq '로드/BMX'}">selected='selected'</c:if>>로드/BMX</option>
								  	<option value='searchcategory.do?searchWord=기타자전거' <c:if test="${item.itemSmallCat eq '기타자전거'}">selected='selected'</c:if>>기타자전거</option>
								  	<option value='searchcategory.do?searchWord=자전거 용품' <c:if test="${item.itemSmallCat eq '자전거 용품'}">selected='selected'</c:if>>자전거 용품</option>
								  	<option value='searchcategory.do?searchWord=자전거 부품' <c:if test="${item.itemSmallCat eq '자전거 부품'}">selected='selected'</c:if>>자전거 부품</option>
								</c:if>
								<c:if test="${item.itemMidCat == '등산' }">
								  	<option value='searchcategory.do?searchWord=여성 등산복' <c:if test="${item.itemSmallCat eq '여성 등산복'}">selected='selected'</c:if>>여성 등산복</option>
								  	<option value='searchcategory.do?searchWord=남성 등산복' <c:if test="${item.itemSmallCat eq '남성 등산복'}">selected='selected'</c:if>>남성 등산복</option>
								  	<option value='searchcategory.do?searchWord=등산화' <c:if test="${item.itemSmallCat eq '등산화'}">selected='selected'</c:if>>등산화</option>
								  	<option value='searchcategory.do?searchWord=등산용품' <c:if test="${item.itemSmallCat eq '등산용품'}">selected='selected'</c:if>>등산용품</option>
								  	<option value='searchcategory.do?searchWord=암벽/클라이밍장비' <c:if test="${item.itemSmallCat eq '암벽/클라이밍장비'}">selected='selected'</c:if>>암벽/클라이밍장비</option>
								  	<option value='searchcategory.do?searchWord=배낭' <c:if test="${item.itemSmallCat eq '배낭'}">selected='selected'</c:if>>배낭</option>
								</c:if>
								<c:if test="${item.itemMidCat == '수영' }">
								  	<option value='searchcategory.do?searchWord=남성수영복' <c:if test="${item.itemSmallCat eq '남성수영복'}">selected='selected'</c:if>>남성수영복</option>
								  	<option value='searchcategory.do?searchWord=여성수영복/래쉬가드' <c:if test="${item.itemSmallCat eq '여성수영복/래쉬가드'}">selected='selected'</c:if>>여성수영복/래쉬가드</option>
								  	<option value='searchcategory.do?searchWord=수영용품' <c:if test="${item.itemSmallCat eq '수영용품'}">selected='selected'</c:if>>수영용품</option>
								</c:if>
								<c:if test="${item.itemMidCat == '모바일' }">
								  	<option value='searchcategory.do?searchWord=스마트폰' <c:if test="${item.itemSmallCat eq '스마트폰'}">selected='selected'</c:if>>스마트폰</option>
								  	<option value='searchcategory.do?searchWord=케이스' <c:if test="${item.itemSmallCat eq '케이스'}">selected='selected'</c:if>>케이스</option>
								  	<option value='searchcategory.do?searchWord=보호필름/액세서리' <c:if test="${item.itemSmallCat eq '보호필름/액세서리'}">selected='selected'</c:if>>보호필름/액세서리</option>
								  	<option value='searchcategory.do?searchWord=배터리/충전기' <c:if test="${item.itemSmallCat eq '배터리/충전기'}">selected='selected'</c:if>>배터리/충전기</option>
								  	<option value='searchcategory.do?searchWord=케이블/거치대/주변기기' <c:if test="${item.itemSmallCat eq '케이블/거치대/주변기기'}">selected='selected'</c:if>>케이블/거치대/주변기기</option>
								</c:if>
								<c:if test="${item.itemMidCat == '가전제품' }">
								  	<option value='searchcategory.do?searchWord=소형가전(다리미/밥솥등)' <c:if test="${item.itemSmallCat eq '소형가전(다리미/밥솥등)'}">selected='selected'</c:if>>소형가전(다리미/밥솥등)</option>
								  	<option value='searchcategory.do?searchWord=대형가전(냉장고/세탁기등)' <c:if test="${item.itemSmallCat eq '대형가전(냉장고/세탁기등)'}">selected='selected'</c:if>>대형가전(냉장고/세탁기등)</option>
								  	<option value='searchcategory.do?searchWord=TV' <c:if test="${item.itemSmallCat eq 'TV'}">selected='selected'</c:if>>TV</option>
								  	<option value='searchcategory.do?searchWord=기타가전제품 ' <c:if test="${item.itemSmallCat eq '기타가전제품'}">selected='selected'</c:if>>기타가전제품</option>
								</c:if>
								<c:if test="${item.itemMidCat == '게임' }">
								  	<option value='searchcategory.do?searchWord=PC게임' <c:if test="${item.itemSmallCat eq 'PC게임'}">selected='selected'</c:if>>PC게임</option>
								  	<option value='searchcategory.do?searchWord=닌텐도/will' <c:if test="${item.itemSmallCat eq '닌텐도/will'}">selected='selected'</c:if>>닌텐도/will</option>
								  	<option value='searchcategory.do?searchWord=XBOX/플레이 스테이션' <c:if test="${item.itemSmallCat eq 'XBOX/플레이 스테이션'}">selected='selected'</c:if>>XBOX/플레이 스테이션</option>
								  	<option value='searchcategory.do?searchWord=게임/타이틀' <c:if test="${item.itemSmallCat eq '게임/타이틀'}">selected='selected'</c:if>>게임/타이틀</option>
								</c:if>
								<c:if test="${item.itemMidCat == 'PC/모니터' }">
								  	<option value='searchcategory.do?searchWord=데스크탑/본체' <c:if test="${item.itemSmallCat eq '데스크탑/본체'}">selected='selected'</c:if>>데스크탑/본체</option>
								  	<option value='searchcategory.do?searchWord=키보드/마우스' <c:if test="${item.itemSmallCat eq '키보드/마우스'}">selected='selected'</c:if>>키보드/마우스</option>
								  	<option value='searchcategory.do?searchWord=모니터' <c:if test="${item.itemSmallCat eq '모니터'}">selected='selected'</c:if>>모니터</option>
								  	<option value='searchcategory.do?searchWord=복합/프린터' <c:if test="${item.itemSmallCat eq '복합/프린터'}">selected='selected'</c:if>>복합/프린터</option>
								  	<option value='searchcategory.do?searchWord=각종 PC용품' <c:if test="${item.itemSmallCat eq '각종 PC용품'}">selected='selected'</c:if>>각종 PC용품</option>
								</c:if>
								<c:if test="${item.itemMidCat == '노트북/넷북' }">
								  	<option value='searchcategory.do?searchWord=노트북/넷북' <c:if test="${item.itemSmallCat eq '노트북/넷북'}">selected='selected'</c:if>>노트북/넷북</option>
								  	<option value='searchcategory.do?searchWord=테블릿' <c:if test="${item.itemSmallCat eq '테블릿'}">selected='selected'</c:if>>테블릿</option>
								  	<option value='searchcategory.do?searchWord=노트북 악세서리' <c:if test="${item.itemSmallCat eq '노트북 악세서리'}">selected='selected'</c:if>>노트북 악세서리</option>
								  	<option value='searchcategory.do?searchWord=노트북 주변기기' <c:if test="${item.itemSmallCat eq '노트북 주변기기'}">selected='selected'</c:if>>노트북 주변기기</option>
								</c:if>
								<c:if test="${item.itemMidCat == '카메라' }">
								  	<option value='searchcategory.do?searchWord=DSLR/미러리스' <c:if test="${item.itemSmallCat eq 'DSLR/미러리스'}">selected='selected'</c:if>>DSLR/미러리스</option>
								  	<option value='searchcategory.do?searchWord=필름카메라' <c:if test="${item.itemSmallCat eq '필름카메라'}">selected='selected'</c:if>>필름카메라</option>
								  	<option value='searchcategory.do?searchWord=기타카메라' <c:if test="${item.itemSmallCat eq '기타카메라'}">selected='selected'</c:if>>기타카메라</option>
								  	<option value='searchcategory.do?searchWord=렌즈/필터' <c:if test="${item.itemSmallCat eq '렌즈/필터'}">selected='selected'</c:if>>렌즈/필터</option>
								  	<option value='searchcategory.do?searchWord=카메라 보조용품 ' <c:if test="${item.itemSmallCat eq '카메라 보조용품'}">selected='selected'</c:if>>카메라 보조용품</option>
								</c:if>
								<c:if test="${item.itemMidCat == '여성의류' }">
								  	<option value='searchcategory.do?searchWord=아우터' <c:if test="${item.itemSmallCat eq '아우터'}">selected='selected'</c:if>>아우터</option>
								  	<option value='searchcategory.do?searchWord=치마/스커트' <c:if test="${item.itemSmallCat eq '치마/스커트'}">selected='selected'</c:if>>치마/스커트</option>
								  	<option value='searchcategory.do?searchWord=바지' <c:if test="${item.itemSmallCat eq '바지'}">selected='selected'</c:if>>바지</option>
								  	<option value='searchcategory.do?searchWord=원피스' <c:if test="${item.itemSmallCat eq '원피스'}">selected='selected'</c:if>>원피스</option>
								  	<option value='searchcategory.do?searchWord=반팔티' <c:if test="${item.itemSmallCat eq '반팔티'}">selected='selected'</c:if>>반팔티</option>
								  	<option value='searchcategory.do?searchWord=트레이닝' <c:if test="${item.itemSmallCat eq '트레이닝'}">selected='selected'</c:if>>트레이닝</option>
								  	<option value='searchcategory.do?searchWord=블라우스' <c:if test="${item.itemSmallCat eq '블라우스'}">selected='selected'</c:if>>블라우스</option>
								  	<option value='searchcategory.do?searchWord=니트/스웨터' <c:if test="${item.itemSmallCat eq '니트/스웨터'}">selected='selected'</c:if>>니트/스웨터</option>
								  	<option value='searchcategory.do?searchWord=맨투맨/후드' <c:if test="${item.itemSmallCat eq '맨투맨/후드'}">selected='selected'</c:if>>맨투맨/후드</option>
								</c:if>
								<c:if test="${item.itemMidCat == '남성의류' }">
								  	<option value='searchcategory.do?searchWord=아우터' <c:if test="${item.itemSmallCat eq '아우터'}">selected='selected'</c:if>>아우터</option>
								  	<option value='searchcategory.do?searchWord=셔츠,남방' <c:if test="${item.itemSmallCat eq '셔츠,남방'}">selected='selected'</c:if>>셔츠,남방</option>
								  	<option value='searchcategory.do?searchWord=바지' <c:if test="${item.itemSmallCat eq '바지'}">selected='selected'</c:if>>바지</option>
								  	<option value='searchcategory.do?searchWord=반팔티' <c:if test="${item.itemSmallCat eq '반팔티'}">selected='selected'</c:if>>반팔티</option>
								  	<option value='searchcategory.do?searchWord=트레이닝' <c:if test="${item.itemSmallCat eq '트레이닝'}">selected='selected'</c:if>>트레이닝</option>
								  	<option value='searchcategory.do?searchWord=니트/스웨터' <c:if test="${item.itemSmallCat eq '니트/스웨터'}">selected='selected'</c:if>>니트/스웨터</option>
								  	<option value='searchcategory.do?searchWord=맨투맨/후드' <c:if test="${item.itemSmallCat eq '맨투맨/후드'}">selected='selected'</c:if>>맨투맨/후드</option>
								</c:if>
								<c:if test="${item.itemMidCat == '공통의류' }">
								  	<option value='searchcategory.do?searchWord=아우터' <c:if test="${item.itemSmallCat eq '아우터'}">selected='selected'</c:if>>아우터</option>
								  	<option value='searchcategory.do?searchWord=셔츠,남방' <c:if test="${item.itemSmallCat eq '셔츠,남방'}">selected='selected'</c:if>>셔츠,남방</option>
								  	<option value='searchcategory.do?searchWord=바지' <c:if test="${item.itemSmallCat eq '바지'}">selected='selected'</c:if>>바지</option>
								  	<option value='searchcategory.do?searchWord=반팔티' <c:if test="${item.itemSmallCat eq '반팔티'}">selected='selected'</c:if>>반팔티</option>
								  	<option value='searchcategory.do?searchWord=트레이닝' <c:if test="${item.itemSmallCat eq '트레이닝'}">selected='selected'</c:if>>트레이닝</option>
								  	<option value='searchcategory.do?searchWord=니트/스웨터' <c:if test="${item.itemSmallCat eq '니트/스웨터'}">selected='selected'</c:if>>니트/스웨터</option>
								  	<option value='searchcategory.do?searchWord=맨투맨/후드' <c:if test="${item.itemSmallCat eq '맨투맨/후드'}">selected='selected'</c:if>>맨투맨/후드</option>
								</c:if>
								<c:if test="${item.itemMidCat == '패션잡화' }">
								  	<option value='searchcategory.do?searchWord=가방' <c:if test="${item.itemSmallCat eq '가방'}">selected='selected'</c:if>>가방</option>
								  	<option value='searchcategory.do?searchWord=신발' <c:if test="${item.itemSmallCat eq '신발'}">selected='selected'</c:if>>신발</option>
								  	<option value='searchcategory.do?searchWord=시계' <c:if test="${item.itemSmallCat eq '시계'}">selected='selected'</c:if>>시계</option>
								  	<option value='searchcategory.do?searchWord=안경' <c:if test="${item.itemSmallCat eq '안경'}">selected='selected'</c:if>>안경</option>
								  	<option value='searchcategory.do?searchWord=주얼리/액세서리' <c:if test="${item.itemSmallCat eq '주얼리/액세서리'}">selected='selected'</c:if>>주얼리/액세서리</option>
								  	<option value='searchcategory.do?searchWord=모자' <c:if test="${item.itemSmallCat eq '모자'}">selected='selected'</c:if>>모자</option>
								  	<option value='searchcategory.do?searchWord=지갑' <c:if test="${item.itemSmallCat eq '지갑'}">selected='selected'</c:if>>지갑</option>
								  	<option value='searchcategory.do?searchWord=기타' <c:if test="${item.itemSmallCat eq '기타'}">selected='selected'</c:if>>기타</option>
								</c:if>
								<c:if test="${item.itemMidCat == '도서' }">
								  	<option value='searchcategory.do?searchWord=학습/자습/참고서' <c:if test="${item.itemSmallCat eq '학습/자습/참고서'}">selected='selected'</c:if>>학습/자습/참고서</option>
								  	<option value='searchcategory.do?searchWord=만화책' <c:if test="${item.itemSmallCat eq '만화책'}">selected='selected'</c:if>>만화책</option>
								  	<option value='searchcategory.do?searchWord=교양/시사/잡지' <c:if test="${item.itemSmallCat eq '교양/시사/잡지'}">selected='selected'</c:if>>교양/시사/잡지</option>
								  	<option value='searchcategory.do?searchWord=시/소설' <c:if test="${item.itemSmallCat eq '시/소설'}">selected='selected'</c:if>>시/소설</option>
								  	<option value='searchcategory.do?searchWord=수필' <c:if test="${item.itemSmallCat eq '수필'}">selected='selected'</c:if>>수필</option>
								  	<option value='searchcategory.do?searchWord=유아도서' <c:if test="${item.itemSmallCat eq '유아도서'}">selected='selected'</c:if>>유아도서</option>
								  	<option value='searchcategory.do?searchWord=여행/취미/건강' <c:if test="${item.itemSmallCat eq '여행/취미/건강'}">selected='selected'</c:if>>여행/취미/건강</option>
								</c:if>
								<c:if test="${item.itemMidCat == '취미' }">
								  	<option value='searchcategory.do?searchWord=피규어' <c:if test="${item.itemSmallCat eq '피규어'}">selected='selected'</c:if>>피규어</option>
								  	<option value='searchcategory.do?searchWord=레고/블럭' <c:if test="${item.itemSmallCat eq '레고/블럭'}">selected='selected'</c:if>>레고/블럭</option>
								  	<option value='searchcategory.do?searchWord=보드게임/다트' <c:if test="${item.itemSmallCat eq '보드게임/다트'}">selected='selected'</c:if>>보드게임/다트</option>
								  	<option value='searchcategory.do?searchWord=프라모델/건담' <c:if test="${item.itemSmallCat eq '프라모델/건담'}">selected='selected'</c:if>>프라모델/건담</option>
								  	<option value='searchcategory.do?searchWord=드론/Rc카' <c:if test="${item.itemSmallCat eq '드론/Rc카'}">selected='selected'</c:if>>드론/Rc카</option>
								  	<option value='searchcategory.do?searchWord=팬시' <c:if test="${item.itemSmallCat eq '팬시'}">selected='selected'</c:if>>팬시</option>
								</c:if>
								<c:if test="${item.itemMidCat == '티켓' }">
								  	<option value='searchcategory.do?searchWord=영화티켓/관람권' <c:if test="${item.itemSmallCat eq '영화티켓/관람권'}">selected='selected'</c:if>>영화티켓/관람권</option>
								  	<option value='searchcategory.do?searchWord=콘서트' <c:if test="${item.itemSmallCat eq '콘서트'}">selected='selected'</c:if>>콘서트</option>
								  	<option value='searchcategory.do?searchWord=뮤지컬/연극' <c:if test="${item.itemSmallCat eq '뮤지컬/연극'}">selected='selected'</c:if>>뮤지컬/연극</option>
								  	<option value='searchcategory.do?searchWord=스포츠' <c:if test="${item.itemSmallCat eq '스포츠'}">selected='selected'</c:if>>스포츠</option>
								  	<option value='searchcategory.do?searchWord=테마파크/놀이공원/동물원' <c:if test="${item.itemSmallCat eq '테마파크/놀이공원/동물원'}">selected='selected'</c:if>>테마파크/놀이공원/동물원</option>
								  	<option value='searchcategory.do?searchWord=항공권' <c:if test="${item.itemSmallCat eq '항공권'}">selected='selected'</c:if>>항공권</option>
								  	<option value='searchcategory.do?searchWord=여행/숙박/렌트' <c:if test="${item.itemSmallCat eq '여행/숙박/렌트'}">selected='selected'</c:if>>여행/숙박/렌트</option>
								</c:if>
								<c:if test="${item.itemMidCat == '도서기타' }">
								  	<option value='searchcategory.do?searchWord=수집품/희귀품' <c:if test="${item.itemSmallCat eq '수집품/희귀품'}">selected='selected'</c:if>>수집품/희귀품</option>
								  	<option value='searchcategory.do?searchWord=골동품' <c:if test="${item.itemSmallCat eq '골동품'}">selected='selected'</c:if>>골동품</option>
								  	<option value='searchcategory.do?searchWord=기프티콘' <c:if test="${item.itemSmallCat eq '기프티콘'}">selected='selected'</c:if>>기프티콘</option>
								  	<option value='searchcategory.do?searchWord=문화/도서상품권' <c:if test="${item.itemSmallCat eq '문화/도서상품권'}">selected='selected'</c:if>>문화/도서상품권</option>
								  	<option value='searchcategory.do?searchWord=백화점상품권 ' <c:if test="${item.itemSmallCat eq '백화점상품권'}">selected='selected'</c:if>>백화점상품권</option>
								  	<option value='searchcategory.do?searchWord=외식상품권 ' <c:if test="${item.itemSmallCat eq '외식상품권'}">selected='selected'</c:if>>외식상품권</option>
								  	<option value='searchcategory.do?searchWord=악기' <c:if test="${item.itemSmallCat eq '악기'}">selected='selected'</c:if>>악기</option>
								  	<option value='searchcategory.do?searchWord=수공예품' <c:if test="${item.itemSmallCat eq '수공예품'}">selected='selected'</c:if>>수공예품</option>
								</c:if>
								<c:if test="${item.itemMidCat == '메이크업' }">
								  	<option value='searchcategory.do?searchWord=립스틱/틴트/립밤' <c:if test="${item.itemSmallCat eq '립스틱/틴트/립밤'}">selected='selected'</c:if>>립스틱/틴트/립밤</option>
								  	<option value='searchcategory.do?searchWord=아이섀도우/라이너/브로우/마스카라' <c:if test="${item.itemSmallCat eq '아이섀도우/라이너/브로우/마스카라'}">selected='selected'</c:if>>아이섀도우/라이너/브로우/마스카라</option>
								  	<option value='searchcategory.do?searchWord=파운데이션/파우더/팩트' <c:if test="${item.itemSmallCat eq '파운데이션/파우더/팩트'}">selected='selected'</c:if>>파운데이션/파우더/팩트</option>
								  	<option value='searchcategory.do?searchWord=프라이머/컨실러' <c:if test="${item.itemSmallCat eq '프라이머/컨실러'}">selected='selected'</c:if>>프라이머/컨실러</option>
								  	<option value='searchcategory.do?searchWord=BB크림' <c:if test="${item.itemSmallCat eq 'BB크림'}">selected='selected'</c:if>>BB크림</option>
								  	<option value='searchcategory.do?searchWord=메이크업기타' <c:if test="${item.itemSmallCat eq '메이크업기타'}">selected='selected'</c:if>>메이크업기타</option>
								</c:if>
								<c:if test="${item.itemMidCat == '스킨케어' }">
								  	<option value='searchcategory.do?searchWord=에센스/크림' <c:if test="${item.itemSmallCat eq '에센스/크림'}">selected='selected'</c:if>>에센스/크림</option>
								  	<option value='searchcategory.do?searchWord=스킨/토너/미스트' <c:if test="${item.itemSmallCat eq '스킨/토너/미스트'}">selected='selected'</c:if>>스킨/토너/미스트</option>
								  	<option value='searchcategory.do?searchWord=팩/마스크' <c:if test="${item.itemSmallCat eq '팩/마스크'}">selected='selected'</c:if>>팩/마스크</option>
								  	<option value='searchcategory.do?searchWord=클렌징/로션' <c:if test="${item.itemSmallCat eq '클렌징/로션'}">selected='selected'</c:if>>클렌징/로션</option>
								</c:if>
								<c:if test="${item.itemMidCat == '미용기기' }">
								  	<option value='searchcategory.do?searchWord=피부케어기기' <c:if test="${item.itemSmallCat eq '피부케어기기'}">selected='selected'</c:if>>피부케어기기</option>
								  	<option value='searchcategory.do?searchWord=미용가전' <c:if test="${item.itemSmallCat eq '미용가전'}">selected='selected'</c:if>>미용가전</option>
								  	<option value='searchcategory.do?searchWord=뷰티소품' <c:if test="${item.itemSmallCat eq '뷰티소품'}">selected='selected'</c:if>>뷰티소품</option>
								  	<option value='searchcategory.do?searchWord=파우치/정리함' <c:if test="${item.itemSmallCat eq '파우치/정리함'}">selected='selected'</c:if>>파우치/정리함</option>
								</c:if>
								<c:if test="${item.itemMidCat == '네일/페디' }">
								  	<option value='searchcategory.do?searchWord=네일아트' <c:if test="${item.itemSmallCat eq '네일아트'}">selected='selected'</c:if>>네일아트</option>
								  	<option value='searchcategory.do?searchWord=매니큐어/페디큐어' <c:if test="${item.itemSmallCat eq '매니큐어/페디큐어'}">selected='selected'</c:if>>매니큐어/페디큐어</option>
								  	<option value='searchcategory.do?searchWord=네일케어도구' <c:if test="${item.itemSmallCat eq '네일케어도구'}">selected='selected'</c:if>>네일케어도구</option>
								</c:if>
								<c:if test="${item.itemMidCat == '헤어/바디' }">
								  	<option value='searchcategory.do?searchWord=스타일링' <c:if test="${item.itemSmallCat eq '스타일링'}">selected='selected'</c:if>>스타일링</option>
								  	<option value='searchcategory.do?searchWord=바디클랜져/로션' <c:if test="${item.itemSmallCat eq '바디클랜져/로션'}">selected='selected'</c:if>>바디클랜져/로션</option>
								  	<option value='searchcategory.do?searchWord=에센스/트리트먼트' <c:if test="${item.itemSmallCat eq '에센스/트리트먼트'}">selected='selected'</c:if>>에센스/트리트먼트</option>
								  	<option value='searchcategory.do?searchWord=샴푸/린스' <c:if test="${item.itemSmallCat eq '샴푸/린스'}">selected='selected'</c:if>>샴푸/린스</option>
								  	<option value='searchcategory.do?searchWord=염색' <c:if test="${item.itemSmallCat eq '염색'}">selected='selected'</c:if>>염색</option>
								</c:if>
								<c:if test="${item.itemMidCat == '향수' }">
								  	<option value='searchcategory.do?searchWord=여성향수' <c:if test="${item.itemSmallCat eq '여성향수'}">selected='selected'</c:if>>여성향수</option>
								  	<option value='searchcategory.do?searchWord=남성향수' <c:if test="${item.itemSmallCat eq '남성향수'}">selected='selected'</c:if>>남성향수</option>
								  	<option value='searchcategory.do?searchWord=공용향수/아로마/디퓨저' <c:if test="${item.itemSmallCat eq '공용향수/아로마/디퓨저'}">selected='selected'</c:if>>공용향수/아로마/디퓨저</option>
								</c:if>
								<c:if test="${item.itemMidCat == '차량용품' }">
								  	<option value='searchcategory.do?searchWord=차량부품' <c:if test="${item.itemSmallCat eq '차량부품'}">selected='selected'</c:if>>차량부품</option>
								  	<option value='searchcategory.do?searchWord=튜닝용품' <c:if test="${item.itemSmallCat eq '튜닝용품'}">selected='selected'</c:if>>튜닝용품</option>
								  	<option value='searchcategory.do?searchWord=산업용품/네비/블랙박스' <c:if test="${item.itemSmallCat eq '산업용품/네비/블랙박스'}">selected='selected'</c:if>>산업용품/네비/블랙박스</option>
								</c:if>
								<c:if test="${item.itemMidCat == '굿즈' }">
								  	<option value='searchcategory.do?searchWord=보이그룹' <c:if test="${item.itemSmallCat eq '보이그룹'}">selected='selected'</c:if>>보이그룹</option>
								  	<option value='searchcategory.do?searchWord=걸그룹' <c:if test="${item.itemSmallCat eq '걸그룹'}">selected='selected'</c:if>>걸그룹</option>
								  	<option value='searchcategory.do?searchWord=솔로가수(남,여)' <c:if test="${item.itemSmallCat eq '솔로가수(남,여)'}">selected='selected'</c:if>>솔로가수(남,여)</option>
								  	<option value='searchcategory.do?searchWord=배우(남,여)' <c:if test="${item.itemSmallCat eq '배우(남,여)'}">selected='selected'</c:if>>배우(남,여)</option>
								</c:if>
								<c:if test="${item.itemMidCat == '식품' }">
								  	<option value='searchcategory.do?searchWord=건강식품' <c:if test="${item.itemSmallCat eq '건강식품'}">selected='selected'</c:if>>건강식품</option>
								  	<option value='searchcategory.do?searchWord=차,음료,과자' <c:if test="${item.itemSmallCat eq '차,음료,과자'}">selected='selected'</c:if>>차,음료,과자</option>
								  	<option value='searchcategory.do?searchWord=농수산물 ' <c:if test="${item.itemSmallCat eq '농수산물'}">selected='selected'</c:if>>농수산물</option>
								</c:if>
								<c:if test="${item.itemMidCat == '가구' }">
								  	<option value='searchcategory.do?searchWord=인테리어 소품' <c:if test="${item.itemSmallCat eq '인테리어 소품'}">selected='selected'</c:if>>인테리어 소품</option>
								  	<option value='searchcategory.do?searchWord=생활가구' <c:if test="${item.itemSmallCat eq '생활가구'}">selected='selected'</c:if>>생활가구</option>
								  	<option value='searchcategory.do?searchWord=사무용품' <c:if test="${item.itemSmallCat eq '사무용품'}">selected='selected'</c:if>>사무용품</option>
								</c:if>
								</select>
							</div>
						</div>
					</div>
					<form name='uptdel' action="up-de-form" class="up-de-class"
						method="post">
						<c:if test="${member.memberId == sessionScope.id }">
							<!-- 수정 삭제 틀  -->
							<div class="up-de">
								<input type="button" class="up-bt" value="수정" id="updateEvent"> 
								<input type="button" class="de-bt"value="삭제" id="deleteEvent" >
								
								<input type="hidden" name="itemId" value="${item.itemId }"/>
								<input type="hidden" name="itemName" value="${item.itemName }"/>
								<input type="hidden" name="itemPrice" value="${item.itemPrice }"/>
								<input type="hidden" name="itemAbout" value="${item.itemAbout }"/>
									
							</div>
						</c:if>
					</form>
				</div>
			</div>
			<form class="frmitem" method="get" name="form1">
				<!-- 두번째 섹션 -->
				<div class="second-section">
					<!-- 두번째 섹션 위치 -->
					<div class="second-section-location">
						<!-- 상품사진 보이는 위치 -->
						<div class="pic-location">
							<!-- 상품사진 틀-->
							<div class="pic-tle">
								<!-- 상품사진  -->
								<div class="pic-show">
									<c:if test="${fn:contains(item.itemStatus, 'n')}">
								    	<img src="image/soldout.png" class="sc-pic">
									</c:if>
									<c:if test="${fn:contains(item.itemStatus, 'y')}">
									    <img src="image/${item.itemImagePath}" class="sc-pic">
									</c:if>
								</div>
							</div>
						</div>
						<!-- 상품 상세정보 보이는 위치 -->
						<div class="more-info-location">
							<!-- 상품 상세정보 틀 -->
							<div class="more-info-tle">
								<!-- 상품 상세정보 설정 -->
								<div class="show-info">
									<!-- 제목과 가격 틀-->
									<div class="title-price-tle">
										<!-- 제목 -->
										<div class="title" id="itemName">
											${item.itemName}
											<c:if test="${fn:contains(item.itemStatus, 'n')}">
												&nbsp; *판매완료*
											</c:if>
											<input hidden="hidden" id="itemStatus" value="${item.itemStatus }" />
										</div>
										<input hidden="hidden" id="itemId" value="${item.itemId }" />
										<input hidden="hidden" id="memberName"
											value="${user.memberName }" />
										<input hidden="hidden" id="memberId" value="${member.memberId }" />
										<input hidden="hidden" id="mynameid" value="<%=(String) session.getAttribute("memberName")%>"/>
										<!-- 가격  틀-->
										<div class="price-tle">
											<!-- 가격 -->
											<div class="price" id="itemPrice">
												<fmt:formatNumber value="${item.itemPrice }" pattern="#,###,###,###" /><span>원</span>
											</div>
										</div>
									</div>
									<!-- 상태 보이는 틀 -->
									<div class="state-show-tle">
										<!-- 찜 조회수 올린날짜 신고 틀-->
										<div class="sa-co-date-de-tle">
											<!-- 찜 조회수 올린날짜 틀 -->
											<div class="sa-co-date-tle">
												<!-- 찜 틀 -->
												<div class="sa-tle">
													<c:if test="${want == 1 }">
														<img src="image/safill.png" id="sa-img" width=16px;
															height=16px; alt="상품 상태 아이콘">
														<div class="sa-count">${item.itemWantCnt }</div>
													</c:if>
													<c:if test="${want == 0 || want == null}">
														<img src="image/sa.png" id="sa-img" width=16px;
															height=16px; alt="상품 상태 아이콘">
														<div class="sa-count">${item.itemWantCnt }</div>
													</c:if>
												</div>
												<!-- 조회수 틀 -->
												<div class="co-tle">
													<img src="image/eye.jpg" width=16px; height=16px;
														alt="상품 상태 아이콘">${item.itemViewCnt }
												</div>
												<!-- 올린 날짜 틀 -->
												<div class="date-tle">
													<img src="image/date.jpg" width=16px; height=16px;
														alt="상품 상태 아이콘"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${item.itemUploadDate }" />
												</div>
											</div>
											<div id="singo">
												<!-- 신고하기 버튼 -->
												<button id="decl-btn" class="declaration" type="button">
													<img src="image/declaration.png" width=15px; height=15px;
														alt="신고 아이콘"> <span>신고하기</span>
												</button>
												<input type="hidden" value="${sessionScope.id}"
													class="session_id2">
											</div>
										</div>
										<!-- 상품상태 전체 틀 -->
										<div class="item-state-tle">
											<div class="item-one-tle">
												<!-- 상품 상태 정보  -->
												<div class="item-info">거래지역</div>
												<!-- 상품 상태 -->
												<div class="item-st" id="itemCity">${itemCat.itemCity }</div>
											</div>
											<!-- 상품 한줄 틀 -->
											<div class="item-one-tle">
												<!-- 상품 상태 정보  -->
												<div class="item-info">상품분류</div>
												<!-- 상품 상태 -->
												<div class="item-st" id="itemType">${item.itemType }</div>
											</div>
											<!-- 상품 한줄 틀 -->
											<div class="item-one-tle">
												<!-- 상품 상태 정보  -->
												<div class="item-info">태그</div>
												<!-- 상품 상태 -->
												<div class="item-st" id="itemSmallCat">${itemCat.itemSmallCat }</div>
											</div>
										</div>
									</div>
									<!-- 버튼 바 틀 -->
									<div class="bt-bar-tle">
										<!-- 버튼 틀 -->
										<div class="bt-tle">
											<!-- 로그인이 되어있고, 본인 글이 아닐경우에만 추천할 수 있도록 버튼을 출력 -->
											<%-- <c:if test = "${sessionScope.memberId != null and sessionScope.memberId != dto.memberId}"> --%>

											<!-- 버튼 -->
											<div class="bt-container">
												<c:if test="${want == 0 || want == null}">
													<button type="button" class="bt bt-heart" id="btNotWant">
														<img src="image/sa.png" id="bt-img" width="18" height="18"
															alt="찜 아이콘"> <span>찜</span>
													</button>
												</c:if>
												<c:if test="${want == 1 }">
													<button type="button" class="bt bt-heart" id="btWant"
														style="background: #FF6A6A;">
														<img src="image/safill.png" id="bt-img" width="18"
															height="18" alt="찜 아이콘"> <span>찜</span>
													</button>
												</c:if>
												<!-- 버튼 취소 -->
												<%-- <div class="cancle-bt">
													<input type="hidden" value="${sessionScope.id}" class="session_id">
													<img src="image/declaration.png" width="16" height="16"
														alt="찜 아이콘"> <span class="cancle-bt-span">찜이
														해제</span> 되었습니다.
												</div> --%>
											</div>
											<button type="button" class="bt2" id="chat-btn">채팅하기</button>
											<input type="hidden" value="${sessionScope.id}"
												class="session_id">

											<%-- </c:if> --%>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- 신고 모달창 -->
			<div id="decl-modal" class="modal">
				<div class="modal-content">
					<span class="close">&times;</span>
					<div class="auto">
						<span class="decl-title">신고하기</span>
					</div>
					<!-- 신고 전체 틀 -->

					<div class="decl-content-all-tle">
						<!-- 신고 틀 -->
						<div class="decl-content-tle" id="d1">
							<div class="span-decl-content1">
								<span>광고(상점홍보, 낚시글, 도배글)</span>
							</div>
							<form id="if1" method="post" action="itemflag.do">
								<div class="1" id="sp">
									<div class="decl-conform">
										<input class="decl-conform-input" type="text" placeholder="사유"
											name="itemFlagContent" /> <input hidden="hidden"
											name="itemId" value="${item.itemId}" /> <input
											hidden="hidden" name="memberName"
											value="${member.memberName}" /> <input hidden="hidden"
											name="itemFlagCategory" value="광고" /> <input type="submit"
											id="itemflagsubmit1" value="등록" style="cursor:pointer;"></input>
									</div>
								</div>
							</form>
						</div>

						<div class="decl-content-tle" id="d2">
							<div class="span-decl-content2">
								<span>물품정보 부정확(카테고리, 가격, 사진)</span>
							</div>
							<form id="if2" method="post" action="itemflag2.do">
								<div class="2" id="sp">
									<div class="decl-conform">
										<input class="decl-conform-input" type="text" placeholder="사유"
											name="itemFlagContent" /> <input hidden="hidden"
											name="itemId" value="${item.itemId}" /> <input
											hidden="hidden" name="memberName"
											value="${member.memberName}" /> <input hidden="hidden"
											name="itemFlagCategory" value="물품정보부정확" /> <input
											type="submit" id="itemflagsubmit2" value="등록" style="cursor:pointer;"></input>
									</div>
								</div>
							</form>
						</div>
						<div class="decl-content-tle" id="d3">
							<div class="span-decl-content3">
								<span>거래 금지 품목(담배, 주류, 장물)</span>
							</div>
							<form id="if3" method="post" action="itemflag3.do">
								<div class="3" id="sp">
									<div class="decl-conform">
										<input class="decl-conform-input" type="text" placeholder="사유"
											name="itemFlagContent" /> <input hidden="hidden"
											name="itemId" value="${item.itemId}" /> <input
											hidden="hidden" name="memberName"
											value="${member.memberName}" /> <input hidden="hidden"
											name="itemFlagCategory" value="거래금지품목" /> <input
											type="submit" id="itemflagsubmit3" value="등록" style="cursor:pointer;"></input>
									</div>
								</div>
							</form>
						</div>
						<div class="decl-content-tle" id="d4">
							<div class="span-decl-content4">
								<span>언어폭력(비방, 욕설, 성희롱)</span>
							</div>
							<form id="if4" method="post" action="itemflag4.do">
								<div class="4" id="sp">
									<div class="decl-conform">
										<input class="decl-conform-input" type="text" placeholder="사유"
											name="itemFlagContent" /> <input hidden="hidden"
											name="itemId" value="${item.itemId}" /> <input
											hidden="hidden" name="memberName"
											value="${member.memberName}" /> <input hidden="hidden"
											name="itemFlagCategory" value="언어폭력" /> <input type="submit"
											id="itemflagsubmit4" value="등록" style="cursor:pointer;"></input>
									</div>
								</div>
							</form>
						</div>
						<div class="decl-content-tle" id="d5">
							<div class="span-decl-content5">
								<span>기타사유(직접입력)</span>
							</div>
							<form id="if5" method="post" action="itemflag5.do">
								<div class="5" id="sp">
									<div class="decl-conform">
										<input class="decl-conform-input" type="text" placeholder="사유"
											name="itemFlagContent" /> <input hidden="hidden"
											name="itemId" value="${item.itemId}" /> <input
											hidden="hidden" name="memberName"
											value="${member.memberName}" /> <input hidden="hidden"
											name="itemFlagCategory" value="기타" /> <input type="submit"
											id="itemflagsubmit5" value="등록" style="cursor:pointer;"></input>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>




			<!-- 네번째 구역 -->
			<div class="fourth-section">
				<!-- 연관상품 전체 틀 -->
				<div class="rela-item-tle">
					<!-- 연관상품 제목 전체 틀-->
					<div class="rela-item-title-tle">
						<!-- 연관상품 제목 -->
						<div class="rela-item-title">
							최신상품
							<!-- 광고 틀 -->
							<div class="ad-tle">AD</div>
							<img src="image/ad.png" alt="AD 가이드" width="16" height="16"
								style="margin-top: 6px;">
						</div>
					</div>

					<form method="post">
						<!-- 광고 사진 전체 틀 -->
						<div class="ad-pic-all-tle">
							<c:forEach items="${itemList }" var="dto" begin="0" end="6">
							<c:if test="${item.itemName !=dto.itemName}">
								<!-- 광고  사진 틀-->
								<div class="ad-pic-tle">
									<c:url var="path" value="itemViewPage.do">
										<c:param name="itemId" value="${dto.itemId }" />
									</c:url>
									<a class="ad-rink" href="${path}"> <!-- 광고 사진 -->
										<div class="ad-pic">
											<img src="/sapare/img/${dto.itemImagePath}" width="155" height="155"
												onerror="this.src='image/quokka.jpg'" alt="상품 이미지">
											<div class="ad-pic2"></div>
										</div>
										<div class="ad-pic-title">"${dto.itemName}"</div>
									</a>
								</div>
								<!-- <div class="ad-pic-tle">
							<a class="ad-rink"
								href="http://localhost:8090/sapare/mainPage.do"> 광고 사진
								<div class="ad-pic">
									<img src="image/carrier.jpg" width="155" height="155"
										alt="상품 이미지">
									<div class="ad-pic2"></div>
								</div>
								<div class="ad-pic-title">펭수가방</div>
							</a>
						</div>
						<div class="ad-pic-tle">
							<a class="ad-rink"
								href="http://localhost:8090/sapare/mainPage.do"> 광고 사진
								<div class="ad-pic">
									<img src="image/carrier.jpg" width="155" height="155"
										alt="상품 이미지">
									<div class="ad-pic2"></div>
								</div>
								<div class="ad-pic-title">펭수사진</div>
							</a>
						</div>
						<div class="ad-pic-tle">
							<a class="ad-rink"
								href="http://localhost:8090/sapare/mainPage.do"> 광고 사진
								<div class="ad-pic">
									<img src="image/carrier.jpg" width="155" height="155"
										alt="상품 이미지">
									<div class="ad-pic2"></div>
								</div>
								<div class="ad-pic-title">펭수그림</div>
							</a>
						</div>
						<div class="ad-pic-tle">
							<a class="ad-rink"
								href="http://localhost:8090/sapare/mainPage.do"> 광고 사진
								<div class="ad-pic">
									<img src="image/carrier.jpg" width="155" height="155"
										alt="상품 이미지">
									<div class="ad-pic2"></div>
								</div>
								<div class="ad-pic-title">펭수ㅗ</div>
							</a>
						</div> -->
						</c:if>
							</c:forEach>
						</div>
					</form>
				</div>
			</div>
			<!-- 세번째 섹션 -->
			<div class="third-section">
				<!-- 세번째 섹션 틀 -->
				<div class="third-section-tle">
					<!-- 상품정보 및 설명 틀 -->
					<div class="more-info-tle">
						<!-- img-nik 틀 -->
						<div class="img-nik-tle">
							<!-- img-nik2 틀 -->
							<div class="img-nik2-tle">
								<!-- 회원 이미지-->
								<div class="member-img">
									<input hidden="hidden" id="sellerName"
										value="${member.memberName }" /> <a
										href="profileSell.do?memberName=${member.memberName }"> <img
										src="image/${member.profileImg }"
										onerror="this.src='image/default.png'" width="80" height="80"
										alt="회원 이미지" style="object-fit: cover;">
									</a>
								</div>
								<!-- 회원 닉네임 등급 틀 -->
								<div class="nik-rank-tle">
									<a href="profileSell.do?memberName=${member.memberName }">
										<div class="nik">${member.nickname }</div>
										<div class="rank">${memberStat.memberRank }</div>
									</a>
								</div>
							</div>
						</div>
						<!-- 상품 정보 -->
						<div class="more-info-title">상품정보</div>
						<!-- 상품 내용 -->
						<div class="more-info-content" id="itemAbout">${item.itemAbout }</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<jsp:include page="footer.jsp" flush="false" />
</html>