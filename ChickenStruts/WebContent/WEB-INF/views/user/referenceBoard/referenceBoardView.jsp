<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 정보</title>
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
	if (eval('${empty LOGINMEMBERINFO}') || '${LOGINMEMBERINFO.mem_name}' != '${postInfo.mem_name}') {
		$('#btn1').hide();
		$('#btn2').hide();
	}
	
	 
	   
	const strtemp = "${postInfo.post_content}";
	let changeStr = strtemp.replace("<p>", "");
    changeStr = changeStr.replace("</p>", "");
    
    
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });

    // 도큐먼트 초기값 설정
    $('#bo_title').val('${postInfo.post_title}');
    $('#bo_name').val('${postInfo.mem_name}');
    $('#bo_content').summernote('code', changeStr);
    
    
     // 댓글
    $('#btn3').click(function(){
    	var post_title = encodeURIComponent('${postInfo.post_title}');
		var queryString = '?rnum=${param.rnum}&post_title=' + post_title;
		var parentInfo = '&post_group=${postInfo.post_group}&posts_seq=${postInfo.posts_seq}&post_depth=${postInfo.post_depth}';
    	
    	$(location).attr('href', '${pageContext.request.contextPath}/user/referenceBoard/referenceBoardReply.do'+ queryString + parentInfo); // 경로 지정 freeboardReplyFormURI(지정해준거) 와 queryString + parentInfo 
    }); 
     
    //삭제
    $('#btn2').click(function(){
    	$(location).attr('href', '${pageContext.request.contextPath}/user/referenceBoard/referenceBoardDelete.do?post_no=${postInfo.post_no}');
    })
    
    $('#btn4').click(function(){
    	// /ddit/13/main.jsp
    	window.history.back();
    	//$(location).attr('href', '${pageContext.request.contextPath}/user/referenceBoard/referenceBoardList.do');
    }); 
    
    $('form').submit(function(){
		   
		var post_content = $('#bo_content').summernote('code');
		$(this).append('<input type="hidden" name="post_content" value="'+ post_content +'"/>');
// 		$(this).append('<input type="hidden" name="post_no" value="${postInfo.post_no}"/>');
		$(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}"/>');
		$(this).append('<input type="hidden" name="post_group" value="${postInfo.post_group}"/>');
		return true; 
    });
    
});
</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/referenceBoard/referenceBoardUpdate.do?post_no=${postInfo.post_no}" class="form-horizontal" role="form" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="post_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_name">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_name" name="bo_name" disabled="disabled">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style="height: 200px;">
				<c:forEach items="${postInfo.items }" var="fileitemInfo" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last }">
						<div class="item">
					</c:if>
						<img src="/files/${fileitemInfo.file_save_name }" alt="pic1"
							 onclick="javascript:location.href='${pageContext.request.contextPath}/user/referenceBoard/referenceBoardFileDownload.do?fileName=${fileitemInfo.file_upload_name}';">
					</div>
				</c:forEach>
			</div> -
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success" id="btn1">수정</button>
			<button type="button" class="btn btn-danger" id="btn2">삭제</button>
			<button type="button" class="btn btn-primary" id="btn3">댓글</button>
			<button type="button" class="btn btn-info" id="btn4">목록</button>
		</div>
	</div>
</form>
</body>
</html>