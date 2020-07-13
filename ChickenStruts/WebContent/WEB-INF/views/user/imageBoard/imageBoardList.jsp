<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시글 목록</title>
<script type="text/javascript">
$(function(){
	 $('#btn').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/imageBoard/imageBoardForm.do');
	}); 
	
	$('table tr:gt(0)').click(function(){
		var post_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		$(location).attr('href', '${pageContext.request.contextPath}/user/imageBoard/imageBoardView.do?post_no=' + post_no + '&rnum=' + rnum);
	});
		
	
});


</script>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">이미지 게시판 목록</div>
		 <table class="table table-bordered table-hover" style="text-align: center;">
			<thead>
				<tr style="height: 50px">
					<th style="text-align: center" scope="col" width="5%">번호</th>
					<th style="text-align: center" scope="col" width="5%">제목</th>
					<th style="text-align: center" scope="col" width="20%">이미지</th>
					<th style="text-align: center" scope="col" width="5%">작성자</th>
					<th style="text-align: center" scope="col" width="5%">등록일</th>
					<th style="text-align: center" scope="col" width="5%">조회수</th>
				</tr>
			</thead>
			 	<tbody>
			<c:if test="${empty imageboardList }">
				<tr align="center">
					<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다</font></td>
				</tr> 
				</c:if> 
				<c:if test="${!empty imageboardList }">
				<c:forEach items="${imageboardList }" var="item">
						<tr class="active">
							<td><input type="hidden" value="${item.post_no}"/>${item.rnum}</td>
							<td>${item.post_title}</td>
							<td> <img src="/files/${item.file_save_name}" alt="pic1" width="250"/>
							<input type="hidden" id="FILE_NO" value="${item.file_no}"></td>	
							<td>${item.mem_name}</td>
							<td>${item.post_date}</td>
							<td>${item.post_hit}</td> 
						</tr>
						</c:forEach>
				</c:if> 
			</tbody>
		</table> 
	</div>
</div>
${pagination }
<div >
<form action="${pageContext.request.contextPath }/user/imageBoard/imageBoardList.do" method="post" class="form-inline pull-right">
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="NAME">작성자</option>
		</select>
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" id="btn" class="btn btn-info form-control">게시글 등록</button>
</form>
</div>	
</body>
</html>