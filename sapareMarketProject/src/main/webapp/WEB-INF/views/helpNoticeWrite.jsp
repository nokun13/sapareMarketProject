<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>

<style type="text/css">
#title {
 	height: 16; 
	font-size: 20px;
	text-align: center;
	margin-top: 50px;
	/* border-left: 1px solid white; */
	border-top: 1px solid white;
	color : #0484f6;
	
	
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
	margin-left:250px;
    font : bold;
    margin-top : 50px;
    margin-bottom: 50px;
}

 #btn{
border-bottom: 1px solid white;
}  

 .modi, .canc {
background: none;
background-color: #0484f6;
font-size: 12px;
font-weight: bold;
color:white;
border: none;
width: 50px;
height: 30px;}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('select[name="board_category"]').val('${dto.boardCategory}');
	
	$('.canc').on('click',function(){
		$('form').attr('action','helpPage.do');
		$('form').submit();
	});

	$('.modi').on('click',function(){
		$('#frm').attr('action', 'helpNoticeWrite.do');
		$('#frm').submit();
	});




	});

</script>

</head>

<body>

		
		
	<form name="frm" id="frm" method="post">
		
		
		<table id="write"  border="1" bordercolor="gray"
			align="center">
			
			<tr>
				<th id="title">작성자</th>
				<td style="font-size: 20px; font-weight:700;">${boardDTO.memberName}</td>
			</tr>
			<tr>
				<th id="title">제 목</th>
				<td id="textsb"><input name="boardTitle" type="text"
					style="border : 0 solid black" size="70" maxlength="100" " /></td>
			</tr>
			<tr>
				<th id="title">카테고리</th>
				<td id ="textcate">
				<select name="boardCategory" >
					<option id="공지사항" value="공지사항">공지사항</option>
					<option id="자주묻는질문" value="자주묻는질문">자주묻는질문</option>
				
				</select>
				</td>
			</tr>
			<tr>
				<th id="title">내 용</th>
				<td id="textct"><textarea name="boardContent" style="border : 0 solid black" cols="172"
						rows="30"></textarea></td>
			</tr>
			
			<tr align="center" valign="middle">
				<td colspan="5" id="btn"><input class="modi" type="button" value="등록">  <input class="canc" type="button" value="취소" >
				
				</td>
			</tr>
		</table>
	
	</form>
	

</body>
</html>