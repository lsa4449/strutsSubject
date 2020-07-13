<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="memberInfo" value="${memberInfo}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원상세정보</title>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/common/commons.js'></script>
<script type="text/javascript">
$(function() {
	
		 const sido = getSido();
	     $('#mem_sido').append(sido);

	     const month = getMonthOptions();
	     $('#mem_month').append(month);    
		
	    var mail = '${memberInfo.mem_mail}';
	    var mail1 = mail.split('@');
	    
	    var tel = '${memberInfo.mem_tel}';
		var tel1 = tel.split('-');
		
		var bir = '${memberInfo.mem_bir}';
		var bir1 = bir.split('-');
		
		var zip1 = '${memberInfo.mem_zip1}';
		var zip2 = '${memberInfo.mem_zip2}';
		
	   $('input[name=mem_mail1]').val(mail1[0]);
	   $('input[name=mem_mail2]').val(mail1[1]);

	   $('select[name=mem_hp1]').val(tel1[0]);
	   $('input[name=mem_hp2]').val(tel1[1]);
	   $('input[name=mem_hp3]').val(tel1[2]);
	   
	   $('select[name=mem_year]').val(bir1[0]);
	   $('select[name=mem_month] option[value="'+ bir1[1] +'"]').attr('selected',true); 
	   $('select[name=mem_day]').val(bir.substring(8,10));
	   
	   $('select[name=mem_sido]').val(zip1);
	   $('select[name=mem_gugun]').val(zip2);
	   $('input[name=mem_lift]').val($('input[name="mem_calendar"]:checked').val());

	 $('form').submit(function(){
		$('input[name=mem_mail]').val($('input[name=mem_mail1]').val() + "@" + $('input[name=mem_mail2]').val());
		
		$('input[name=mem_bir]').val($('select[name=mem_year]').val() + "-" + $('select[name=mem_month]').val()
				+ "-" + $('select[name=mem_day]').val());
		$('input[name=mem_tel]').val($('select[name=mem_hp1]').val() + "-" + $('input[name=mem_hp2]').val()
				+ "-" + $('input[name=mem_hp3]').val());
		$('input[name=mem_lift]').val($('input[name="mem_calendar"]:checked').val());


		if($('#mem_pw').val() != $('#mem_pass_confirm').val()){
			alertMSG('비밀번호를 확인해주세요.');
			return false;
		}	

		var mem_id = $('label[class = mem_id]').val();
		if (!mem_id.validationID()) {
			alertMSG('아이디를 바르게 입력해주세요.');
			return false;
		}
		
		var mem_pw = $('input[name = mem_pw]').val();
		if (!mem_pw.validationPWD()) {
			alertMSG('비밀번호를 바르게 입력해주세요.');
			return false;
		}
		
		var mem_mail = $('input[name = mem_mail]').val();
		if (!mem_mail.validationMAIL()) {
			alertMSG('메일을 바르게 입력해주세요.');
			return false;
		}
		
		var mem_hp = $('input[name = mem_hp]').val();
		if (!mem_hp.validationHP()) {
			alertMSG('전화번호를 바르게 입력해주세요.');
			return false;
		}
		return true; 
		
	});
	 
		$('.btn3').click(function(){
			$(location).attr('href', "${pageContext.request.contextPath }/admin/member/main1.do");
		});
	 
});

function Onchange() {
	var gugun2 = $('select[name = mem_sido]').val();
	const gugun = getGugun(gugun2);
	alert(gugun);
	
	for(var i = 1; i < gugun.length; i++) {
		option = "<option value='" + gugun[i] + "'>" + gugun[i] + "</option>";
		$('#mem_gugun').append(option);
	}
}

</script>
</head>
<body>
<div class="wrap">	
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180">
			</td>
			<td width="30">&nbsp;</td>
			<td width="790">
				<div id="container">
					<div class="title">회원정보</div>
					<form method="post" name="updateMemberForm" action="${pageContext.request.contextPath }/admin/member/updateMemberInfo2.do">
						<table border="0" cellspacing="1" cellpadding="1">
							<tr>
								<th><span class="r">*</span>이름</th>
								<td>
								<input type="hidden" name="mem_name" value="${memberInfo.mem_name}""/>
								<input name="mem_name" value="${memberInfo.mem_name}" type="text" id="mem_name" size="20" disabled="disabled"/></td>
							</tr>
							<tr>
								<th><span class="r">*</span>아이디</th>
								<td>
								<input type="hidden" name="mem_id" value="${memberInfo.mem_id}""/>
								<input name="mem_id" value="${memberInfo.mem_id}" type="text" id="mem_id" size="20" disabled="disabled"/></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호</th>
								<td><input name="mem_pw" value="${memberInfo.mem_pw}" type="text" id="mem_pw" size="20" /></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호 확인</th>
								<td><input name="mem_pass_confirm" value="${memberInfo.mem_pw}" type="text" id="mem_pass_confirm" size="20" /></td>
							</tr>
							<tr>
								<th>이메일 주소</th>
								<td>
									<input type="hidden" name="mem_mail" />
									<input name="mem_mail1" type="text" id="mem_mail1" size="20" />@
									<input name="mem_mail2" type="text" id="mem_mail2" size="20" /> 
								</td>
							</tr>
							<tr>
								<th>거주지</th>
								<td>
									<select style="width: 130px; margin-right: 10px;" name="mem_sido" id="mem_sido" onchange="Onchange();">
											<option selected="selected">선택하세요</option>
									</select>
									
									<select style="width: 130px;" name="mem_gugun" id="mem_gugun">
										<option selected="selected">선택하세요</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
								<input type="hidden" name="mem_tel" />
								<select style="width: 100px;" name="mem_hp1">
										<option selected="selected">선택하세요</option>
										<option value="010">010</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select> - 
									<input name="mem_hp2" type="text" id="mem_hp2" size="20" /> - 
									<input name="mem_hp3" type="text" id="mem_hp3" size="20" />
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<input type="hidden" name="mem_lift" />
									<input type="radio" name="mem_calendar" value="solar" checked/>양력
									<input type="radio" name="mem_calendar" value="lunar" />음력 
									
									<input type="hidden" name="mem_bir" />
									<select style="width: 130px; margin-left: 10px;" name="mem_year">
										<option selected="selected">선택하세요</option>
										<c:forEach var="i" begin="1950" end="2020" >
											<option><c:out value="${i}"></c:out></option>
										</c:forEach>
									</select> 
									<select style="width: 130px;" name="mem_month" id="mem_month">
										<option selected="selected">선택하세요</option>
									</select> 
									<select style="width: 130px;" name="mem_day">
										<option selected="selected">선택하세요</option>
										<c:forEach var="i" begin="1" end="31" >
											<option><c:out value="${i}"></c:out></option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
						<div style="float: right;">
							<input class="btn2" type="submit" value="변경내용 저장" id="updateMember"/>
							<input class="btn3" type="button" value="목록" />
						</div>
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>