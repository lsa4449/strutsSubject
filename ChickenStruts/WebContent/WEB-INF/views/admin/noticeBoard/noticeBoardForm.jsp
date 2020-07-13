<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="fileNames" value="${serverFileNames }"></c:set>    
<c:set var="FQuestionMap" value="${FQuestionMap }"></c:set>
<c:url var="insertNoticeboardURI" value="noticeInsert.do"></c:url>    
<c:url var="insert_btn" value="noticeInsert.do"></c:url>
<c:url var="deleteURL" value="noticeDelete.do"></c:url>
<c:url var="selectURL" value="noticeList.do"></c:url>
<!-- admin -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 보기</title>
<script type="text/javascript">
$(function(){
	
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
//     $('#post_content').summernote({
//     		lang: 'ko-KR',
// 			height: 150,
// 			codemirror: {
// 			theme: 'monokai'
// 		}
//     });
    // 포커스 처리
    // $('#post_content').summernote( {focus: true} );
    // 값 취득
    // $('#post_content').summernote('code'); // 현재 웹 에디터에 내가 친 것들을 가져오기 위해서 사용
    // 값 추가
    // $('#post_content').summernote('code', '<font color="red">추가글</font>');
    // 에디터 제거
    // $('#post_content').summernote('destroy');
    
// 	BootstrapDialog.show({
// 	    title: '알럿창',
// 	    message: '알럿창으로 활용하세요!'
// 	});
	
// 	BootstrapDialog.show({
//         message: '컨펌 다이얼로그로 활용하세요!',
//         buttons: [{
//             label: 'Button 1'
//         }, {
//             label: 'Button 2',
//             cssClass: 'btn-primary',
//             action: function(){
//                 alert('Hi Orange!');
//             }
//         }, {
//             icon: 'glyphicon glyphicon-ban-circle',
//             label: 'Button 3',
//             cssClass: 'btn-warning'
//         }, {
//             label: 'Close',
//             action: function(dialogItself){
//                 dialogItself.close();
//             }
//         }]
//     });
	$('form[name=noticeBoardForm]').submit(function(){
// 		if(!$('#post_title').val().validationTITLE()){
// 			return alertPrint("제목을 바르게 입력해주세요");
// 		}
// 		if(!$('#post_nickname').val().validationNICKName()){
// 			return alertPrint("대화명을 바르게 입력해주세요");
// 		}
// 		if(!$('#post_pw').val().validationPWD()){
// 			return alertPrint("패스워드를 바르게 입력해주세요");
// 		}
// 		if(!$('#post_mail').val().validationMAIL()){
// 			return alertPrint("이메일을 바르게 입력해주세요"); // 여기서의 리턴은 어디로 보내는 거?
// 		}
		
// 		var post_content = $('#post_content').summernote('code'); // 현재 웹 에디터에 내가 친 것들을 가져오기 위해서 사용 (코드로 가져온다.)
		
// 		$(this).append('<input type="hidden" name="post_content" value="'+post_content+'" />');

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
		   
		$(this).append('<input type="hidden" name="mem_no" value="${LOGINMEMBERINFO.mem_no}" />');
		
		$(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}" />'); // remotAddr id 주소 가져오기
		$(this).attr('action', '${pageContext.request.contextPath }/admin/noticeBoard/noticeBoardInsert.do'); // 이동
		
		return true;
	});
	
	$('#select_btn').on('click', function(){
		location.href = '${pageContext.request.contextPath }/admin/noticeBoard/noticeBoardList.do';
	});
});

// 알럿창 함수 만들기
function alertPrint(msg){
	BootstrapDialog.show({
	    title: '알럿창',
	    message: msg
	});
	return false; // 알럿창이 뜨면 submit이 되지 않도록 return false를 한다.
}
</script>
</head>
<body>
<%-- <jsp:include page="../inc/header.jsp"></jsp:include> --%>
<form method="post" enctype="multipart/form-data" name="noticeBoardForm">
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="noticeBoardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자유게시판 수정</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td><label class="bo_title"><input type="text" name="post_title" id="post_title"></label></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><label class="bo_writer"><input type="text" name="mem_name" value="${LOGINMEMBERINFO.mem_name }" readonly="readonly"></label>
						  	<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}" >
						  </td>
						</tr>
						
						<tr>
						  <th>비밀번호</th>
						  <td><label class="bo_ip"><input type="text" name="post_pw" id="post_pw"> </label></td>
						</tr>
						
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="bo_content" style="overflow: auto;" name="post_content"></textarea> </td>
						</tr>
						
						<tr>
						<th>첨부파일1:</th>
						<td><input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary"></td>
						</tr>
						<tr>
						<th>첨부파일2:</th>
						<td><input type="file" class="filestyle" id="file02" name="files" data-buttonName="btn-primary"></td>
						</tr>

						

					</table>
					
					<div style="text-align:right">
						<input class="btn2" type="submit" value="등록" id="insert_btn"/> 
						<input class="btn2" type="reset" value="취소"/> 
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