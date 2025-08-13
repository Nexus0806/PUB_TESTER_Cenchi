<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<link rel="shortcut icon" href="_img/favicon.png"/> <!-- 파비콘 -->

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/default.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/slick.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<title>중소기업을 위한 공공체험단</title>
<script src="/_js/pop_layer.js"></script>
<script src="/_js/cont.js"></script>
</head>
<body>

<!-- 알림 (회원가입 성공시 1회성으로 뜸) -->
<c:if test="${not empty joinSuccess}">
<script>
  alert('회원가입이 완료되었습니다.\n이메일과 비밀번호로 로그인해 주세요.');
</script>
</c:if>

<jsp:include page="/WEB-INF/jsp/_inc/header.jsp" />

<div id="sub_content">
		<h1 class="log_logo"><img src="${pageContext.request.contextPath}/_img/pc/comn/logo.svg" alt="공공체험단"></h1>
		<div class="login_all">

		<ul class="mem_tab">
			<li class="tab-link current" data-tab="tab-1">인플루언서</li>
			<li class="tab-link" data-tab="tab-2">소상공인</li>
        </ul>

		<form action="${pageContext.request.contextPath}/preuser/member/login.do" method="post" id="loginForm">
        <div id="tab-1" class="mem_con current">
        <input type="hidden" name="type" value="inf">
			<div class="login">
				<p class="lg_wrap">
					<label for="loginId">ID</label>
					<input type="text" id="loginId" name="loginId" placeholder="이메일을 입력해주세요."
					value="${not empty savedID ? savedID : ''}">
					<label for="password">Password</label>
					<input class="mt10" type="password" id="loginPass" name="loginPass" placeholder="비밀번호를 입력해주세요.">
				</p>
				<div class="flex">
					<p class="save_id">
						<input class="checkbox" type="checkbox" id="save_id" name="save_id"
						<c:if test="${not empty savedID}">checked</c:if>>	<%-- savedID 항목이 비어있지 않다면, id 저장을 한것으로 간주 --%>
						<label for="save_id">ID 저장</label>
					</p>
				</div>
				
				<c:if test="${not empty loginError}"> <%-- 로그인에 실패했다면(로그인 에러가 null 이 아니라면) --%>
					<p class="j_caution" style="color:#e33">${loginError}</p>
				</c:if>

				<p class="lg_btn">
					<a href="/preuser/member/join.do?type=inf">회원가입</a>
					<a href="#" class="btn" onclick="document.getElementById('loginForm').submit(); return false;">로그인</a>
				</p>
			</div><!-- login -->
		</div> <!-- tab-1 인플루언서 -->
		</form>

        <div id="tab-2" class="mem_con">
        <input type="hidden" name="type" value="bss">
			<div class="login">
				<p class="lg_wrap">
					<label for="loginId">ID</label>
					<input type="text" id="loginId" name="loginId" placeholder="이메일을 입력해주세요."
					value = "${not empty savedID ? savedID : ''}">
					<label for="password">Password</label>
					<input class="mt10" type="password" id="loginPass" name="loginPass" placeholder="비밀번호를 입력해주세요.">
				</p>
				<div class="flex">
					<p class="save_id">
						<input class="checkbox" type="checkbox" id="save_id" name="save_id">
						<label for="save_id">ID 저장</label>
					</p>
				</div>

				<p class="lg_btn">
					<a href="/preuser/member/join.do?type=bss">회원가입</a>
					<a href="#none">로그인</a>
				</p>
			</div><!-- login -->
		</div> <!-- tab-2 소상공인 -->
		</div><!-- login_all -->
	</div><!-- sub_content -->

<script src="/_js/ui.js"></script>

<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />
</body>
</html>