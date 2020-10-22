<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('.list').on('click', backRun);
		$('.upt').on('click', updateRun);

	/* 	$('.del').on('click', function() {
			$('form').attr('action', 'delete.do');
			$('form').submit();
		}); */
	});

	function backRun() {
		//history.back();
		$('#frm').attr('action', 'helpPage.do').submit();
	}
	function updateRun() {
		$('#frm').attr('action', 'helpNoticeUpdate.do').submit();
	}
</script>
<style type="text/css">
#title {
	height: 16;
	font-family: '돋움';
	font-size: 20px;
	text-align: center;
	margin-top: 50px;
	/* border-left: 1px solid white; */
	border-top: 1px solid white;
	color: #9D5CBB;
}

#textsb {
	text-align: left;
}

#textct {
	text-align: left;
}

#write {
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-top: 1px solid white;
	margin-left: 250px;
	font: bold;
	margin-top: 50px;
	margin-bottom: 50px;
}

#btn {
	border-bottom: 1px solid white;
}

#num {
	display: none;
}

#commenttitle {
	margin-left: 300px;
	margin-bottom: 15px;
	color: #9D5CBB;
	font-size: 22px;
	font-weight: bold;
}

#commentta {
	margin-left: 280px;
	margin-bottom: 100px;
	border: 1.5px solid #cccccc;
	width: 1500px;
	height: 150px;
	background-color: #E8F5FF;
}

#commentta td {
	color: #666666;
	font-size: 18px;
	font-weight: bold;
	text-align: left;
}

#commentta td:nth-child(1) {
	padding-left: 30px;
	width: 200px;
}

.upt, .list, .del {
	cursor: pointer;
	background-color: #0484f6;
	color: white;
	border: none;
}
</style>

</head>
<%-- <%
	String id = (String) session.getAttribute("id");
	/* 	memberDAO dao = memberDAO.getInstance();
		memberDTO dto = dao.getMember(id);
		qnaDAO qdao = qnaDAO.getInstance(); */

	String num = (String) session.getAttribute("num");
	/* 	qnaDAO dao = qnaDAO.getInstance();
		b_qnaDTO dto = dao.viewMethod(num); */
%> --%>
<body>


<form name="frm" id="frm" method="post">
	<table id="write" border="1" bordercolor="gray" align="center">
		<tr>
			<th id="title">작성자</th>
			<td>${boardList.memberName}</td>
		</tr>
		<tr>
			<th id="title">제 목</th>
			<td id="textsb" colspan="3"><textarea name="boardTitle"
					style="border: 0 solid black" cols="172" rows="1">${boardList.boardTitle}</textarea></td>
		</tr>
		<tr>
			<th id="title">${boardList.boardCategory}</th>
			<td id="textcate"></td>
		</tr>
		<tr>
			<th id="title">내 용</th>
			<td id="textct"><textarea name="boardContent"
					style="border: 0 solid black" cols="172" rows="30">${boardList.boardContent}</textarea></td>
		<tr align="center" valign="middle">

			<td colspan="5" id="btn">
				
					<input type="hidden" name="boardNo" value="${boardList.boardNo}" /><input
						type="hidden" name="memberName" value="${boardList.memberName}" />
						<input type="hidden" name="boardCategory" value="${boardList.boardCategory }"/><input
						type="button" value="수정" class="upt"> <input type="button"
						value="목록" class="list"> 
						
				
			</td>
		</tr>
	</table>
</form>



</body>
</html>