<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글보기</title>
<style type="text/css">
	#deletePwDiv{display: none;}
	#updatePwDiv{display: none;}
	.chat{list-style: none;}
</style>

<script type="text/javascript">
$(function(){
	// 게시판 글보기의 이벤트처리
	$("#deleteBtn").click(function(){
		$("#deleteBtn").hide();
		$("#updateBtn").hide();
		$("#listBtn").hide();
		$("#deletePwDiv").show();
		return false;
	});

	$(".cancelBtn").click(function(){
		$("#deleteBtn").show();
		$("#updateBtn").show();
		$("#listBtn").show();
		
		$("#updatePw").val('');
		$("#deletePw").val('');

		$("#deletePwDiv").hide();
		$("#updatePwDiv").hide();

		return false;
	});

	$("#realDeleteBtn").click(function(){
		if( $("#deletePw").val() == ${dto.pw}){
			alert("삭제 되었습니다.");
		}else {
			alert("비밀번호를 다시 확인해 주세요");
			return false;
		}
	});

	$("#updateBtn").click(function(){
		$("#deleteBtn").hide();
		$("#updateBtn").hide();
		$("#listBtn").hide();
		$("#updatePwDiv").show();
		return false;
	});

	$("#realUpdateBtn").click(function(){
		if( $("#updatePw").val() == ${dto.pw}){
			
		}else {
			alert("비밀번호를 다시 확인해 주세요");
			return false;
		}
	});
});
</script>
</head>
<body>
<!-- 데이터 표시하는 부분 : Bootstrap 쉽게 표시 : 라이브러리 필요 -> sitemesh에서 처리 -->
<!-- <div class="container"> -->
	<!-- 제목 -->
	<h1>게시판 글보기</h1>
	<!-- 데이터 테이블 -->
	<!-- bootstrap 적용 : w3schools.com 참조
		: 1. 라이브러리 등록 , 2.body안에 container 3. 그외필요한 객체 => tag 안에 class -->
	<table class="table">
		<tr>
			<th>글번호</th>
			<td>${dto.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td><pre>${dto.content }</pre></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>
				<fmt:formatDate value="${dto.writeDate }" pattern="yyyy.MM.dd" />
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${dto.hit }</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="update.do?no=${dto.no }"
					role="button" class="btn btn-default" id="updateBtn">수정</a>
				<a href="" id="deleteBtn"
					role="button" class="btn btn-default">삭제</a>
				<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum }
						&key=${param.key }&word=${param.word}"
				    role="button" class="btn btn-default" id="listBtn">목록보기</a>
				<div id="deletePwDiv">
					<form action="delete.do" method="post">
						<input type="hidden" name="no"
						 value="${dto.no}" />
						<!-- 비밀번호 : 확인용 비밀번호는 안보이게 처리 -->
						<div class="form-group">
							<label for="pw">비밀번호 : 본인 확인용</label>
							<input type="password" class="form-control" id="deletePw" name="pw"
								autocomplete="off"
								title="비밀번호는 4~20 글자 사이로 입력하셔야 합니다." pattern="^.{4,20}$">
						</div>
						<button id="realDeleteBtn">삭제</button>
						<button class="cancelBtn" type="button">취소</button>
					</form>
				</div>
				
				<div id="updatePwDiv">
					<form action="update.do?no=${dto.no }" method="get">
						<input type="hidden" name="no" value="${dto.no}" />
						<!-- 비밀번호 : 확인용 비밀번호는 안보이게 처리 -->
						<div class="form-group">
							<label for="pw">비밀번호 : 본인 확인용</label>
							<input type="password" class="form-control" id="updatePw" name="pw"
								autocomplete="off"
								title="비밀번호는 4~20 글자 사이로 입력하셔야 합니다." pattern="^.{4,20}$">
						</div>
						<button id="realUpdateBtn">수정</button>
						<button class="cancelBtn" type="button">취소</button>
					</form>
				</div>
			</td>
		</tr>
		
	</table>
<!-- </div> -->

</body>
</html>