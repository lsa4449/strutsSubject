<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="insertNoticeboardURI" value="${pageContext.request.contextPath}/user/insertFreeboard.do"></c:url>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항 입력</title>
<script type="text/javascript" src=`http://code.jquery.com/jquery-latest.js`></script>
<script type="text/javascript" src='${pageContext.request.contextPath }/js/common/validation.js'></script>
<script type='text/javascript'>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#post_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });

	$('#mem_name').val('${LOGINMEMBERINFO.mem_name}');
	$('#mem_mail').val('${LOGINMEMBERINFO.mem_mail}');

	$('form[name=noticeBoardForm]').submit(function(){

	
		var post_content = $('#post_content').summernote('code');
		$(this).append('<input type="hidden" name="post_content" value="'+ post_content +'"/>');
		$(this).append('<input type="hidden" name="mem_no" value="${LOGINMEMBERINFO.mem_no}" />');
		$(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}"/>');// remotAddr id 주소 가져오기
		$(this).attr('action', '${insertNoticeboardURI}'); 
		
		return true;
	});
});

// 알럿창 함수 만들기
function alertPrint(msg){
	BootstrapDialog.show({
	    title: '알럿창',
	    message: msg
	});
	return false; // 알럿창이 뜨면 submit이 되지 않도록 return false를 한다.
}
</script>
</head>
<body>
<form name="noticeBoardForm" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="post_title" name="post_title" placeholder="제목 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mem_no">작성자명:</label>
		<div class="col-sm-10"> 
			<input type="text" value="mem_name" class="form-control" id="mem_name" name="mem_name" placeholder="대화명 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pw">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="post_pw" name="post_pw" placeholder="패스워드 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text"  value="mem_mail" class="form-control" id="mem_mail" name="mem_mail" placeholder="메일주소 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_content">내용:</label>
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
			<button type="button" class="btn btn-danger" style="float: right">취소</button>
			<button type="button" class="btn btn-primary" style="float: right">목록</button>
		</div>
	</div>
</form>
</body>
</html>