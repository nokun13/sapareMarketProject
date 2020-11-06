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
								<!-- 카테고리 옵션 -->
								<div class="ctg1-op">
									패션잡화 <img src="image/down.jpg" width=20px; height=15px;
										alt="카테고리 화살표 아이콘" />
									<!-- 카테고리 선택창 -->
									<div class="ctg1-dropdown">
										<a href="">여성의류</a> <a href="">남성의류</a> <a href="">도서</a>

									</div>
								</div>

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
								<div class="ctg2-op">
									여행용가방/소품 <img src="image/down.jpg" width=20px; height=15px;
										alt="카테고리 화살표 아이콘" />
									<!-- 카테고리 선택창 -->
									<div class="ctg2-dropdown">
										<a href="">여성의류</a> <a href="">남성의류</a> <a href="">도서</a>

									</div>
								</div>

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
								<div class="ctg3-op">
									소프트캐리어 <img src="image/down.jpg" width=20px; height=15px;
										alt="카테고리 화살표 아이콘" />
									<!-- 카테고리 선택창 -->
									<div class="ctg3-dropdown">
										<a href="">여성의류</a> <a href="">남성의류</a> <a href="">도서</a>

									</div>
								</div>
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
												<div class="item-st" id="itemBigCat">${itemCat.itemBigCat }</div>
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
											<img src="image/${dto.itemImagePath}" width="155" height="155"
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