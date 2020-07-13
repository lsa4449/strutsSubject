<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="fileNames" value="${serverFileNames }"></c:set>    
<c:set var="FQuestionMap" value="${FQuestionMap }"></c:set>
<c:url var="updateURL" value="fquestionUpdate.do"></c:url>
<c:url var="deleteURL" value="fquestionDelete.do"></c:url>
<c:url var="selectURL" value="fquestionList.do"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
<script>
$(function(){
	
 $('#post_content').summernote({
		height: 150,
		codemirror: {
		theme: 'monokai'
		}
	});

	$('#post_title').val("${FQuestionMap['POST_TITLE']}");
	$('#mem_name').val("${FQuestionMap['MEM_NAME']}");
	$('#post_pw').val("${FQuestionMap['POST_PW']}");
	$('#mem_mail').val("${FQuestionMap['MEM_MAIL']}");
	$('#post_content').summernote('code', "${FQuestionMap['POST_CONTENT'] }");
});
$(function(){
    
    $('#btn4').on('click', function(){
    	//location.href = '${pageContext.request.contextPath}/user/fquestionBoard/fquestionBoardList.do';
    	window.history.back();
    	
    });
    
    $('#post_content').summernote('disable');
});
</script>
</head>
<body>
<form name="freeboardViewForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="post_title" name="post_title" disabled="disabled">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_name">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mem_name" name="mem_name" disabled="disabled" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_pw">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="post_pw" name="post_pw" disabled="disabled">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mem_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mem_mail" name="mem_mail" disabled="disabled">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="post_content"></div>
		</div>
	</div>

	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
<!-- 			<button type="button" class="btn btn-success" id="btn1">글쓰기</button> -->
<!-- 			<button type="button" class="btn btn-danger" id="btn2">삭제</button> -->
<!-- 			<button type="button" class="btn btn-primary" id="btn3">댓글</button> -->
			<button type="button" class="btn btn-info" id="btn4">목록</button>
<!-- 			<button type="submit" class="btn btn-default" style="float: right">수정</button> -->
		</div>
	</div>
</form>
</body>
</html>