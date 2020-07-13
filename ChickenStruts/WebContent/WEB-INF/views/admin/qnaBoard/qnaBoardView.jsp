<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <c:set var="qnaMap" value="${qnaMap}"></c:set> --%>
<%-- <c:url var="qnaDeleteURI" value="/user/qnaboardDelete.do"></c:url> --%>
<c:url var="QnAListURI" value="/admin/qnaBoard/qnaBoardList.do"/>
<c:url var="QnAReplyURI" value="/admin/qnaBoard/qnaboardReplyInfoForm.do"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
   // 섬머노트를 div를 활용한 textarea에 추가.
   // http://summernote.org 활용
//     $('.post_content').summernote({
//          height: 150,
//          codemirror: {
//          theme: 'monokai'
//       }
//     });
    
    $('.post_title').text("${qnaMap.post_title}");
   $('.post_writer').text("${qnaMap.mem_name}");
//    $('.post_content').summernote('code', "${qnaMap.post_content}");
//    $('.post_content').text("");
	const strtemp = "${qnaMap.post_content}";
	let changeStr = strtemp.replace("<p>", "");
	changeStr = changeStr.replace("</p>", "");
	
	$('#post_content').val(changeStr);
	
	
   $('.post_ip').text("${qnaMap.post_ip}");
   
   $('#btn3').click(function(){
//       $(location).attr('href','${QnAListURI}');
	   window.history.back();
   });
   
   $('#btn2').click(function(){
      var post_title = encodeURIComponent('${qnaMap.post_title}');
      var queryString = '?post_no=${param.post_no}&rnum=${param.rnum}&post_title=' + post_title;
      var parentInfo = '&post_group=${qnaMap.post_group}&posts_seq=${qnaMap.posts_seq}&post_depth=${qnaMap.post_depth}';
      
      $(location).attr('href','${QnAReplyURI}' + queryString + parentInfo);
   });

});
</script>
</head>
<body>
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
                    <th>제목</th>
                    <td><label class="post_title"></label></td>
                  </tr>
                  <tr>
                    <th>작성자</th>
                    <td><label class="post_writer"></label></td>
                  </tr>
                  <tr>
                    <th>내용</th>
                    <td><textarea rows="10" cols="110" class="bo_content" style="overflow: auto;" name="post_content" id="post_content"></textarea> </td>
                  </tr>
                  <tr>
                    <th>IP Addr.</th>
                    <td><label class="post_ip"></label></td>
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
                       <c:forEach items="${qnaMap.items }" var="fileitemInfo" varStatus="stat">
                          <c:if test="${stat.first }">
                        <div class="item active">
                        </c:if>
                        
                        <c:if test="${stat.last }">
                           <div class="item">
                        </c:if>
								<img src="/files/${fileitemInfo.file_save_name }" alt="pic1"
									onclick="javascript:location.href='${pageContext.request.contextPath }/admin/qnaBoard/qnaboardFileDownload.do?fileName=${fileitemInfo.file_upload_name }';">
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
                  <input class="btn2" type="button" id="btn2" value="답글"/> 
                  <input class="btn2" type="button" id="btn3" value="목록"/>
               </div>
            </div>
         </td>
      </tr>
   </table>
</div>
</body>
</html>