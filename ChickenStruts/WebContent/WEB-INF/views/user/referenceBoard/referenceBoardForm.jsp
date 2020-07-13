<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:url var="insertFreeboardURI" value="/13/freeboard/insertFreeboardInfo.jsp"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 등록</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
	
	$('form').submit(function(){
	 	
		if(!$('#bo_title').val().validationTITLE()){
			return alertPrint("제목을 바르게 입력해주세요");
			}
	

	 	var post_content = $('#bo_content').summernote('code');
		
	 	$(this).append('<input type="hidden" name="post_content" value="' + post_content +'"/>');
		$(this).append('<input type="hidden" name="mem_no" value="${LOGINMEMBERINFO.mem_no}"/>');
		$(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}"/>');
		
		return true;
	}); 
	
	$('#btn1').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/referenceBoard/referenceBoardList.do');
	});
});

function alertPrint(msg){
	BootstrapDialog.show({
	    title: '알림',
	    message: msg
	});
	return false;
}
</script>
</head>
<body>
<form class="form-horizontal" role="form" 
	action="${pageContext.request.contextPath}/user/referenceBoard/referenceBoardInsert.do" 
	method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="post_title" placeholder="제목 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 :</label>
		<div class="col-sm-10"> 
			<input type="text" disabled="disabled" class="form-control" id="bo_nickname" name="bo_nickname" placeholder="${LOGINMEMBERINFO.mem_name}">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"></div>
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
			<button type="button" class="btn btn-primary" style="float: right" id="btn1">목록</button>
			<button type="reset" class="btn btn-danger" style="float: right" id=btn2">취소</button>
			<button type="submit" class="btn btn-info" style="float: right">등록</button>
		</div>
	</div>
</form>
</body>
</html>