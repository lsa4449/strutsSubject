<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="paginationMenu" value="${pagination }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
<script type="text/javascript">
$(function(){
	$('#freeboardTBY tr').click(function(){
		var post_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		
		$(location).attr('href', '${pageContext.request.contextPath }/user/noticeBoard/noticeBoardView.do?post_no=' + post_no +'&rnum=' + rnum);
	});
});

</script>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">공지사항 게시판</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="select">No</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id="freeboardTBY">
			<c:forEach var="item" items="${noticeboardList}">
				<tr>
					<td><input type="hidden" value="${item['POST_NO']}">${item['RNUM']}</td>
					<td>${item['POST_TITLE']}</td>
					<td>${item['MEM_NAME']}</td>
					<td>${item['POST_DATE']}</td>
					<td>${item['POST_HIT']}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<form action="${pageContext.request.contextPath }/user/noticeBoard/noticeBoardList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
		<!-- 	    <button type="button" class="btn btn-info form-control">게시글 등록</button> -->
		</form>
	${paginationMenu }
</div>
</body>
</html>