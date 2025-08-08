<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no">
	<meta name="generator" content="editplus">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<title>공공체험단 관리자</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_css/default.css">
	<link rel="icon" type="image/png" sizes="16x16" href="https://www.withsystem.com/with2019/_img/favicon/fvc.ico">
	<script type="text/javascript" src="http://sian.pms.or.kr/with_adm/_js/jquery-3.2.1.min.js"></script>
	<script src="http://sian.pms.or.kr/with_adm/_js/pop_layer.js"></script></head>
<body>
	<div class="login_bg">
		<form name="login_frm" id="login_frm">
			<div class="login">
				<h1><img src="http://sian.pms.or.kr/with_adm/images/common/logo.svg" alt="동서발전"></h1>

				<p class="lg_wrap">
					<label for="loginId">아이디</label>
					<input type="text" id="loginId" name="loginId" placeholder="아이디">
					<label for="password">비밀번호</label>
					<input class="mt10" type="password" id="loginPass" name="loginPass" placeholder="비밀번호">
				</p>
				<p class="lg_btn">
					<a href="http://sian.pms.or.kr/with_adm/main.html">로그인</a>
				</p>
				<p class="save_id">
					<input class="checkbox" type="checkbox" id="save_id" name="save_id"> 
					<label for="save_id">아이디 기억하기</label>
				</p>
				<p class="copy">
					ⓒ KOREA EAST-WEST POWER CO.,LTD (EWP). <br>ALL RIGHTS RESERVED.
				</p>
			</div>
		</form>	
	</div>

<script type="text/javascript">
/* 예전에 있던 소스 가져옴 _ 참고하시려면 하시고 아니면 지우셔도 상관없습니다. 
$(document).ready(function() {
		$("input[type='text']").keyup(function(e) {
			if(e.keyCode == "13") {
				login();
			}
		});
		
		$("input[type='password']").keyup(function(e) {
			if(e.keyCode == "13") {
				login();
			}
		});
		
		readCookie();	
	});

	function login() {
		if ($("#loginId").val() == "") {
			alert("아이디를 입력하세요.");
			$("#loginId").focus();
			return;
		}
		if ($("#loginPass").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#loginPass").focus();
			return;
		}

		if (checkChecked("save_id", "checkbox")) {
			setCookie("idCook", $("#loginId").val(), 10);
		} else {
			deleteCookie("idCook");
		}

		$("#login_frm").submit();
	}
	
	function fnInit(val) {
		var message = val;
		if (message != "" && message != null) {
	        alert(message);
		}
	}

	//-------------------- 아이디 저장 쿠키-----------------------------//
	function getCookie(cookieName){
		var search = cookieName + "=";
		var cookie = document.cookie;

		if( cookie.length > 0 ){
		startIndex = cookie.indexOf( cookieName );

		 	if( startIndex != -1 ){
				startIndex += cookieName.length;
				endIndex = cookie.indexOf( ";", startIndex );
		
				if( endIndex == -1) endIndex = cookie.length;
				return unescape( cookie.substring( startIndex + 1, endIndex ) );
		  	}else{
				return false;
		  	}
		}else{
			return false;
		}
	}

	function setCookie(cookieName, cookieValue, expireDate){
		var today = new Date();
		today.setDate( today.getDate() + parseInt( expireDate ) );
		document.cookie = cookieName + "=" + escape( cookieValue ) + "; path=/; expires=" + today.toGMTString() + ";";
	}

	function readCookie(){
		if(getCookie("idCook")!=false){
			$("input:checkbox[id='save_id']").attr("checked", true);
			$("input:checkbox[id='save_id']").parent().addClass("checked");
			$("#loginId").val(getCookie("idCook"));
			$("#loginPass").focus();
		}else{
			$("#loginId").focus();
		}
	}

	function deleteCookie(cookieName){
		var expireDate = new Date();
		expireDate.setDate( expireDate.getDate() - 1 );
		document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
	}
</script>

</body>

<!-- Mirrored from sian.pms.or.kr/with_adm/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 08 Aug 2025 01:09:48 GMT -->
</html>