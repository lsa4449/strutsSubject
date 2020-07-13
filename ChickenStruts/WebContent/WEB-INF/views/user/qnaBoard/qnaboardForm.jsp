<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url var="QnAListURI" value="/user/qnaBoard/qnaboardList.do"/>
<c:url var="InsertURI" value="/user/qnaBoard/insertqnaboardInfo.do"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 등록</title>
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
<script type='text/javascript'>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#post_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('#btn1').click(function(){
		$(location).attr('href','${QnAListURI}');
	});


	$('#mem_name').val('${LOGINMEMBERINFO.mem_name}');
	$('#mem_mail').val('${LOGINMEMBERINFO.mem_mail}');

	 $('form[name=qnaboardForm]').submit(function(){
		 
			if(!$('#post_title').val().validationTITLE()){
				return alertPrint("제목을 바르게 입력해주세요");
				}
		 
		
		var post_content = $('#post_content').summernote('code');
		$(this).append('<input type="hidden" name="post_content" value="'+ post_content +'"/>');
		$(this).append('<input type="hidden" name="mem_no" value="${LOGINMEMBERINFO.mem_no}" />');
		$(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}"/>');
		$(this).attr('action','${InsertURI}');
		
		return true;
	});
});
	
	
	function alertPrint(msg){
		BootstrapDialog.show({
			title: '알림',
			message: msg
		});
		return false;
	};
</script>
</head>
<body>
<form name="qnaboardForm" class="form-horizontal" role="form" action="" method="post"
	enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="post_title" name="post_title" placeholder="제목 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mem_no">작성자명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mem_name" name="mem_name" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="post_pw" name="post_pw" placeholder="패스워드 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mem_mail" name="mem_mail" placeholder="메일주소 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="post_content"></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file02">첨부파일2:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="file02" name="files" data-buttonName="btn-primary">
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-info" style="float: right">등록</button>
<!-- 			<button type="button" class="btn btn-danger" style="float: right">취소</button> -->
			<button type="button" class="btn btn-primary" style="float: right" id="btn1">목록</button>
		</div>
	</div>
</form>
</body>
</html>