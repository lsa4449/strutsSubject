<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="postList" value="${postList }"></c:set>
<c:set var="paginationMenu" value="${pagination }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
<script type="text/javascript">
$(function(){
	$('table tr:gt(0)').click(function(){
		var post_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		$(location).attr('href', '${pageContext.request.contextPath}/admin/referenceBoard/referenceBoardView.do?post_no=' + post_no + '&rnum=' + rnum);
	});
	
});

</script>
</head>
<body>
 <div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
		<td width="180"><jsp:include page="referenceBoardMenu.jsp"></jsp:include></td>
			<td width="40">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자료실</div>
					 <div class="panel-body">
					 <table class="table table-hover table-bordered">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="50%">제목</th>
							  <th>작성일</th>
							  <th width="10%">작성자</th>
							  <th>조회수</th>
							</tr>
						</thead>
						<tbody>
			  <c:if test="${empty postList }">
	              <tr align="center">
	                  <td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font>
	              </tr>
               </c:if>
               <c:if test="${!empty postList }">
	               <c:forEach items="${postList }" var="postList">
		               <tr class="active">
								<td><input type="hidden" value="${postList.post_no}"/>${postList.rnum }</td>
								<td align="left">
									<c:forEach begin="1" end="${postList.post_depth}" varStatus="stat">
									&nbsp;&nbsp;&nbsp;
										<c:if test="${stat.last }">
											<i class="fa fa-angle-right"></i>
										</c:if>
									</c:forEach>
									${postList.post_title }</td>
								<td>${postList.post_date }</td>
								<td>${postList.mem_name }</td>
								<td>${postList.post_hit }</td>
							</tr>
                    </c:forEach>
                </c:if>
			</tbody>
					</table>
					<div style="text-align:right;">
					<form action="${pageContext.request.contextPath}/admin/referenceBoard/referenceBoardList.do" method="post" class="form-inline pull-right">
					<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
					<select class="form-control" name="search_keycode" >
					
							<option>검색조건</option>
							<option value="TOTAL">전체</option>
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
							<option value="NAME">작성자</option>
					</select>
				    	<button type="submit" class="btn btn-primary form-control">검색</button> 
						</form>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div> 
<%-- 
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">자료실</div>
	<td width="180"><jsp:include page="referenceBoardMenu.jsp"></jsp:include></td>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
				  <th width="5%">번호</th>
				  <th width="60%">제목</th>
				  <th>작성자</th>
				  <th>작성일</th>
				  <th>조회수</th>
				</tr>
			</thead>
			<tbody id="freeboardTBY">
			<c:if test="${empty postList }">
	              <tr align="center">
	                  <td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font>
	              </tr>
               </c:if>
               <c:if test="${!empty postList }">
	               <c:forEach items="${postList }" var="postList">
		               <tr class="active">
		                   <td><input type="hidden" value="${postList.post_no}">${postList.rnum }</td>
		                   <td>${postList.post_title }</td>                                     
		                   <td>${postList.post_date }</td>
		                   <td>${postList.mem_name }</td>
		                   <td>${postList.post_hit }</td>
		                </tr>
                    </c:forEach>
                </c:if>
			</tbody>
		</table>
		<div style="text-align:right;">
					<form action="/admin/qnaboardList.do" method="post" class="form-inline pull-right">
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
	</div>
</div> --%>
${paginationMenu}
</body>
</html>