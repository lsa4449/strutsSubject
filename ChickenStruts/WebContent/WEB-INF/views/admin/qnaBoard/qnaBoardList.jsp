<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="viewURI" value="/admin/qnaBoard/qnaBoardView.do"/>
<c:url var="ListURI" value="${pageContext.request.contextPath }/admin/qnaBoard/qnaBoardList.do"/>
<c:url var="ReplyViewURI" value="/admin/qnaBoard/qnaBoardReplyView.do"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록</title>
<script type="text/javascript">
$(function(){
	$('table tr:gt(0)').click(function(){
		
		var rnum = $(this).find('td:eq(0)').text();
		var post_no = $(this).find('#post_no').val();
		var depth = $(this).find('#depth').val();
		
		if(depth == 0){
			location.href = '${viewURI}?post_no=' + post_no + '&rnum=' + rnum +'&depth='+ depth;
		}else{
			location.href = '${ReplyViewURI}?post_no=' + post_no + '&rnum=' + rnum +'&depth='+ depth;
		}
	});
});

</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/admin/qnaBoard/qnaBoardList.do">
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="qnaBoardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">Q&A 게시판</div>
					 <div class="panel-body">
					 <table class="table table-hover table-bordered">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="60%">제목</th>
							  <th>작성자</th>
							  <th>작성일</th>
							  <th>조회수</th>
							</tr>
						</thead>
						<tbody  id="freeboardTBY">
						<c:forEach var="item" items="${qnaboardList}">
							<tr>
								<td><input type="hidden" value="${item['POST_NO']}" id="post_no">${item['RNUM']}</td>
								<td align="left">
			                    <c:forEach begin="1" end="${item['POST_DEPTH']}"  varStatus="stat">
			                    	&nbsp;&nbsp;&nbsp;
			                    	<c:if test="${stat.last }">
			                    		<i class = "fa fa-angle-right"></i>
			                    	</c:if>
			                    </c:forEach>
			                    	<input type="hidden" value="${item['POST_DEPTH']}" id="depth">
								
								${item['POST_TITLE']}</td>
								<td>${item['MEM_NAME']}</td>
								<td>${item['POST_DATE']}</td>
								<td>${item['POST_HIT']}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div style="float:right;">
					<form action="/admin/qnaBoard/qnaboardList.do" method="post" class="form-inline pull-right">
					<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." style="width:150px; display:inline;"/>
					<select class="form-control" name="search_keycode" style="width:150px; display:inline;">
					
							<option>검색조건</option>
							<option value="TOTAL">전체</option>
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
							<option value="WRITER">작성자</option>
					</select>
				    	<button type="submit" class="btn btn-primary form-control" style="width:150px;">검색</button> 
						</form>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</form>
${paging }
</body>
</html>