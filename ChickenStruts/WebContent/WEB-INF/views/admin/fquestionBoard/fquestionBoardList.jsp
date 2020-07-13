<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="listMapFQuestion" value="${listMapFQuestion}"></c:set>
<c:set var="paginationMenu" value="${pagination }"></c:set>
<c:url var="fquestionBoardViewURI" value="fquestionView.do"></c:url>
<c:url var="fquestionBoardFormURI" value="fquestionForm.do"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 리스트</title>
<style type="text/css">
</style>
<script type="text/javascript">
$(function(){
	$('#freeboardTBY tr').click(function(){
		var post_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		
		$(location).attr('href', '${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardView.do?post_no=' + post_no +'&rnum=' + rnum);
	});
	
	$('input[type=button]').on('click', function(){
		location.href = '${fquestionBoardFormURI}';
	});
	
	$('#insert').on('click', function(){
		location.href = '${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardForm.do';
	});
});
</script>
</head>
<body>
<%-- <jsp:include page="../inc/header.jsp"></jsp:include> --%>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="fquestionBoardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자주하는 질문</div>
				    <button style="width:50pt; float: right;" type="button" 
				    	class="btn-outline-primary form-control" id="insert">등록</button> 
					<br>
					 <div class="panel-body">
					 <table class="table table-hover table-bordered">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="60%">제목</th>
							  <th width="10%">작성자</th>
							  <th>작성일</th>
							  <th width="10%">조회수</th>
							</tr>
						</thead>
						<tbody  id="freeboardTBY">
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
										<div style="text-align:right;">
					<form action="${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardList.do" method="post" class="form-inline pull-right">
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
			</td>
		</tr>
	</table>
</div>
${paginationMenu }


</body>
</html>