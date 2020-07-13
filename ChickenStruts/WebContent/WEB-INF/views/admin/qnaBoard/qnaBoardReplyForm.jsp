<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="QnAListURI" value="/admin/qnaBoard/qnaBoardList.do"/>
<c:set var="qnaMap" value="${qnaMap}"></c:set>
<c:url var="QnAInsetReplyURI" value="/admin/qnaBoard/qnaboardReplyInsert.do"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 댓글등록</title>
<script type="text/javascript">
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#post_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('#btn3').click(function(){
		$(location).attr('href','${QnAListURI}');
	});
    
    $('#po_no').text('${param.rnum}');
    $('#po_title').text('${param.post_title}');
    $('#po_name').text('${LOGINMEMBERINFO.mem_name }' +'의 댓글'); 
    $('.post_writer').text("${LOGINMEMBERINFO.mem_name}");
    $('.post_ip').text("${pageContext.request.remoteAddr}");
    
    $('form[name=ReplyForm]').submit(function(){
    	
		if(!$('#post_title').val().validationTITLE()){
			return alertPrint("제목을 바르게 입력해주세요");
			}
    	
    	var post_content = $('.post_content').summernote('code');
    	$(this).append('<input type="hidden" name="post_content" value="'+ post_content +'"/>');
    	
    	$(this).append('<input type="hidden" name="post_no" value="${LOGINMEMBERINFO.mem_no}"/>');
    	$(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}"/>');
    	$(this).append('<input type="hidden" name="post_group" value="${param.post_group}"/>');
    	$(this).append('<input type="hidden" name="posts_seq" value="${param.posts_seq}"/>');
    	$(this).append('<input type="hidden" name="post_depth" value="${param.post_depth}"/>');
    	$(this).append('<input type="hidden" name="mem_no" value="${LOGINMEMBERINFO.mem_no}"/>');
    	
    	$(this).attr('action','${QnAInsetReplyURI}');
    	
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
<!-- <form name="ReplyForm" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data"> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="bo_title">제목:</label> -->
<!-- 		<div class="col-sm-10"> -->
<!-- 			<input type="text" class="form-control" id="post_title" name="post_title" > -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="bo_nickname">작성자명 :</label> -->
<!-- 		<div class="col-sm-10">  -->
<!-- 			<input type="text" class="form-control" id="mem_name" name="mem_name" > -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label> -->
<!-- 		<div class="col-sm-10">  -->
<!-- 			<input type="password" class="form-control" id="post_pw" name="post_pw" > -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="bo_mail">메일:</label> -->
<!-- 		<div class="col-sm-10">  -->
<!-- 			<input type="password" class="form-control" id="mem_mail" name="mem_mail" > -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="bo_content">내용:</label> -->
<!-- 		<div class="col-sm-10">  -->
<!-- 			<div id="post_content"></div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="file01">첨부파일1:</label> -->
<!-- 		<div class="col-sm-10"> -->
<!-- 			 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary"> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="file02">첨부파일2:</label> -->
<!-- 		<div class="col-sm-10"> -->
<!-- 			 <input type="file" class="filestyle" id="file02" name="files" data-buttonName="btn-primary"> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group">  -->
<!-- 		<div class="col-sm-offset-2 col-sm-10"> -->
<!-- 			<button type="submit" class="btn btn-success" style="float: right;">답글등록</button> -->
<!-- 			<button type="button" class="btn btn-danger">취소</button> -->
<!-- 			<button type="button" class="btn btn-info" id="btn3">목록</button> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </form> -->

<form name="ReplyForm" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="qnaBoardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">QnA 게시판</div>
					<table border="0" cellspacing="1" cellpadding="1">
					<tr>
						<div class="row">
							 <div class="col-sm-3">
								 <label class="col-sm-2 control-label">No </label>
						  		 <p class="form-control-static" id="po_no" name="po_no"></p>
							 </div>
							 <div class="col-sm-8">
							 	<label class="col-sm-2 control-label">제목 :</label>
						    	<p class="form-control-static" id="po_title"></p>
							 </div>
							 <div class="col-sm-1">
							 	<p class="text-right text-danger bg-danger" id="po_name"></p>
							 </div>
						</div>
					</tr>
						<tr>
						  <th>제목</th>
						  <td><input type="text" class="form-control" id="post_title" name="post_title" ></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><label class="post_writer"></label></td>
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="post_content" style="overflow: auto;"></textarea> </td>
						</tr>
						<tr>
						  <th>IP Addr.</th>
						  <td><label class="post_ip"></label></td>
						</tr>
						<tr>
						  <th>파일 첨부</th>
						  <td><label class="post_file">
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
						  </label></td>
						</tr>
					</table>
					<div style="text-align:right">
						<input class="btn2" type="submit" value="답글등록"/> 
<!-- 						<input class="reset" type="button" value="취소"/>  -->
						<input class="btn2" type="button" id="btn3" value="목록"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>