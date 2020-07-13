<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url var="InsertURI" value="/user/qnaBoard/qnaboardForm.do"/>
<c:url var="viewURI" value="/user/qnaBoard/qnaboardView.do"/>
<c:url var="ListURI" value="/user/qnaBoard/qnaboardList.do"/>
<c:url var="ReplyViewURI" value="/user/qnaBoard/qnaBoardReplyView.do"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	
	// 등록
	$('button[value=등록]').click(function(){	
		$(location).attr('href','${InsertURI}');
	});
	
	$('table tr:gt(0)').click(function(){
		
		var rnum = $(this).find('td:eq(0)').text();
		var post_no = $(this).find('#post_no').val();
		var depth = $(this).find('#depth').val();
		
		if(depth == 0){
		location.href = '${viewURI}?post_no=' + post_no + '&rnum=' + rnum +'&depth='+ depth;
		}else{
		location.href = '${ReplyViewURI}?post_no=' + post_no + '&rnum=' + rnum +'&depth='+ depth;
		}
	});
});

</script>

</head>
<body>
	<div class="panel panel-red">
                            <div class="panel-heading">Q&A 게시판</div>
                            <div class="panel-body">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th width="5%">번호</th>
                                        <th width="65%">제목</th>
                                        <th width="10%">작성일자</th>
                                        <th width="10%">작성자</th>
                                        <th width="10%">조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${empty qnaboardList }">
	                                    <tr align="center">
	                                    	<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font>
	                                    </tr>
                                    </c:if>
                                    <c:if test="${!empty qnaboardList }">
	                                    <c:forEach items="${qnaboardList }" var="item">
	                                    <tr class="active">
	                                        <td><input type="hidden" value="${item['POST_NO']}" id="post_no">${item['RNUM']}</td>
	                                        
	                                        <td align="left">
	                                        <c:forEach begin="1" end="${item['POST_DEPTH']}"  varStatus="stat">
	                                        	&nbsp;&nbsp;&nbsp;
	                                        	<c:if test="${stat.last }">
	                                        		<i class = "fa fa-angle-right"></i>
	                                        	</c:if>
	                                        </c:forEach>
	                                        <input type="hidden" value="${item['POST_DEPTH']}" id="depth">${item['POST_TITLE'] }</td>
	                                        <td>${item['POST_DATE'] }</td>
	                                        <td>${item['MEM_NAME'] }</td>
	                                        <td>${item['POST_HIT'] }</td>                 
	                                    </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                                <form action="${ListURI}" method="get" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" class="btn btn-info form-control" id="freeboardRegistBTN" value="등록">게시글 등록</button>
</form>   
                            </div>
                        </div>      
                        ${paging }                             
</body>
</html>