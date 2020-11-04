<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
/* 푸터부분 */
footer {
	display: flex;
	min-height: 300px;
	flex-direction: column;
	border-top: 1px solid grey;
}

#footer_wrap {
	top: 0;
	left: 0;
	right: 0;
	height: 128px;
	width: 1300px;
	min-width: 1300px;
	margin: 0 auto;
}
address {
	float: none;
	padding-left: 250px;
}

#bottom_1, #bottom_2, #bottom_3, #bottom_4 {
	float: left;
	margin-left: 135px;
}

#bottom_1 dt, #bottom_2 dt, #bottom_3 dt, #bottom_4 dt {
	font-weight: bold;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
</body>
<footer>
	<div id="footer_wrap">
		<div id="inner_footer">
			<dl id="bottom_1">
				<dt>안내문</dt>
				<br>
				<dd>1234-1234</dd>
				<dd>평일 09:00~18:00</dd>
				<dd>점심 13:00~14:00</dd>
				<dd>휴무 (토, 일, 공휴일)</dd>
			</dl>
			<dl id="bottom_2">
				<dt>은행</dt>
				<br>
				<dd>농협 123-123-123</dd>
				<dd>신한 1234-1234-12</dd>
				<dd>국민 123456-12345</dd>
				<dd>예금주 (주)사파리</dd>
			</dl>
			<dl id="bottom_3">
				<dt>배송관련</dt>
				<br />
				<dd>배송문의</dd>
				<dd>반품주소</dd>
				<dd>서울특별시 구로구 구로동</dd>
				<dd>시흥대로163길 33 주호타워 2층</dd>
			</dl>
			<dl id="bottom_4">
				<dt>자주하는 질문</dt>
				<br />
				<dd>
					<a href="helpFAQ.do">자주하는 질문</a>
				</dd>
				<dd>
					<a href="helpPage.do">공지사항</a>
				</dd>
				<dd>
					<a href="helpPage.do">Q&A</a>
				</dd>
			</dl>
		</div>
		<address>
			<img
				alt="대표 OOO 사업자등록번호 000-00-0000 통신판매업신고 2020-0000-0000 대표전화 (02) 000-0000 팩스 (02) 000-000 이매일 00000@naver.com 주소 서울특별시 구로구 구로동 시흥대로 163길 33주호타워 2층,3층"
				src="image/address.png">
		</address>
	</div>

</footer>
</html>