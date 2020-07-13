<%@page import="kr.or.ddit.freeboard.service.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeboardService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%-- <c:set var="postInfo" value="${postInfo}"></c:set> --%>

<!-- user -->
<%-- <c:url var="freeboardReplyFormURI" value="/13/main.jsp"> --%>
<%--    <c:param name="contentPage" value="/13/freeboard/freeboardReplyForm.jsp"></c:param> --%>
<%-- </c:url> --%>


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

// 로그인한 세션이랑 같은지 확인
// 	var flag = true;
// 	if(eval('${!empty LOGINMEMBERINFO}')){
// 		if('${LOGINMEMBERINFO.mem_name}' == '${qnaMap.mem_name}'){
// 			var post_content = $('.post_content').summernote('code');
// 			$(this).append('<input type="hidden" name="post_content" value="'+ post_content +'"/>');
// 			$(this).append('<input type="hidden" name="post_no" value="${qnaMap.post_no}"/>');
// 			$(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}"/>');
			
// 			$(this).attr('action','${qnaUpdateURI}');
// 		}else{
// 		flag = false;
// 		}
// 		}else{
// 		flag = false;
// 		}
// 	if(!flag){
//     		BootstrapDialog.show({
//     		    title: '알림',
//     		    message: '해당 게시물은 작성자만 삭제할 수 있습니다.'
//     		});
// 	}
   
	 $('#bo_content').summernote({
	      height: 150,
	      codemirror: {
	      theme: 'monokai'
	      }
	   });
	 
	   $('#post_title').val("${postInfo.post_title}");
	   $('#post_nickname').val("${postInfo.mem_name}");
	   $('#post_pw').val("${postInfo.post_pw}");
	   $('#mem_mail').val("${postInfo.mem_mail}");
	   $('#post_content').summernote('code', "${postInfo.post_content}");
	   
	   $('#deleteFreeboardBTN').click(function(){
		    var flag = true;
		   if(eval('${!empty LOGINMEMBERINFO}')){
			   if('${LOGINMEMBERINFO.mem_name}' == '${postInfo.mem_name}'){
					const post_no ="${postInfo.post_no}";
					$(location).attr('href', '${pageContext.request.contextPath}/user/freeBoard/freeBoardDelete.do?post_no='+post_no);
			   }else{
			 		flag = false;
			 		};
			 		}else{
			 		flag = false;
			 		}
		   if(!flag){
	     		BootstrapDialog.show({
	     		    title: '알림',
	     		    message: '해당 게시물은 작성자만 삭제할 수 있습니다.'
	     		});
		   };
	   });
	   
	   //수정
	   $('#freeboardView').submit(function(){
		   var flag = true;
		   if(eval('${!empty LOGINMEMBERINFO}')){
			   if('${LOGINMEMBERINFO.mem_name}' == '${postInfo.mem_name}'){
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
				      $(this).attr('action','${pageContext.request.contextPath}/user/freeBoard/freeBoardUpdate.do');
				      $(this).append('<input type="hidden" name="post_content" value="'+ post_content +'"/>');
				      $(this).append('<input type="hidden" name="post_no" value="${postInfo.post_no}"/>');
				      $(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}"/>');
			   }else{
			 		flag = false;
			 		};
			 		}else{
			 		flag = false;
			 		}
		   if(!flag){
	     		BootstrapDialog.show({
	     		    title: '알림',
	     		    message: '해당 게시물은 작성자만 수정할 수 있습니다.'
	     		});
		   };
	   });
	   //댓글 등록
		$('#btn3').click(function(){		
			if(eval('${!empty LOGINMEMBERINFO}')){
				var post_title = encodeURIComponent('${postInfo.post_title}');
				var queryString = '?rnum=${param.rnum}&post_title=' + post_title;
				var parentInfo = '&post_group=${postInfo.post_group}&posts_seq=${postInfo.posts_seq}&post_depth=${postInfo.post_depth}';
				$(location).attr('href','${pageContext.request.contextPath}/user/freeBoard/freeBoardReplyForm.do' + queryString + parentInfo);
			}
			else{
		     		BootstrapDialog.show({
		     		    title: '알림',
		     		    message: '게시글은 로그인이 완료된 이후 작성할 수 있습니다.'
		     		});
			   }
		});
	   
		$('#btn4').click(function(){
				
			//$(location).attr('href','${pageContext.request.contextPath}/user/freeBoard/freeBoardList.do');
			window.history.back();
		});
		
		$('#btn1').click(function(){
			$(location).attr('href','${pageContext.request.contextPath}/user/freeBoard/freeBoardForm.do');
		});
	   
	}); 
 
</script>
</head>
<body>
<form id="freeboardView" class="form-horizontal" role="form" action="" method="post">
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_title">제목:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="post_title" name="post_title" >
      </div>
   </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
      <div class="col-sm-10"> 
         <input type="text" class="form-control" id="post_nickname" name="post_nickname" >
      </div>
   </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
      <div class="col-sm-10"> 
         <input type="text" class="form-control" id="post_pw" name="post_pw" >
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
   <!--     <input type="text" class="form-control" id="post_content" name="post_content" > -->
         <div id="post_content"></div>
      </div>
   </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
         <!-- Indicators -->
         <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li> <!-- 최초로 출력되어야 할것은 active를 준다. -->
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
					onclick="javascript:location.href='${pageContext.request.contextPath}/user/freeBoard/freeBoardFileDownload.do?fileName=${fileitemInfo.file_upload_name }';">
				</div>
				</c:forEach>
          </div> 
         <!-- Left and right controls -->
         <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
         <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
      </div>
   </div>
   <div class="form-group"> 
      <div class="col-sm-offset-2 col-sm-10">
         <button type="button" class="btn btn-success" id="btn1">글쓰기</button>
         <button type="button" class="btn btn-danger" id="deleteFreeboardBTN">삭제</button>
         <button type="button" class="btn btn-primary" id="btn3">댓글</button>
         <button type="button" class="btn btn-info" id="btn4">목록</button>
         <button type="submit" class="btn btn-default" style="float: right">수정</button>
      </div>
   </div>
</form>
</body>
</html>