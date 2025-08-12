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

<jsp:include page="/WEB-INF/jsp/_inc/header.jsp" />

<script src="/_js/ui.js"></script>
	
<form action="${pageContext.request.contextPath}/preuser/member/join.do" method="post">
	<input type="hidden" name="userType" value="${userType}"/>
	<div id="sub_content">
		<div class="s_cont">
			<div class="cont_all">

				<div class="join_wrap">
					<h2 class="sub_tit">회원가입</h2>

					<div class="join_con">
						<h4>이메일<sup>*</sup></h4>
						<div class="j_flex">
							<p class="mail sel">
								<input type="text" name="mbEmail1" id="mb_email1" required>
								<span>@</span>
								<input type="text" name="mbEmail2" id="mb_email2" required>
								<!-- 위나 아래 둘중 하나만 하도록 고치기 -->
								<select class="sel_email" title="이메일 선택">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
								</select>
							</p>
							<a href="#none" class="btn bk">중복확인</a>
						</div>
					</div><!-- join_con -->

					<div class="join_con">
						<h4>비밀번호<sup>*</sup></h4>
						<input type="password" name="password" placeholder="비밀번호를 입력해주세요." required>
					</div><!-- join_con -->

					<div class="join_con">
						<h4>비밀번호 확인<sup>*</sup></h4>
						<input type="password" name="password_Chk" placeholder="비밀번호를 확인해주세요." required>
					</div><!-- join_con -->

					<div class="join_con">
						<h4>이름<sup>*</sup></h4>
						<input type="text" name="mbName" placeholder="반드시 실명을 입력하세요." required>
						<p class="j_caution">이름을 입력해주세요. <br>실명으로 등록하지 않을 경우 불이익이 있을 수 있습니다.</p>
					</div><!-- join_con -->

					<div class="join_con">
						<h4>휴대폰 번호<sup>*</sup></h4>
						<p class="phone">
							<input type="text" name="call1" maxlength="3" placeholder="010" required>
							<span>-</span>
							<input type="text" name="call2" maxlength="4" placeholder="4567" required>
							<span>-</span>
							<input type="text" name="call3" maxlength="4" placeholder="7890" required>
						</p>
						<p class="j_caution">필수 입력사항입니다. <br>휴대폰 번호를 정확히 입력해 주세요.</p>
					</div><!-- join_con -->

					<div class="join_con">
						<h4>생년월일</h4>
						<p class="birth">
							<input type="date" name="birthDate" placeholder="생년" required>
						</p>
					</div><!-- join_con -->

					<div class="join_con">
						<h4>성별</h4>
						<div class="radio_wrap">
							<input type="radio" id="radio01" name="gender" value="F" checked><label for="radio01">여성</label>
							<input type="radio" id="radio02" name="gender" value="M"><label for="radio02">남성</label>
						</div>
					</div><!-- join_con -->

					<!-- 인플루언서 회원가입폼에만 항목 노출해주세요. -->
					<c:if test="${userType eq 'inf'}">
					<div class="join_con">
						<h4>인플루언서 유형<sup>*</sup></h4>
						<div class="j_flex j_ico">
							<p class="ico blog">네이버블로그</p>
							<input type="text" name="url_Blog" placeholder="블로그 url을 입력해주세요.">
						</div>
						<p class="j_caution" style="padding-left: 45px;">필수 입력사항 입니다.</p>

						<div class="j_flex j_ico mt10">
							<p class="ico insta">인스타그램</p>
							<input type="text" name="url_Insta" placeholder="인스타그램 ID를 입력해주세요.">
						</div>
						<div class="j_flex j_ico mt10">
							<p class="ico yout">유튜브</p>
							<input type="text" name="url_Youtube" placeholder="유튜브 url을 입력해주세요.">
						</div>
						<div class="j_flex j_ico mt10">
							<p class="ico tiktok">틱톡</p>
							<input type="text" name="url_Tiktok" placeholder="틱톡 url을 입력해주세요.">
						</div>
						<div class="j_flex j_ico mt10">
							<p class="ico sns">기타</p>
							<input type="text" name="url_ETC" placeholder="기타 url을 입력해주세요.">
						</div>
					</div>
					</c:if>

					<div class="prv_wrap mt20">
						<p class="checkbox">
							<span>
								<input type="checkbox" id="prv01" name="privacy1" value="prv01" required>
								<label for="prv01">이용약관에 동의합니다. <em>(필수)</em></label>
							</span>
						</p>
						<a href="javascript:void(0)" class="prv_cont" onclick="window.open('Popup/TouPop.html','_blank','width=600, height=600, top=100, left=500, scrollbars=yes')">[자세히보기]</a>
					</div>
					<div class="prv_wrap mt20">
						<p class="checkbox">
							<span>
								<input type="checkbox" id="prv02" name="privacy2" value="prv02" required>
								<label for="prv02">개인정보 보호정책에 동의합니다. <em>(필수)</em></label>
							</span>
						</p>
						<a href="javascript:void(0)" class="prv_cont" onclick="window.open('Popup/privacyPop.html','_blank','width=600, height=600, top=100, left=500, scrollbars=yes')">[자세히보기]</a>
					</div>

					<div class="btn_wrap mt40">
						<button type="submit" class="btn w100">회원가입</button>
					</div>
				</div><!-- join_wrap -->

			</div><!-- cont_all -->
		</div><!-- s_cont -->
	</div><!-- sub_content -->
</form>

<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

<script>
$(function () {
  const $sel = $('.sel_email');     // 도메인 선택 select
  const $email2 = $('#mb_email2');  // 도메인 입력 input

  function applyEmailMode() {
    const val = $sel.val();
    if (val) {
      // select에서 선택한 도메인 → input에 세팅 + 수정 불가
      $email2.val(val).prop('readonly', true).addClass('readonly');
    } else {
      // 직접입력 모드 → input 비우고 수정 가능
      $email2.val('').prop('readonly', false).removeClass('readonly').focus();
    }
  }

  // select 변경 시 동기화
  $sel.on('change', applyEmailMode);

  // 초기 로드 시도 적용 (뒤로가기/새로고침 대비)
  applyEmailMode();
});
</script>


</body>

</html>