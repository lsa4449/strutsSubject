<%@page import="kr.or.ddit.freeboard.service.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeboardService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<%-- <c:url var="freeboardReplyFormURI" value="/13/main.jsp"> --%>
<%-- 	<c:param name="contentPage" value="/13/freeboard/freeboardReplyForm.jsp"></c:param> --%>
<%-- </c:url> --%>

<!-- admin -->
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
	
//  $('#post_content').summernote({
// 		height: 150,
// 		codemirror: {
// 		theme: 'monokai'
// 		}
// 	});

	$('#post_title').val("${postInfo['POST_TITLE']}");
	$('#mem_name').val("${postInfo['MEM_NAME']}");
	$('#post_pw').val("${postInfo['POST_PW']}");
	$('#mem_mail').val("${postInfo['MEM_MAIL']}");
// 	$('#post_content').summernote('code', "${noticeMap['POST_CONTENT']}");
	$('#post_content').val("${postInfo['POST_CONTENT']}");
});
$(function(){
// 	// 섬머노트를 div를 활용한 textarea에 추가.
// 	// http://summernote.org 활용
//     $('#post_content').summernote({
// 			height: 150,
// 			codemirror: {
// 			theme: 'monokai'
// 		}
//     });
    
//     // 도큐먼트 초기값 설정
//     $('#post_title').val('${noticeMap['dfsaf']}');
//     $('#mem_name').val('${freeboardInfo.mem_name}');
//     $('#post_pw').val('${freeboardInfo.post_pw}');
//     $('#mem_mail').val('${freeboardInfo.mem_mail}');
//     $('#post_content').summernote('code', '${freeboardInfo.post_content}');
    
//     // 글쓰기
//     $('#btn1').click(function(){
//     	// /ddit/13/main.jsp?contentPage=/13/freeboard/freeboardForm.jsp
//     	$(location).attr('href', '${freeboardForm}');    	
//     });
//     //삭제
    $('#btn2').click(function(){
//     	var flag = true;
//     	if(eval('${!empty LOGINMEMBERINFO}')){
// 	    		if('${LOGINMEMBERINFO.mem_id}' == "${noticeMap['MEM_ID']}"){
		    	// /ddit/13/main.jsp?contentPage=/13/freeboard/deleteFreeboardInfo.jsp?post_no=1
		    	$(location).attr('href', "${pageContext.request.contextPath }/admin/noticeBoard/noticeBoardDelete.do?post_no=${postInfo['POST_NO']}");
//     		}else{
// 	    	flag = false;
//     		}
//     	}else{
//     		flag = false;
//     	}
//     	if(!flag){
//     		BootstrapDialog.show({
//     		    title: '알럿창',
//     		    message: '작성자만 게시글 삭제가 가능합니다.'
//     		});
//     	}
    });
    
//     // 댓글
//     $('#btn3').on('click', function(){
//     	if(eval('${!empty LOGIN_MEMBERINFO}')){
    	
    	
//     	// /ddit/13/main.jsp?contentPage=/13/freeboard/freeboardReplyForm.jsp?rnum=${param.rnum}&post_title=${freeboardInfo.post_title}
//     	// 이것의 문제는 주소창에 한글을 쓸 경우에 안되는 경우가 있는 브라우저가 잇는데
//     	// 이것을 해결 하려면 특수한 처리를 한 후에 넘겨야 한다.
//     	// 한글 처리 하기
//     	var post_title = encodeURIComponent('${freeboardInfo.post_title}');
//     	var queryString = '?rnum=${param.rnum}&post_title=' + post_title;
//     	// dept 도 같이 가져가야 한다.
//     	var parentInfo = '&bo_group=${freeboardInfo.bo_group}&bo_seq=${freeboardInfo.bo_seq}&bo_depth=${freeboardInfo.bo_depth}';
//     	$(location).attr('href', '${freeboardReplyFormURI}' + queryString + parentInfo );
//     	}else{
//     		BootstrapDialog.show({
//     		    title: '알럿창',
//     		    message: '로그인 후 댓글 작성이 가능합니다.'
//     		});
//     	}
//     });
    
//     // 목록
//     $('#btn4').click(function(){
//     	// /ddit/13/main.jsp
//     	$(location).attr('href', '${mainURI}');
//     });
    
//     // 수정
    $('form[name=freeboardViewForm]').submit(function(){
    	if(!$('#post_title').val().validationTITLE()){
			   return BootstrapDialog.show({
	     		    title: '알림',
	     		    message: '제목을 바르게 입력해주세요.(최소1글자, 최대30글자/한글,영어(대소문자)만 가능)'
	     		});
		   };
    	
// 		if(!$('#mem_name').val().validationNICKName()){
// 			return alertPrint("대화명을 바르게 입력해주세요");
// 		}
// 		if(!$('#post_pw').val().validationPWD()){
// 			return alertPrint("패스워드를 바르게 입력해주세요");
// 		}
// 		if(!$('#mem_mail').val().validationMAIL()){
// 			return alertPrint("이메일을 바르게 입력해주세요"); // 여기서의 리턴은 어디로 보내는 거?
// 		}
		
// 		var post_content = $('#post_content').summernote('code'); // 현재 웹 에디터에 내가 친 것들을 가져오기 위해서 사용 (코드로 가져온다.)
		
// 		$(this).append('<input type="hidden" name="post_content" value="'+post_content+'" />');
		$(this).append('<input type="hidden" name="post_no" value="${postInfo['POST_NO']}" />');
// 		$(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}" />'); // remotAddr id 주소 가져오기
		$(this).attr('action', '${pageContext.request.contextPath }/admin/noticeBoard/noitceBoardUpdate.do'); // 이동
		
		return true;
    });
    
    $('#select_btn').on('click', function(){
    	location.href = '${pageContext.request.contextPath }/admin/noticeBoard/noticeBoardList.do';
    });
});
</script>
</head>
<body>
<form name="freeboardViewForm" class="form-horizontal" role="form" action="" method="post">
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="noticeBoardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">공지사항 수정</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td><label class="bo_title"><input type="text" name="post_title" id="post_title"></label></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><label class="bo_writer"><input type="text" name="mem_name" id="mem_name" value="${LOGINMEMBERINFO.mem_name }" readonly="readonly"></label>
						  	<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}" >
						  </td>
						</tr>
						
						<tr>
						  <th>비밀번호</th>
						  <td><label class="bo_ip"><input type="text" name="post_pw" id="post_pw" readonly="readonly"> </label></td>
						</tr>
						
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="bo_content" style="overflow: auto;" name="post_content" id="post_content"></textarea> </td>
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
				<c:forEach items="${fileInfo }" var="fileitemInfo" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last }">
						<div class="item">
					</c:if>
							<img alt="pic1" src="/files/${fileitemInfo.file_save_name }"
								onclick="javascript:location.href='${pageContext.request.contextPath }/admin/noticeBoard/noticeBoardFileDownload.do?fileName=${fileitemInfo.file_upload_name }';">
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
						<input class="btn2" type="submit" value="수정" id="insert_btn"/> 
						<input class="btn2" type="button" value="삭제" id="btn2"/> 
<!-- 						<input class="btn2" type="reset" value="취소"/>  -->
						<input class="btn2" type="button" value="목록" id="select_btn"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>

</form>
</body>
</html>