<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="insertNoticeboardURI" value="noticeInsert.do"></c:url>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항 입력</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#post_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
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
		
		var post_content = $('#post_content').summernote('code'); // 현재 웹 에디터에 내가 친 것들을 가져오기 위해서 사용 (코드로 가져온다.)
		
		$(this).append('<input type="hidden" name="post_content" value="'+post_content+'" />');
		$(this).append('<input type="hidden" name="post_writer" value="${LOGINMEMBERINFO.mem_no}" />');
		$(this).append('<input type="hidden" name="post_ip" value="${pageContext.request.remoteAddr}" />'); // remotAddr id 주소 가져오기
		$(this).attr('action', '${insertNoticeboardURI}'); // 이동
		
		return true;
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
<form name="noticeBoardForm" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="post_title" name="post_title" placeholder="제목 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="post_nickname" name="post_nickname" placeholder="대화명 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_pw">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="post_pw" name="post_pw" placeholder="패스워드 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="post_mail" name="post_mail" placeholder="메일주소 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="post_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="post_content"></div>
		</div>
	</div>
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
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-info" style="float: right">등록</button>
			<button type="button" class="btn btn-danger" style="float: right">취소</button>
			<button type="button" class="btn btn-primary" style="float: right">목록</button>
		</div>
	</div>
</form>
</body>
</html>