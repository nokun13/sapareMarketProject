<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<!--일반 경매 상품  -->
<html>
<head>
<meta charset="UTF-8">
<title>상품조회</title>
<link rel="stylesheet" href="css/itemViewPage2.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
							src="image/itemViewPage/home.jpg" width=20px; height=20px alt="홈">
							홈</a>
					</div>
					<!-- 첫번째 카테고리 구역 -->
					<div class="ctg1-section">
						<img src="image/itemViewPage/loc.jpg" width=15px; height=15px;
							alt="카테고리 선택 아이콘">
						<!-- 첫번째 카테고리 창 길이 -->
						<div class="ctg1-width">
							<!-- 첫번째 카테고리 틀 -->
							<div class="ctg1-tle">
								<!-- 카테고리 옵션 -->
								<div class="ctg1-op">
									경매 <img src="image/itemViewPage/down.jpg" width=20px;
										height=15px; alt="카테고리 화살표 아이콘" />
								</div>

								<!-- 카테고리 선택창 -->
								<!-- <div class="ctg1-dropdown">
                           <a href="">여성의류</a>
                           <a href="">남성의류</a>
                           <a href="">도서</a>    </div>-->

							</div>
						</div>
					</div>


				</div>
			</div>

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
								<img src="image/itemViewPage/carrier.jpg" class="sc-pic" />
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
									<div class="title">펭수가방</div>
									<!-- 시작가 -->
									<div class="start-m">시작가</div>
									<!-- 가격  틀-->
									<div class="price-tle">
										<!-- 가격 -->
										<div class="price">
											750.000<span>원</span>
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
												<img src="image/itemViewPage/sa.png" width=16px;
													height=16px; alt="상품 상태 아이콘">
												<div class="sa-count">1</div>
											</div>
											<!-- 조회수 틀 -->
											<div class="co-tle">
												<img src="image/itemViewPage/eye.jpg" width=16px;
													height=16px; alt="상품 상태 아이콘">21
											</div>
											<!-- 올린 날짜 틀 -->
											<div class="date-tle">
												<img src="image/itemViewPage/date.jpg" width=16px;
													height=16px; alt="상품 상태 아이콘">10월 27일
											</div>
										</div>
										<!-- 신고하기 버튼 -->
										<button class="declaration">
											<img src="image/itemViewPage/declaration.png" width=15px;
												height=15px; alt="신고 아이콘">신고하기
										</button>
									</div>
									<!-- 상품상태 전체 틀 -->
									<div class="item-state-tle">
										<div class="item-one-tle">
											<!-- 상품 상태 정보  -->
											<div class="item-info">거래지역</div>
											<!-- 상품 상태 -->
											<div class="item-st">서울특별시/구로구</div>
										</div>
										<!-- 상품 한줄 틀 -->
										<div class="item-one-tle">
											<!-- 상품 상태 정보  -->
											<div class="item-info">상품상태</div>
											<!-- 상품 상태 -->
											<div class="item-st">경매</div>
										</div>
									</div>
								</div>
								<!-- 경매 바 틀 -->
								<div class="auc-bar-tle">
									<!-- 경매 남은시간 문구 틀  -->
									<div class="auc-timer-info-tle">
										<div class="auc-timer">00:00:00</div>
										<div class="auc-info">마감까지 남은 시간</div>
									</div>
								</div>
								<!-- 현재가 틀 -->
								<div class="present-price-tle">
									<!-- 현재가 문구 -->
									<div class="present-price">현재가 790.000원</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 입찰하기 구역 -->
			<div class="bid-section">
				<!-- 입찰 구역 설정 -->
				<div class="bid-set">
					<div class="bid-title">입찰하기</div>
					<!-- 입찰관련 버튼  -->
					<div class="bid-count-set">
						<div class="des-div">
							<button class="des" type="button">-</button>
						</div>
						<input type="text" class="bid-price-set" value="2400">
						<div class="des-ins">
							<button class="ins" type="button">+</button>
						</div>
						<div class="text-tle">
							<button class="bid" type="button">입찰하기</button>
						</div>
					</div>
				</div>
				<!-- 입찰 현황 설정 -->
				<div class="bid-state-set">
					<div class="bid-content">
						<table class="bid-table">
							<thead>
								<tr>
									<th colspan="3">입찰 내역 (최근 입찰 순)</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<!-- 경매 진행 틀 -->
				<div class="content-tle">
					<table id="content">
						<tr>
							<th>회원 닉네임</th>
							<th>금액</th>
							<th>시간</th>
						</tr>
						<tr>
							<td>오징어</td>
							<td>8000000</td>
							<td>20201021112030</td>
						</tr>
						<tr>
							<td>오용</td>
							<td>9000000</td>
							<td>20201021112130</td>
						</tr>
						<tr>
							<td>용가리</td>
							<td>10000000</td>
							<td>20201021112230</td>
						</tr>
						<tr>
							<td>쭌</td>
							<td>11000000</td>
							<td>20201021112300</td>
						</tr>
					</table>
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
							연관상품
							<!-- 광고 틀 -->
							<div class="ad-tle">AD</div>
							<img src="image/itemViewPage/ad.png" alt="AD 가이드" width="16"
								height="16" style="margin-top: 6px;">
						</div>
					</div>
					<!-- 광고 사진 전체 틀 -->
					<div class="ad-pic-all-tle">
						<!-- 광고  사진 틀-->
						<div class="ad-pic-tle">
							<a class="ad-rink"
								href="http://localhost:8090/sapare/mainPage.do"> <!-- 광고 사진 -->
								<div class="ad-pic">
									<img src="image/itemViewPage/carrier.jpg" width="155"
										height="155" alt="상품 이미지">
									<div class="ad-pic2"></div>
								</div>
								<div class="ad-pic-title">펭수캐리어</div>
							</a>
						</div>
						<div class="ad-pic-tle">
							<a class="ad-rink"
								href="http://localhost:8090/sapare/mainPage.do"> <!-- 광고 사진 -->
								<div class="ad-pic">
									<img src="image/itemViewPage/carrier.jpg" width="155"
										height="155" alt="상품 이미지">
									<div class="ad-pic2"></div>
								</div>
								<div class="ad-pic-title">펭수가방</div>
							</a>
						</div>
						<div class="ad-pic-tle">
							<a class="ad-rink"
								href="http://localhost:8090/sapare/mainPage.do"> <!-- 광고 사진 -->
								<div class="ad-pic">
									<img src="image/itemViewPage/carrier.jpg" width="155"
										height="155" alt="상품 이미지">
									<div class="ad-pic2"></div>
								</div>
								<div class="ad-pic-title">펭수사진</div>
							</a>
						</div>
						<div class="ad-pic-tle">
							<a class="ad-rink"
								href="http://localhost:8090/sapare/mainPage.do"> <!-- 광고 사진 -->
								<div class="ad-pic">
									<img src="image/itemViewPage/carrier.jpg" width="155"
										height="155" alt="상품 이미지">
									<div class="ad-pic2"></div>
								</div>
								<div class="ad-pic-title">펭수그림</div>
							</a>
						</div>
						<div class="ad-pic-tle">
							<a class="ad-rink"
								href="http://localhost:8090/sapare/mainPage.do"> <!-- 광고 사진 -->
								<div class="ad-pic">
									<img src="image/itemViewPage/carrier.jpg" width="155"
										height="155" alt="상품 이미지">
									<div class="ad-pic2"></div>
								</div>
								<div class="ad-pic-title">펭수ㅗ</div>
							</a>
						</div>
					</div>
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
									<img src="image/itemViewPage/log.png" width="80" height="80"
										alt="회원 이미지">
								</div>
								<!-- 회원 닉네임 등급 틀 -->
								<div class="nik-rank-tle">
									<div class="nik">회원닉네임</div>
									<div class="rank">회원등급</div>
								</div>
							</div>
						</div>
						<!-- 상품 정보 -->
						<div class="more-info-title">상품정보</div>
						<!-- 상품 내용 -->
						<div class="more-info-content">한정판 펭수 캐리어입니다. 있을 때 사세요
							ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ 한정판 펭수 캐리어입니다. 있을 때 사세요 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ
							한정판 펭수 캐리어입니다. 있을 때 사세요 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ 한정판 펭수 캐리어입니다. 있을 때
							사세요 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ 한정판 펭수 캐리어입니다. 있을 때 사세요
							ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ 한정판 펭수 캐리어입니다. 있을 때 사세요 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ
							한정판 펭수 캐리어입니다. 있을 때 사세요 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ 한정판 펭수 캐리어입니다. 있을 때
							사세요 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ 한정판 펭수 캐리어입니다. 있을 때 사세요
							ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>