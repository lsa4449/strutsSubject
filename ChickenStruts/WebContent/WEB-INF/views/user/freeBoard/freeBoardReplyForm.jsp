<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="QnAListURI" value="/admin/qnaboardList.do"/>
<c:set var="qnaMap" value="${qnaMap}"></c:set>
<c:url var="QnAInsetReplyURI" value="${pageContext.request.contextPath}/admin/qnaboardReplyInsert.do"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 댓글등록</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#post_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    //목록으로 이동
    $('#btn3').click(function(){
   
 		$(location).attr('href','${pageContext.request.contextPath}/user/freeBoard/freeBoardList.do');
 	});
    
    
    
    
    
    $('#po_no').text('${param.rnum}');
    $('#po_title').text('${param.post_title}');
    $('#mem_name1').text('${LOGINMEMBERINFO.mem_name}');
    $('#mem_name').val('${LOGINMEMBERINFO.mem_name}');
    $('#mem_mail').val('${LOGINMEMBERINFO.mem_mail}');
    
    
    // 댓글 작성
    $('form[name=ReplyForm]').submit(function(){
    	if(!$('#post_title').val().validationTITLE()){
			   return BootstrapDialog.show({
	     		    title: '알림',
	     		    message: '제목을 바르게 입력해주세요.(최소1글자, 최대30글자/한글,영어(대소문자)만 가능)'
	     		});
		   };
			if(!$('#post_pw').val().validationPWD()){
			   return BootstrapDialog.show({
	     		    title: '알림',
	     		    message: '비밀번호를 바르게 입력해주세요.(최소 4글자, 최대 15글자/숫자,영어(소문자))'
	     		});
		   };
    	var post_content = $('#post_content').summernote('code');
    	$(this).append('<input type="hidden" name="post_content" value="'+ post_content +'"/>');
    	$(this).append('<input type="hidden" name="post_writer" value="${LOGINMEMBERINFO.mem_name}"/>');
    	$(this).append('<input type="hidden" name="mem_no" value="${LOGINMEMBERINFO.mem_no}"/>');
    	$(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}"/>');
    	$(this).append('<input type="hidden" name="post_group" value="${param.post_group}"/>');
    	$(this).append('<input type="hidden" name="posts_seq" value="${param.posts_seq}"/>');
    	$(this).append('<input type="hidden" name="post_depth" value="${param.post_depth}"/>');
    	$(this).attr('action','${pageContext.request.contextPath}/user/freeBoard/freeBoardReplyFormInsert.do');
    	
    	return true;
    });

    
  
    
    
});
</script>
</head>
<body>
<div class="row">
	 <div class="col-sm-3">
		 <label class="col-sm-2 control-label">No </label>
  		 <p class="form-control-static" id="po_no"></p>
	 </div>
	 <div class="col-sm-8">
	 	<label class="col-sm-2 control-label">제목 :</label>
    	<p class="form-control-static" id="po_title"></p>
	 </div>
	 <div class="col-sm-1">
	 	<p class="text-right text-danger bg-danger" id="mem_name1">의 댓글</p>
	 </div>
</div>
<hr />
<form name="ReplyForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="post_title" name="post_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자명 :</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mem_name" name="mem_name" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="post_pw" name="post_pw" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mem_mail" name="mem_mail" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="post_content"><p></p></div>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success" style="float: right;">답글등록</button>
			<button type="button" class="btn btn-danger">취소</button>
			<button type="button" class="btn btn-info" id="btn3">목록</button>
		</div>
	</div>
</form>
</body>
</html>