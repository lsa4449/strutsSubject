<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>

 <%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%-- <%@ page language="java" contentType="application/vnd.word; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<%-- <%@ page language="java" contentType="application/hwp; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
  

<table>
	<thead>
		<tr>
			<th>아아디</th>
			<th>패스워드</th>
			<th>성명</th>
			<th>주민번호1</th>
			<th>주민번호2</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${memberList }" var = "memberInfo">
		<tr>
			<td>${memberInfo.mem_id }</td>
			<td>${memberInfo.mem_name } </td>
			<td>${memberInfo.mem_bir }</td>
			<td>${memberInfo.mem_mail }</td>
		
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>	