<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="zipcode" value="/user/member/zipCode.do"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원상세정보</title>
<script type='text/javascript' src = 'http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/common/commons.js'></script>
<script type="text/javascript">
$(function() {
	
 	$('#btn2').click(function(){
		   $(location).attr('href',"/ChickenStruts/user/join/loginForm.do");
	}); 
	
	$('#mem_lift').val('${memberInfo.mem_lift}');
	
	$('form').submit(function(){
		
		$('input[name=mem_mail]').val($('input[name=mem_mail1]').val() + "@" + $('select[name=mem_mail2]').val());
		$('input[name=mem_bir]').val($('select[name=mem_year]').val() + "-" + $('select[name=mem_month]').val()
				+ "-" + $('select[name=mem_day]').val());
		$('input[name=mem_tel]').val($('select[name=mem_tel1]').val() + "-" + $('input[name=mem_tel2]').val()
				+ "-" + $('input[name=mem_tel3]').val());
		$('input[name=mem_lift]').val($('input[name="mem_calendar"]:checked').val());
		$('input[name=mem_zip1]').val($('select[name=sido]').val());
		$('input[name=mem_zip2]').val($('select[name=gugun]').val());
		
		if($('#mem_pw').val() != $('#mem_pass_confirm').val()){
			alertMSG('비밀번호를 확인해주세요.');
			return false;
		}	
		

		var mem_name = $('input[name = mem_name]').val();
		if (!mem_name.validationNICKNAME()) {
			alertMSG('이름을 바르게 입력해주세요.');
			return false;
		}
		var mem_id = $('input[name = mem_id]').val();
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
		const sido = getSido();
            $('#sido').append(sido);
            
});
    function Onchange() {
    	var gugun2 = $('select[name = sido]').val();
    	const gugun = getGugun(gugun2);
    	
    	for(var i = 1; i < gugun.length; i++) {
    		option = "<option value='" + gugun[i] + "'>" + gugun[i] + "</option>";
    		$('#gugun').append(option);
    	}
    }

	function alertMSG(msg){
		BootstrapDialog.show({
			title : '알립니다..',
			message : msg
		});
		return false;
	}
</script>
</head>
<body>
<div class="wrap">	
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180">
			<td width="30">&nbsp;</td>
			<td width="790">
				<div id="container">
					<div class="title">회원정보</div>
					<form method="post" name="updateMemberForm" action="{context.request.contextPath}/user/member/InsertMemberInfo.do">
						<table border="0" cellspacing="1" cellpadding="1">
							<tr>
								<th><span class="r">*</span>이름</th>
								<td><input name="mem_name" type="text" id="mem_name" size="20"/></td>
							</tr>
							<br>
							<tr>
								<th><span class="r">*</span>아이디</th>
								<td><input name="mem_id" type="text" id="mem_id" size="20" /></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호</th>
								<td><input name="mem_pw" type="text" id="mem_pw" size="20" /></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호 확인</th>
								<td><input name="mem_pass_confirm" type="text" id="mem_pass_confirm" size="20" /></td>
							</tr>
							<tr>
								<th>이메일 주소</th>
								<td>
									<input type="hidden" name="mem_mail" />
									<input name="mem_mail1" type="text" id="mem_mail1" size="20" />@
									<select name="mem_mail2">
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="pretty.net">pretty.net</option>
										<option value = "orgio.net">orgio.net</option>
										<option value = "unitel.co.kr">unitel.co.kr</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>거주지</th>
								<td>
									<input type="hidden" name="mem_zip1" />
									<select style="width: 130px; margin-right: 10px;" 
											name="sido" id="sido" onchange="Onchange();">
											<option selected="selected">선택하세요</option>
									</select>
									
									<input type="hidden" name="mem_zip2" />
									<select style="width: 130px;" name="gugun" id="gugun">
										<option selected="selected">선택하세요</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
								<input type="hidden" name="mem_tel" />
								<select style="width: 100px;" name="mem_tel1">
										<option selected="selected">선택하세요</option>
										<option value="010">010</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select> - 
									<input name="mem_tel2" type="text" id="mem_hp2" size="20" /> - 
									<input name="mem_tel3" type="text" id="mem_hp3" size="20" />
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<input type="hidden" name="mem_lift" />
									<input type="radio" name="mem_calendar" value="양력" checked />양력
									<input type="radio" name="mem_calendar" value="음력" />음력 

									<input type="hidden" name="mem_bir" />
									<select style="width: 130px; margin-left: 10px;" name="mem_year">
										<option selected="selected">선택하세요</option>
										<c:forEach var="i" begin="1950" end="2020" >
											<option><c:out value="${i}"></c:out></option>
										</c:forEach>
									</select> 
									<select style="width: 130px;" name="mem_month">
										<option selected="selected">선택하세요</option>
										<c:forEach var="i" begin="1" end="12" >
											<option><c:out value="${i}"></c:out></option>
										</c:forEach>
										
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
							<input class="btn2" type="submit" value="회원가입" id="updateMember"/>
							<input class="btn2" id="btn2" type="button" value="취소" />
						</div>
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>