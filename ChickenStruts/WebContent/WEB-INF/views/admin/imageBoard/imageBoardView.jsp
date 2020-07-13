<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
			}
    });
    
    $('#post_title').val('${imageInfo[0].post_title}');   
    $('#mem_name').val('${LOGINMEMBERINFO.mem_name}');
    $('#post_content').summernote('code', '${imageInfo[1].post_content}');
    
    $('#btn2').click(function(){
    	$(location).attr('href', '${pageContext.request.contextPath}/user/imageBoard/deleteImageInfo.do?post_no=${imageInfo[0].post_no}');
    });
    
    $('#btn4').click(function(){
    	$(location).attr('href', '${pageContext.request.contextPath}/user/imageBoard/imageBoardList.do');
    });
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 보기</title>
</head>
<form name="refereneceViewForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="post_title" name="post_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_name">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mem_name" name="mem_name" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_content">내용:</label>
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
				<c:forEach items="${imageInfo }" var="fileitemInfo" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last }">
						<div class="item">
					</c:if>
						<img src="/files/${fileitemInfo.file_save_name }" alt="pic1"
							 onclick="javascript:location.href='/user/referenceboardfiledown.do?file_no=${fileitemInfo.file_no}';">
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
			<button type="button" class="btn btn-success" id="btn1">글쓰기</button>
			<button type="button" class="btn btn-danger" id="btn2">삭제</button>
			<button type="button" class="btn btn-info" id="btn4">목록</button>
			<button type="submit" class="btn btn-default" style="float: right">수정</button>
		</div>
	</div>
</form>
</body>
</html>