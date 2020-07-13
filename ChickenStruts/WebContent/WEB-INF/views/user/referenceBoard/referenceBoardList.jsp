<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="paginationMenu" value="${pagination }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
<script type="text/javascript">
	$(function() {
		$('#referenceboardRegistBTN').click(function() {
			if (eval('${!empty LOGINMEMBERINFO}')) {
				$(location).attr('href', '${pageContext.request.contextPath}/user/referenceBoard/referenceBoardForm.do');
			} else {
				BootstrapDialog.show({
					title : '알림',
					message : '로그인을 해야 게시글 등록이 가능합니다'

				});
			}
		});

		$('table tr:gt(0)').click(function() {
			if (eval('${!empty LOGINMEMBERINFO}')) {
				var post_no = $(this).find('td:eq(0) input').val();
				var rnum = $(this).find('td:eq(0)').text();
				$(location).attr('href', '${pageContext.request.contextPath}/user/referenceBoard/referenceBoardView.do?post_no='
										+ post_no + '&rnum=' + rnum);
			} else {
				BootstrapDialog.show({
					title : '알림',
					message : '로그인을 해야 게시글 조회가 가능합니다'

				});
			}
		});
	});
</script>
</head>
<body>
	<div id="freeboardList_content">
		<div class="panel panel-blue">
			<div class="panel-heading">자료실</div>
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th scope="col" width="5%">No</th>
						<th scope="col" width="65%">제목</th>
						<th scope="col" width="10%">작성일</th>
						<th scope="col" width="10%">작성자</th>
						<th scope="col" width="5%">조회수</th>
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
		</div>
	</div>
	${pagination }
	<div>
		<form action="${pageContext.request.contextPath}/user/referenceBoard/referenceBoardList.do"
			method="post" class="form-inline pull-right">
			<input id="search_keyword" name="search_keyword" type="text"
				placeholder="검색어 입력..." class="form-control" /> <select
				class="form-control" name="search_keycode">
				<option>검색조건</option>
				<option value="TOTAL">전체</option>
				<option value="TITLE">제목</option>
				<option value="NAME">작성자</option>
			</select>
			<button type="submit" class="btn btn-primary form-control">검색</button>
			<button type="button" class="btn btn-info form-control"
				id="referenceboardRegistBTN">게시글 등록</button>
		</form>
	</div>
</body>
</html>