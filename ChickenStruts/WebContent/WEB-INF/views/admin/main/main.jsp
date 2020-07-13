<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:set value="${memberList}" var="memberList"></c:set> --%>
<c:set var="paginationMenu" value="${pagination  }"></c:set>
<%-- <c:set var="DeleteURI" value="/admin/member/memberDelete.do"></c:set> --%>
<%-- <c:set var="UpdateURI" value="/admin/member/memberForm.do"></c:set> --%>
<c:set var="ExcelURI" value="/admin/member/MemberExcel.do"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유웅치킨</title>
<style type="text/css">
</style>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-latest.js'></script>
<link rel="stylesheet"
	href="https://han3283.cafe24.com/js/lightslider/css/lightslider.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="https://han3283.cafe24.com/js/lightslider/js/lightslider.js"></script>
</head>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/common/commons.js'></script>
<script type="text/javascript">
	$(function() {
		$('#tb > tr > td:nth-child(6)').click(
				function() {
					var mem_id = $(this).find('input').val();
					$(location).attr(
							'href',
							'${pageContext.request.contextPath }/admin/member/deleteMemberInfo2.do?mem_id='
									+ mem_id);
					alert('탈퇴처리가 완료되었습니다.');
				});

		$('#tb > tr > td:nth-child(2)').click(
				function() {
					var mem_id = $(this).find('input').val();
					$(location).attr(
							'href',
							'${pageContext.request.contextPath }/admin/member/memberForm.do?mem_id='
									+ mem_id);

				});

		$('#excel')
				.click(
						function() {
							$(location)
									.attr('href',
											'${pageContext.request.contextPath }/admin/member/exec.do');
						});

		const
		sido = getSido();
		$('select[name = search_sido]').append(sido);
	});

	function Onchange() {
		var gugun2 = $('select[name = search_sido]').val();
		const
		gugun = getGugun(gugun2);

		$('#search_gugun option').remove();
		var option = '<option value="">선택해주세요</option>'; 

		for (var i = 1; i < gugun.length; i++) {
			option = "<option value='" + gugun[i] + "'>" + gugun[i]
					+ "</option>";
			$('select[name = search_gugun]').append(option);
		}
	}
</script>

<body>
	<div class="wrap">
		<table width="1000" border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td width="180"><jsp:include page="fquestionBoardMenu.jsp"></jsp:include></td>
				<td width="30">&nbsp;</td>
				<td width="790">
					<div id="container">
						<div class="title">회원관리</div>
						<form name="search_form"
							action="${pageContext.request.contextPath}/admin/member/main1.do">
							<table border="0" cellspacing="1" cellpadding="1">
								<tr>
									<th width="120">기본검색</th>
									<td><select style="width: 130px;" name="search_keycode">
											<option selected="selected">선택하세요</option>
											<option value="all">전체</option>
											<option value="search_name">이름</option>
											<option value="search_id">아이디</option>
									</select> <input name="search_keyword" type="text" size="20" /></td>
								</tr>
								<tr>
									<th>거주지</th>
									<td><select style="width: 130px;" name="search_sido"
										onchange="Onchange();">
											<option selected="selected">선택하세요</option>
									</select> <select style="width: 130px;" name="search_gugun">
											<option selected="selected">선택하세요</option>
									</select></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><select style="width: 100px;" name="search_hp1">
											<option selected="selected">선택하세요</option>
											<option value="010">010</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="019">019</option>
									</select> - <input name="search_hp2" type="text" id="search_hp2"
										size="20" /> - <input name="search_hp3" type="text"
										id="search_hp3" size="20" /></td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td><input type="radio" name="search_calendar"
										value="solar" checked="checked" />양력 <input type="radio"
										name="search_calendar" value="lunar" />음력 <input
										type="hidden" name="mem_bir" /> <select
										style="width: 130px; margin-left: 10px;" name="mem_year">
											<option selected="selected">선택하세요</option>
											<c:forEach var="i" begin="1950" end="2020">
												<option><c:out value="${i}"></c:out></option>
											</c:forEach>
									</select> <select style="width: 130px;" name="mem_month">
											<option selected="selected">선택하세요</option>
											<c:forEach var="i" begin="1" end="12">
												<option><c:out value="${i}"></c:out></option>
											</c:forEach>

									</select> <select style="width: 130px;" name="mem_day">
											<option selected="selected">선택하세요</option>
											<c:forEach var="i" begin="1" end="31">
												<option><c:out value="${i}"></c:out></option>
											</c:forEach>
									</select></td>
								</tr>
							</table>
							<div style="padding-top: 5px; text-align: right;">
								<input class="btn1" type="reset" value="초기화" /> <input
									class="btn1" type="submit" value="검색하기" />
							</div>
						</form>
						<div style="padding-top: 5px;" id="search_totalMembers">
							<label class="totalmembers"></label> <select
								style="width: 50px; float: right;" name="search_count">
								<option selected="selected" value="10">10</option>
								<option value="25">25</option>
								<option value="50">50</option>
							</select>
						</div>
						<div style="height: 15px;"></div>
						<table border="0" cellspacing="1" cellpadding="1" id="tb">
							<thead>
								<tr>
									<th width="10%"><input type="checkbox" name="selectTotal"
										class="checkbox_align" />&nbsp;선택</th>
									<th width="10%">아이디</th>
									<th>이름</th>
									<th>생일</th>
									<th>메일</th>
									<th>탈퇴처리</th>
								</tr>
							</thead>
							<tbody id="tb">
								<tr>
									<c:forEach items="${memberList }" var="memberInfo">
										<td width="10%"><input type="checkbox" name="selectTotal"
											class="checkbox_align" /></td>

										<td width="10%"><input id="hidden" type="hidden"
											value="${memberInfo.mem_id}"> ${memberInfo['mem_id'] }</td>
										<td>${memberInfo.mem_name }</td>
										<td>${memberInfo.mem_bir}</td>
										<td>${memberInfo.mem_mail }</td>
										<c:if test="${memberInfo.mem_x eq '2'}">
											<td id="mem_x">탈퇴처리 <input id="hidden" type="hidden"
												value="${memberInfo.mem_id}">
											</td>
										</c:if>
								</tr>
								</c:forEach>
							</tbody>
						</table>

						<div align="center">
							<input class="publishingCoupon" type="submit" value="선택회원 메일발송"
								style="float: left;" /> <span class="pagingHtml"></span> <input
								class="btn2" type="button" id="excel" value="Excel작성"
								style="float: right;" /> <input class="btn2" type="button"
								value="PDF작성" style="float: right; margin-right: 5px;" />
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	${paginationMenu }
</body>
</html>
