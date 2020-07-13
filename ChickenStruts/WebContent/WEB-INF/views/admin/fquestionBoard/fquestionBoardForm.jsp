<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="fileNames" value="${serverFileNames }"></c:set>    
<c:set var="FQuestionMap" value="${FQuestionMap }"></c:set>

<c:url var="insert_btn" value="fquestionInsert.do"></c:url>
<c:url var="deleteURL" value="fquestionDelete.do"></c:url>
<c:url var="selectURL" value="fquestionList.do"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 보기</title>
<style type="text/css">
</style>
<script type="text/javascript">
$(function(){
	$('#select_btn').on('click', function(){
		location.href = '${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardList.do';
	});
	
	$('form').submit(function(){
		if(!$('#post_title').val().validationTITLE()){
			return alertPrint("제목을 바르게 입력해주세요");
			}
		
		if(!$('#post_pw').val().validationPWD()){
			return alertPrint("패스워드를 바르게 입력해주세요");
		}
		
		return true;
	}); 
});

function alertPrint(msg){
	BootstrapDialog.show({
	    title: '알림',
	    message: msg
	});
	return false;
}
</script>
</head>
<body>
<%-- <jsp:include page="../inc/header.jsp"></jsp:include> --%>
<form action="${pageContext.request.contextPath}/admin/fquestionBoard/fquestionBoardInsert.do" method="post" >
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="fquestionBoardMenu.jsp"></jsp:include></td>
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
						  <td><label class="bo_writer">
						    <input placeholder="관리자" type="text" name="mem_name" value="${LOGINMEMBERINFO.mem_name }" readonly="readonly"></label>
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
						

					</table>
					
					<div style="text-align:right">
						<input class="btn2" type="submit" value="등록" id="insert_btn"/> 
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