<%@page import="kr.or.ddit.freeboard.service.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeboardService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="boardMap" value="${postInfo}"></c:set>

<!-- admin -->
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
   
 $('#post_content').summernote({
      height: 150,
      codemirror: {
      theme: 'monokai'
      }
   });
 
   $('textarea').hide();
   
   $('#post_title').val("${boardMap.post_title}");
   $('.post_writer').text("${boardMap.mem_name}");
   $('.post_ip').text("${boardMap.post_ip}");
   $('.post_content').summernote('code', "${boardMap.post_content}");
   
   $('#deleteFreeboardBTN').click(function(){
					const post_no ="${boardMap.post_no}";
   		
		    
		    	$(location).attr('href', '${pageContext.request.contextPath}/admin/freeBoard/freeBoardDelete.do?post_no='+post_no);
   });
   
   //수정
   $('#freeboardView').submit(function(){
 
	   if(!$('#post_title').val().validationTITLE()){
		   return BootstrapDialog.show({
     		    title: '알림',
     		    message: '제목을 바르게 입력해주세요.(최소1글자, 최대30글자/한글,영어(대소문자)만 가능)'
     		});
		   };
// 		if(!$('#post_pw').val().validationPWD()){
// 		   return BootstrapDialog.show({
//      		    title: '알림',
//      		    message: '비밀번호를 바르게 입력해주세요.(최소 4글자, 최대 15글자/숫자,영어(소문자))'
//      		});
// 	   };
	   
	   var post_content = $('#post_content').summernote('code');
	      $(this).attr('action','${pageContext.request.contextPath}/admin/freeBoard/freeBoardUpdate.do');
	      $(this).append('<input type="hidden" name="post_content" value="'+ post_content +'"/>');
	      $(this).append('<input type="hidden" name="post_no" value="${boardMap.post_no}"/>');
	      $(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}"/>');
	      $(this).append('<input type="hidden" name="post_pw" value="${boardMap.post_pw}"/>');

		return true;
	
   });
   //댓글 등록
	/* $('#btn3').click(function(){
		var post_title = encodeURIComponent('${boardMap.post_title}');
		var queryString = '?rnum=${param.rnum}&post_title=' + post_title;
		var parentInfo = '&post_group=${boardMap.post_group}&posts_seq=${boardMap.posts_seq}&post_depth=${boardMap.post_depth}';
		$(location).attr('href','${pageContext.request.contextPath}/admin/freeBoard/freeBoardReplyFormAd.do' + queryString + parentInfo);
	}); */
   
//목록
$('#btn4').click(function(){
	
	$(location).attr('href','${pageContext.request.contextPath}/admin/freeBoard/freeBoardList.do' );
});

}); 
 
</script>
</head>
<body>
<form id="freeboardView" class="form-horizontal" role="form" action="" method="post">
<div class="wrap">
   <table width="1000" border="0" cellpadding="0" cellspacing="0">
      <tr valign="top">
         <td width="180"><jsp:include page="fquestionBoardMenu.jsp"></jsp:include></td>
         <td width="30">&nbsp;</td>
         <td width="790"> 
            <div id="container">
               <div class="title">자유게시판</div>
               <table border="0" cellspacing="1" cellpadding="1">
                  <tr>
                    <th>제목</th>
                    <td><input type="text" id="post_title" name="post_title"></td>
                  </tr>
                  <tr>
                    <th>작성자</th>
                    <td><label class="post_writer"></label></td>
                  </tr>
                  <tr>
                    <th>내용</th>
                    <td><textarea rows="10" cols="110" id="post_content" class="post_content" disabled="disabled" style="overflow: auto;"></textarea> </td>
                  </tr>
                  <tr>
                    <th>IP Addr.</th>
                    <td><label id="post_ip" class="post_ip"></label></td>
                  </tr>
                  
                  <tr>
                    <th>첨부파일</th>
                    <td><label class="post_file">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                     <!-- Indicators -->
                     <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                     </ol>
            
                     <!-- Wrapper for slides -->
                     <div class="carousel-inner" role="listbox" style="height: 200px;">
                       <c:forEach items="${boardMap.items }" var="fileitemInfo" varStatus="stat">
                          <c:if test="${stat.first }">
                        <div class="item active">
                        </c:if>
                        
                        <c:if test="${stat.last }">
                           <div class="item">
                        </c:if>
                        <img src="/files/${fileitemInfo.file_save_name }" alt="pic1"
                           onclick="javascript:location.href='${pageContext.request.contextPath}/admin/freeBoard/freeBoardFileDownload.do?fileName=${fileitemInfo.file_upload_name }';">
                        </div>
                        </c:forEach>
                     </div>
                     <!-- Left and right controls -->
                     <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                     <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
                  </div></label></td>
                  </tr>
               </table>
               <div style="text-align:right">
                   
<!--           <input class="btn2" type="button" id="btn3" value="답글"/>  -->
         <input class="btn2" type="button" id="btn4" value="목록"/>
         <input class="btn2" type="button" id="deleteFreeboardBTN" value="삭제"/>
         <input class="btn2" type="submit"  value="수정"/>
         

               </div>
            </div>
         </td>
      </tr>
   </table>
</div>
</form>
</body>
</html>