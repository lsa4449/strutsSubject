<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="paginationMenu" value="${pagination }"></c:set>
<!-- Admin -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


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
					<div class="title">자유게시판</div>
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
						 <c:forEach var="item" items="${freeboardList}">
            <tr>
               <td><input type="hidden" value="${item['POST_NO']}"/>${item['RNUM']}</td>
               	<td align="left"><c:forEach begin="1"
										end="${item['POST_DEPTH'] }" varStatus="stat">
								&nbsp;&nbsp;&nbsp;
								<c:if test="${stat.last }">
											<i class="fa fa-angle-right"></i>
										</c:if>
								   </c:forEach>${item['POST_TITLE']}</td>
             					  <td>${item['MEM_NAME']}</td>
             					  <td>${item['POST_DATE']}</td>
             					  <td>${item['POST_HIT']}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div style="text-align:right;">
					<form action="${pageContext.request.contextPath}/admin/freeBoard/freeBoardList.do" method="post" class="form-inline pull-right">
					<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
					<select class="form-control" name="search_keycode" >
							<option value="TOTAL">전체</option>
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
							<option value="WRITER">작성자</option>
						</select> 
						
						<input class="btn1" type="submit" value="검색"/>
						</form>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
${pagination }
</body>
<script type="text/javascript">
 $(function(){
		
	
	$('#freeboardTBY tr').click(function(){
		 if(eval('${empty LOGIN_MEMBERINFO}')){ 
			var post_no = $(this).find('td:eq(0) input').val();
	        var rnum= $(this).find('td:eq(0)').text();
	        var url = '${pageContext.request.contextPath}/admin/freeBoard/freeBoardView.do';
	        $(location).attr('href', url + '?post_no=' + post_no + '&rnum=' + rnum);
		 }else{
				alert('로그인 해주세요.');
		 }   
	});
});
</script>
</html>