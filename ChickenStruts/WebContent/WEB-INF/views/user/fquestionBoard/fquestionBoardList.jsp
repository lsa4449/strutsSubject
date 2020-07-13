<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="listMapFQuestion" value="${listMapFQuestion}"></c:set>
<c:set var="paginationMenu" value="${pagination }"></c:set>
<c:url var="fquestionBoardViewURI" value="fquestionView.do"></c:url>
<c:url var="fquestionBoardFormURI" value="fquestionForm.do"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
<script type="text/javascript">
$(function(){
	$('input[name=post_title]').val("${FQuestionMap['POST_TITLE'] }");
	var post_no = "${FQuestionMap['POST_NO'] }";
	$('#post_no').val(post_no);
	$('#delete_btn').on('click', function(){
		location.href = "${deleteURL}?post_no=${FQuestionMap['POST_NO'] }";	
	});
	$('#select_btn').on('click', function(){
		location.href = "${selectURL}";	
	});
	
	$('#freeboardTBY tr').click(function(){
		
		if (eval('${!empty LOGINMEMBERINFO}')) {
		var post_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();

		$(location).attr('href', '${pageContext.request.contextPath}/user/fquestionBoard/fquestionBoardView.do?post_no=' + post_no +'&rnum=' + rnum);
		} else {
			BootstrapDialog.show({
				title : '알림',
				message : '로그인을 해야 게시글 조회가 가능합니다'

			});
		}

	});
	
	$('input[type=button]').on('click', function(){
		
		location.href = '${fquestionBoardFormURI}';
	});
});
		


</script>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">게시판 목록</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="select">번호</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id="freeboardTBY">
			<c:forEach var="item" items="${listMapFQuestion}">
              		<tr class="active">
						<td><input type="hidden" value="${item['POST_NO']}">${item['RNUM']}</td>
						<td align="left">
							<c:forEach begin="1" end="${item['POST_DEPTH']}" varStatus="stat">
							&nbsp;&nbsp;&nbsp;
								<c:if test="${stat.last }">
									<i class="fa fa-angle-right"></i>
								</c:if>
							</c:forEach>
							${item['POST_TITLE']}</td>
						<td>${item['MEM_NAME']}</td>
						<td>${item['POST_DATE']}</td>
						<td>${item['POST_HIT']}</td>
					</tr>
               </c:forEach>
			</tbody>
		</table>
	</div>
</div>
${paginationMenu }
<div >
<form action="${pageContext.request.contextPath}/user/fquestionBoard/fquestionBoardList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
</form>
</div>	
</body>
</html>