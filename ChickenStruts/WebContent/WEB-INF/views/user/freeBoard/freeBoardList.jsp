<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="paginationMenu" value="${pagination }"></c:set>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="panel panel-red">
                            <div class="panel-heading">자유 게시판</div>
                            <div class="panel-body">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                    <th scope="col" width="select">No</th>
                                        <th width="65%">제목</th>
                                        <th width="10%">작성자</th>
                                        <th width="5%">작성일</th>
                                        <th width="10%">조회수</th>
                                    </tr>
                                    </thead>
                                         <tbody id="freeboardTBY">
         <c:forEach var="item" items="${freeboardList}">
            <tr>
               <td><input type="hidden" value="${item['POST_NO']}"/>${item['RNUM']}</td>
               	<td align="left"><c:forEach begin="1"
										end="${item['POST_DEPTH'] }" varStatus="stat">
								&nbsp;&nbsp;&nbsp;
								<c:if test="${stat.last }">
											<i class="fa fa-angle-right"></i>
										</c:if>
										
               </c:forEach>${item['POST_TITLE']}</td>
               <td>${item['MEM_NAME']}</td>
               <td>${item['POST_DATE']}</td>
               <td>${item['POST_HIT']}</td>
            </tr>
         </c:forEach>
         </tbody>
      </table>
      <form action="${pageContext.request.contextPath}/user/freeBoard/freeBoardList.do" method="post" class="form-inline pull-right" name="search">
			<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
			<select class="form-control" name="search_keycode" id="search_keycode" >
				<option value="TOTAL">전체</option>
				<option value="TITLE">제목</option>
				<option value="CONTENT">내용</option>
				<option value="WRITER">작성자</option>
			</select>
		    <button type="submit" class="btn btn-primary form-control">검색</button>
		    <button type="button" class="btn btn-info form-control" id="registBTN">게시글 등록</button>
	</form>
   </div>
   ${pagination }
</div>                  
	
</body>
<script type="text/javascript">
 $(function(){
	
	$('#registBTN').click(function(){
		if(eval('${!empty LOGINMEMBERINFO}')){
			$(location).attr('href', '${pageContext.request.contextPath}/user/freeBoard/freeBoardForm.do');
		}
		else{
	     		BootstrapDialog.show({
	     		    title: '알림',
	     		    message: '게시글은 로그인이 완료된 이후 작성할 수 있습니다.'
	     		});
		   }
	});
	
	
	$('#freeboardTBY tr').click(function(){
		 if(eval('${empty LOGIN_MEMBERINFO.mem_id}')){ 
			var post_no = $(this).find('td:eq(0) input').val();
	        var rnum= $(this).find('td:eq(0)').text();
	        var url = '${pageContext.request.contextPath}/user/freeBoard/freeBoardView.do';
	        var search_keycode = $(this).find('#search_keycode').val();
	 		var search_keyword = $(this).find('#search_keyword').val();
	        $(location).attr('href', url + '?post_no=' + post_no + '&rnum=' + rnum + '&search_keycode=' + search_keycode + '&serarch_keyword' + search_keyword);
		 }else{
				alert('로그인 해주세요.');
		 }   
	});
//  	$('form[name=search]').submit(function(){
//  		var search_keycode = $(this).find('#search_keycode').val();
//  		var search_keyword = $(this).find('#search_keyword').val();
//  		$(this).attr('action','/user/freeBoard/freeBoardList.do');
//  	});
});
</script>
</html>