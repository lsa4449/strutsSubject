<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="fileNames" value="${serverFileNames }"></c:set>    
<c:set var="FQuestionMap" value="${FQuestionMap }"></c:set>
<c:url var="updateURL" value="fquestionUpdate.do"></c:url>
<c:url var="deleteURL" value="fquestionDelete.do"></c:url>
<c:url var="selectURL" value="fquestionList.do"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 보기</title>
<style type="text/css">
</style>
<script type="text/javascript">
$(function(){
	$('input[name=post_title]').val("${FQuestionMap['POST_TITLE'] }");
	var post_no = "${FQuestionMap['POST_NO'] }";
	
	const strtemp = "${FQuestionMap['POST_CONTENT'] }";
	let changeStr = strtemp.replace("<p>", "");
    changeStr = changeStr.replace("</p>", "");
	
	$('#post_no').val(post_no);
	$('.post_content').val(changeStr);
	
	$('#delete_btn').on('click', function(){
		location.href = "${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardDelete.do?post_no=${FQuestionMap['POST_NO'] }";	
	});
	$('#select_btn').on('click', function(){
		window.history.back();
		//location.href = "${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardList.do";	
	});
	
	$('#reply_btn').on('click', function(){
		
		var post_title = encodeURIComponent("${FQuestionMap['POST_TITLE']}");
		var queryString = '?rnum=${param.rnum}&post_title=' + post_title;
		var parentInfo = "&post_group=${FQuestionMap['POST_GROUP']}&posts_seq=${FQuestionMap['POSTS_SEQ']}&post_depth=${FQuestionMap['POST_DEPTH']}";
	
		location.href = "${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardReply.do"+ queryString + parentInfo;
	});
});
		
</script>
</head>
<body>
<%-- <jsp:include page="../inc/header.jsp"></jsp:include> --%>
<form action="${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardUpdate.do?post_no=${FQuestionMap['POST_NO']}" method="post">
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="fquestionBoardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자주하는 질문 수정</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td><label class="bo_title"></label><input size="50" type="text" id="post_title" name="post_title"></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><label class="bo_writer" id="mem_name" name="mem_name">${FQuestionMap['MEM_NAME'] }</label></td>
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="post_content" style="overflow: auto;" name="post_content"></textarea> </td>
						</tr>
						<tr>
						  <th>IP Addr.</th>
						  <td><label class="bo_ip">${FQuestionMap['POST_IP'] }<input type="hidden" value="${FQuestionMap['POST_IP'] }" name="post_ip"> </label></td>
						</tr>
						
						
					</table>
					<div style="text-align:right">
						<input class="btn2" type="button" value="댓글" id="reply_btn"/> 
						<input class="btn2" type="submit" value="수정"/> 
						<input class="btn2" type="button" value="삭제" id="delete_btn"/> 
						<input class="btn2" type="button" value="목록" id="select_btn"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>