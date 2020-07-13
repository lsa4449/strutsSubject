<%@page import="kr.or.ddit.utiles.CryptoGenerator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
html {
  background-color: #edb958;
}

body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
}

a {
  color: #d9a33f;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}


h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px; 
  color: #cccccc;
}



/* STRUCTURE */

.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 30px;
  width: 90%;
  max-width: 450px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}

#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}



/* TABS */

h2.inactive {
  color: #cccccc;
}

h2.active {
  color: #0d0d0d;
  border-bottom: 2px solid #d9a33f;
}



/* FORM TYPOGRAPHY*/

input[type=button], input[type=submit], input[type=reset]  {
  background-color: #edb958;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #ffa500;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

input[type=text], input[type=password] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  
  border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {

  background-color: #fff;
  border-bottom: 2px solid #edb958;
}

input[type=text]:placeholder {
  color: #cccccc;
}



/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #edb958;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #d9a33f;
}

.underlineHover:hover:after{
  width: 100%;
}

/* OTHERS */

*:focus {
    outline: none;
} 

#icon {
  width:60%;
}

</style>
<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/common/validation.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/crypto/jsbn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/crypto/rsa.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/crypto/prng4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/crypto/rng.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js"></script>
<script type='text/javascript'>

				$(function() {
					 if (eval('${!empty param.message}')){                                                                          
					 alert('${param.message}');                                                                              
					 }  
					 
					$('#loginBtn').click(function() {
						var mem_id = $('input[name = mem_id]').val();
						if (!mem_id.validationID()) {
							alert('아이디를 바르게 입력해주세요.');
							return false;
						}
						var mem_pw = $('input[name = mem_pw]').val();
						if (!mem_pw.validationPWD()) {
							alert('비밀번호를 바르게 입력해주세요.');
							return false;
						}
						
					var $frm = $('<form action="{context.request.contextPath}/user/join/loginCheck.do" method = \"post\"></form>');
					var $inputID = $('<input type="hidden" value="' + mem_id + '" name="mem_id" />');    
					var $inputPWD = $('<input type="hidden" value="' + mem_pw + '" name="mem_pw" />');
					
					$frm.append($inputID);                                                                        
					$frm.append($inputPWD);                                                                          
					
					$(document.body).append($frm);
					
					$frm.submit();
					
			});
		});
</script>
<!------ Include the above in your HEAD tag ---------->

<div class="wrapper fadeInDown">
	<div id="formContent">
		<!-- Tabs Titles -->

		<!-- Icon -->
		<div class="fadeIn first">
			<img src="images/icons/chicken.png" id="icon" alt="유웅치킨" />
		</div>
		<!-- Login Form -->
			<input type="text" id="mem_id" class="fadeIn second" name="mem_id" placeholder="login"> 
			<input type="password" id="mem_pw" class="fadeIn third" name="mem_pw" placeholder="password"> 
			<input type="button" class="fadeIn fourth" value="Log In" id="loginBtn">

		<!-- Remind Passowrd -->
		<div id="formFooter">
			<a href="${pageContext.request.contextPath }/user/member/memberForm.do">Join Now</a>
		</div>
	</div>
</div>
</body>
</html>