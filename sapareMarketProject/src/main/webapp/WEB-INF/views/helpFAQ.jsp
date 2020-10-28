<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>
<style type="text/css">
.notice {
	padding-bottom: 5px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	font-weight: 600;
	position: relative;
	color: black;
	float: left;
	/* border-bottom: 2px solid rgb(255, 80, 88); */
	width: 400px;
	font-size: 18px;
}

.faq {
    font-size: 18px;
	padding-bottom: 5px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	font-weight: 600;
	justify-content: center;
	color: #FF0000;
	width: 400px;
	text-align: center;
    border-bottom: 3px solid #FF0000; 
}

a {
	cursor: pointer;
	text-decoration: none;
}

.menu1 {
	display: flex;
	justify-content: center;
}

.menu {
	height: 44px;
	display: block;
	background: rgb(255, 255, 255);
}

.wrap1 {
	margin-top: 100px;
	margin-bottom: 5px;
	display: flex;
	justify-content: center;
}

.no1 {
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: flex-start;
	font-size: 14px;
	flex: 1 1 0%;
}

.notice1 {
	padding: 0px 20px;
	height: 75px;
	width: 850px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	background: rgb(255, 255, 255);
	border-bottom: 1px solid rgb(238, 238, 238);
	border: 1px solid rgb(238, 238, 238);
	justify-content: center;
	cursor: pointer;
	-webkit-box-align: center;
	
}

h3, time {
	text-align: left;
}

ul, li {
	list-style: none;
}

li {
	display: flex;
	justify-content: center;
}

.no2 {
	margin-top: -5px;
	color: rgb(153, 153, 153);
	font-weight: 400;
}

.no_1 {
	padding: 0px;
	height: auto;
	width: 892px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	background: rgb(255, 255, 255);
	justify-content: center;
	cursor: pointer;
	background-color: rgb(238, 238, 238);
}

.no__1 {
	padding-left: 20px;
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: flex-start;
	font-size: 16px;
	flex: 1 1 0%;
	text-align: left;
}

.writepage {
	margin-left: 800px;
	text-align: right;
	margin-left: 800px;
	background: none;
	border: none;
	cursor: pointer;
}

.write {
	margin-top: -32px;
	margin-bottom: 5px;
}

.modify {
    float:left;
	text-align: right;
	border: none;
	background: none;
	cursor: pointer;
	margin-top: -4px;
}
.no2 {
}

form {
display: inline;}

.table {
display:flex;
justify-content: center;
}

.no_1{
overflow: auto;}
.hh {
	margin-top: 50px;
	display: flex;
	justify-content: center;
	display: flex;
}

#myBtn {
	width: 200px;
	height: 10px;
	background-color: white;
	color: #29ABE2;
	border: none;
	font-weight: bolder;
	font-size: 15px;
	cursor: pointer;
}

.ask {
	font-size: 14px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 23%;
	height: 53%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.emailid {
	margin-top: 12%
}

input[type=email]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

.contenttext {
  width: 100%;
  height:95%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
  outline: none;
  resize: none;
}
.content_area{
height: 63%;
}

.ll{
display: grid;
height: 50px;
margin-bottom: 15px;
}

.modalbtn{
background-color: #29ABE2;
color:white;
font-size:18px;
font-weight: bolder;
border: 1px solid #29ABE2;
cursor: pointer;
outline: none;

}

.mm{
	margin-top: 30px;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	  $(".no_1").hide(); 
	  $(".notice1").click(function(){
	    $(this).next().slideToggle("slow");
	  });
	  $('#myBtn').on('click', function() {
			$(".modal").css("display", "block");
		});

		$('.close').on('click', function() {
			$(".modal").css("display", "none");
		});
		$('.modalbtn').on('click', modalRun);
	
	});
	
function modalRun() {
	$('.mo').attr('action', 'helpPage.do').submit();
}////////////////
</script>
</head>
<body>
<jsp:include page="header.jsp" flush="false" />
	<div class="wrap1">
		<div class="menu">
			<nav class="menu1">
				<a class="notice" href="http://localhost:8090/sapare/helpPage.do">공지사항
				</a> <a class="faq" href="http://localhost:8090/sapare/helpFAQ.do">자주묻는질문</a>
			</nav>
		</div>
	</div>

	<ul class="mm">
		<li class="write">
			<form id="frm" name="frm" method="get" action="helpNoticeWrite.do">
				<input class="writepage" type="submit" value="글쓰기" />
			</form>
		</li>
	</ul>

 <c:forEach items="${boardList}" var="dto">	
	<table class="table">
	<tr class="notice1">
	<c:url var="path" value="helpNoticeUpdate.do">
	<c:param name="num" value="${dto.boardNo}"/>
	</c:url>
	<c:url var="path2" value="delete.do">
	<c:param name="num" value="${dto.boardNo}"/>
	</c:url>
	<th class="no1"> ${dto.boardTitle}</th>
	<th> ${dto.boardDate}</th>
	</tr>
	
	 
	<tr class="no_1">
	<th class="no__1"><p style="white-space: pre-line;">${dto.boardContent}</p></th>
	<form id="frm" name="frm" method="get" >
	<th><a href="${path}">
						수정</a></th> 
	<th><a href="${path2}">
						삭제</a></th> 
	</form>
	</tr>

		
	</table>
	</c:forEach>
	<div class="hh">
		<div class="ask">
			&nbsp;&nbsp;&nbsp;그래도 해결이 안되시나요?<br />
			<button type="button" id="myBtn">고객센터에 문의하기</button>
		</div>
	</div>

	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
				<form class="mo" method="post">
					<div class="emailid">아이디(이메일)</div>
					<div class="email_area">
						<input type="email" value="" class="email_sign"
							placeholder="이메일 주소 입력" name="qEmail">
					</div>

					<div class="content">문의 내용</div>
					<div class="content_area">
						<textarea class="contenttext"rows="21" cols="70"  name="qContent" placeholder="문의 내용 입력"></textarea>
					</div>
<div class="ll">
<input type="button" value="문의하기" class="modalbtn"/>

</div>
				</form>
		</div>
	</div>

</body>
</html>