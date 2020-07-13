<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="QnAListURI" value="/admin/qnaboardList.do"/>
<c:set var="qnaMap" value="${qnaMap}"></c:set>
<c:url var="QnAInsetReplyURI" value="/admin/qnaboardReplyInsert.do"/>
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
    
    // 목록
    $('#btn3').click(function(){
 		$(location).attr('href','${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardList.do');
 	});
    
    $('.post_ip').text("${pageContext.request.remoteAddr}");
   
    $('form[name=ReplyForm]').submit(function(){
    	var post_content = $('#post_content').summernote('code');
    	
    	$(this).append('<input type="hidden" name="post_content" value="'+ post_content +'"/>');
    	$(this).append('<input type="hidden" name="post_no" value="${param.post_no}"/>');
    	$(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}"/>');
    	$(this).append('<input type="hidden" name="post_group" value="${param.post_group}"/>');
    	$(this).append('<input type="hidden" name="posts_seq" value="${param.posts_seq}"/>');
    	$(this).append('<input type="hidden" name="post_depth" value="${param.post_depth}"/>');
    	
    });

});
</script>
</head>
<body>

<form name="ReplyForm" class="form-horizontal" role="form" 
	action="${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardInsertReply.do" 
	method="post" enctype="multipart/form-data">
	<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="fquestionBoardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자주하는 질문</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td><input style="width:350px" type="text" class="form-control" id="post_title" name="post_title" ></td>
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
						<!-- <tr>
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
						</tr> -->
					</table>
					<div style="text-align:right">
						<input class="btn2" type="submit" value="답글등록"/> 
						<input class="btn2" type="button" id="btn3" value="목록"/>
						<input class="reset" type="button" value="취소"/> 
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>