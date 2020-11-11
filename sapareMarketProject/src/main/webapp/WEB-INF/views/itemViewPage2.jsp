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
<script src="js/itemViewPage2.js" type="text/javascript"></script>
</head>

<body>
	<jsp:include page="header.jsp" />
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
							src="sapare/img/home.jpg" width=20px; height=20px alt="홈">
							홈</a>
					</div>
					<!-- 첫번째 카테고리 구역 -->
					<div class="ctg1-section">
						<img src="sapare/img/loc.jpg" width=15px; height=15px;
							alt="카테고리 선택 아이콘">
						<!-- 첫번째 카테고리 창 길이 -->
						<div class="ctg1-width">
							<!-- 첫번째 카테고리 틀 -->
							<div class="ctg1-tle">
								<!-- 카테고리 옵션 -->
								<div class="ctg1-op">
									경매 <img src="sapare/img/down.jpg" width=20px;
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
								<img src="sapare/img/${list.itemImagePath }" class="sc-pic" />
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
									<div class="title">${list.itemName }</div>
									<!-- 시작가 -->
									<div class="start-m">시작가</div>
									<!-- 가격  틀-->
									<div class="price-tle">
										<!-- 가격 -->
										<div class="price">
											${list.itemPrice }<span>원</span>
										</div>
									</div>
								</div>
								<!-- 상태 보이는 틀 -->
								<div class="state-show-tle">
									<!-- 찜 조회수 올린날짜 신고 틀-->
									<div class="sa-co-date-de-tle">
										<!-- 찜 조회수 올린날짜 틀 -->
										<div class="sa-co-date-tle">
											<!-- 조회수 틀 -->
											<div class="co-tle">
												<img src="sapare/img/eye.jpg" width=16px;
													height=16px; alt="상품 상태 아이콘">${list.itemViewCnt }
											</div>
											<!-- 올린 날짜 틀 -->
											<div class="date-tle">
												<img src="sapare/img/date.jpg" width=16px;
													height=16px; alt="상품 상태 아이콘">${list.itemUploadPath }
											</div>
										</div>
										<!-- 신고하기 버튼 -->
										<button id="decl-btn" class="declaration">
											<img src="sapare/img/declaration.png" width=15px;
												height=15px; alt="신고 아이콘">신고하기
										</button>
										<div id="decl-modal" class="modal">
											<div class="modal-content">
												<span class="close">&times;</span>
												<div class="auto">
													<span class="decl-title">신고하기</span>
												</div>
												<!-- 신고 전체 틀 -->
												<div class="decl-content-all-tle">
													<!-- 신고 틀 -->
													<div class="decl-content-tle">
														<div class="span-decl-content1">
															<span>광고(상점홍보, 낚시글, 도배글)</span>
														</div>
														<div class="1" id="sp">
															<div class="decl-conform">
																<input class="decl-conform-input" type="text"
																	placeholder="사유" />
																<button type="button">등록</button>
															</div>
														</div>
													</div>
													<div class="decl-content-tle">
														<div class="span-decl-content2">
															<span>물품정보 부정확(카테고리, 가격, 사진)</span>
														</div>
														<div class="2" id="sp">
															<div class="decl-conform">
																<input class="decl-conform-input" type="text"
																	placeholder="사유" />
																<button type="button">등록</button>
															</div>
														</div>
													</div>
													<div class="decl-content-tle">
														<div class="span-decl-content3">
															<span>거래 금지 품목(담배, 주류, 장물)</span>
														</div>
														<div class="3" id="sp">
															<div class="decl-conform">
																<input class="decl-conform-input" type="text"
																	placeholder="사유" />
																<button type="button">등록</button>
															</div>
														</div>
													</div>
													<div class="decl-content-tle">
														<div class="span-decl-content4">
															<span>언어폭력(비방, 욕설, 성희롱)</span>
														</div>
														<div class="4" id="sp">
															<div class="decl-conform">
																<input class="decl-conform-input" type="text"
																	placeholder="사유" />
																<button type="button">등록</button>
															</div>
														</div>
													</div>
													<div class="decl-content-tle">
														<div class="span-decl-content5">
															<span>기타사유(직접입력)</span>
														</div>
														<div class="5" id="sp">
															<div class="decl-conform">
																<input class="decl-conform-input" type="text"
																	placeholder="사유" />
																<button type="button">등록</button>
															</div>
														</div>
													</div>
												</div>
											</div>

										</div>

									</div>
									<!-- 상품상태 전체 틀 -->
									<div class="item-state-tle">
										<div class="item-one-tle">
											<!-- 상품 상태 정보  -->
											<div class="item-info">거래지역</div>
											<!-- 상품 상태 -->
											<div class="item-st">${list.itemCity }</div>
										</div>
										<!-- 상품 한줄 틀 -->
										<div class="item-one-tle">
											<!-- 상품 상태 정보  -->
											<div class="item-info">상품분류</div>
											<!-- 상품 상태 -->
											<div class="item-st">${list.itemType }</div>
										</div>
									</div>
								</div>
								<!-- 경매 바 틀 -->
								<div class="auc-bar-tle">
									<!-- 경매 남은시간 문구 틀  -->
									<div class="auc-timer-info-tle">
										<div class="auc-timer" id="countdown"></div>
										<div class="auc-info">마감까지 남은 시간</div>
									</div>
								</div>
								<!-- 현재가 틀 -->
								<div class="present-price-tle">
									<!-- 현재가 문구 -->
									<div class="present-price">현재가 ${itemPrice }원</div>
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
						<input type="text" class="bid-price-set" value="2400" >
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
						<!-- 경매구매자 리스트 가져오기 -->
						<c:forEach items="${auctionList }" var="dto">
							<tr>
								<td>${dto.buyerName }</td>
								<td>${dto.auctionCallPrice }</td>
								<td>${dto.auctionDate }</td>
							</tr>
						</c:forEach>
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
							<img src="sapare/img/ad.png" alt="AD 가이드" width="16"
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
									<img src="sapare/img/carrier.jpg" width="155"
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
									<img src="sapare/img/carrier.jpg" width="155"
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
									<img src="sapare/img/carrier.jpg" width="155"
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
									<img src="sapare/img/carrier.jpg" width="155"
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
									<img src="sapare/img/carrier.jpg" width="155"
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
									<a href="profileSell.do">
									<img src="sapare/img/${list.profileImg }" width="80" height="80"
										alt="회원 이미지">
									</a>
								</div>
								<!-- 회원 닉네임 등급 틀 -->
								<div class="nik-rank-tle">
									<div class="nik">${list.nickname }</div>
									<div class="rank">${list.memberRank }</div>
								</div>
							</div>
						</div>
						<!-- 상품 정보 -->
						<div class="more-info-title">상품정보</div>
						<!-- 상품 내용 -->
						<div class="more-info-content">${list.itemAbout }</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
<jsp:include page="footer.jsp" />
</html>