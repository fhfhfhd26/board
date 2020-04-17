<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>SONG's BOARD</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>	

<style>
.center{
	text-align: center;
}

.dataRow:hover {
	background: #eee;
	cursor: pointer; 
}

</style>
</head>

<body>
<script type="text/javascript">
$(function(){
	$(".dataRow").click(function(){
		// 글번호 찾기 - 클릭한 것(this=tr) 안에 글번호 클래스 객체(td) 안에 글자(text)
		var no = $(this).find(".no").text();
		// 글보기로 이동 - 글번호를 붙여서
		location = "view.do?no=" + no;
	});
});
</script>

<h1>
	SONG's BOARD!  
</h1>

<div class="container">
	<table class="table">
		<tr class="center">
			<th class="center">번   호</th>
			<th class="center">제   목</th>
			<th class="center">작성자</th>
			<th class="center">작성일</th>
			<th class="center">조회수</th>
		</tr>
	
		<c:forEach items="${list }" var="dto">
			<tr class="dataRow">
				<td class="no center">${dto.no }</td>
				<td>${dto.title }</td>
				<td class="center">${dto.writer }</td>
				<!-- 날짜형을 특별한 형식에 맞춰서 출력 : JSTL - fmt : JAVA-SimpleDateFormat -->
				<td class="center"> <fmt:formatDate value="${dto.writeDate }" pattern="yyyy.MM.dd" /> </td>
				<td class="center">${dto.hit }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="write.do"><button>글쓰기</button></a>
</div>
</body>
</html>
