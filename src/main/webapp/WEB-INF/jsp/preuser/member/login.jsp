<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="/preuser/_js/pop_layer.js"></script>
<script src="/preuser/_js/cont.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/_inc/header.jsp" />

<div id="sub_content">
		<h1 class="log_logo"><img src="${pageContext.request.contextPath}/_img/pc/comn/logo.svg" alt="공공체험단"></h1>
		<div class="login_all">

		<ul class="mem_tab">
			<li class="tab-link current" data-tab="tab-1">인플루언서</li>
			<li class="tab-link" data-tab="tab-2">소상공인</li>
        </ul>

        <div id="tab-1" class="mem_con current">
			<div class="login">
				<p class="lg_wrap">
					<label for="loginId">ID</label>
					<input type="text" id="loginId" name="loginId" placeholder="이메일을 입력해주세요.">
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
					<a href="/preuser/member/join.html">회원가입</a>
					<a href="#none">로그인</a>
				</p>
			</div><!-- login -->
		</div> <!-- tab-1 인플루언서 -->

        <div id="tab-2" class="mem_con">

			<div class="login">
				<p class="lg_wrap">
					<label for="loginId">ID</label>
					<input type="text" id="loginId" name="loginId" placeholder="이메일을 입력해주세요.">
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
					<a href="/preuser/member/join.html">회원가입</a>
					<a href="#none">로그인</a>
				</p>
			</div><!-- login -->

		</div> <!-- tab-2 소상공인 -->

		</div><!-- login_all -->
	</div><!-- sub_content -->

<script type="text/javascript">

$('.navi_btn').click(function(){
		$('.navi').stop(true).fadeToggle('fast');
		$(this).toggleClass('on');
		$('#tm_header').toggleClass('on');
	});

$('.close').click(function(){
		$('.navi').stop(true).fadeOut('fast');
		$('#tm_header').removeClass('on');
	});



//dep01, dep02
$('.lnb .dep01 > li:has(.dep02)').children('a').addClass('has-sub');
if($(window).width() <= 1024) {
	$(".lnb .dep01 > li > a").click(function(){
		if($(this).is(".has-sub")){
			event.preventDefault();
			$(this).parent().siblings('li').children('ul.dep02').stop().slideUp();
			$(this).parent().siblings('li').children('a').removeClass('on');
			$(this).siblings('ul').stop().slideToggle();
			$(this).toggleClass('on');
		}else{
		}
	});
};

//search
 $('.sch_btn').click(function(){
		$('.tm_sch_wrap').fadeIn();
		//$('#header').addClass('click');
	});
	$('.tm_x').click(function(){
		$('.tm_sch_wrap').fadeOut();
		//$('#header').removeClass('click');
});


//gnb
$('#header ul.gnb > li').mouseenter(function(){
	$('#header ul.gnb > li').removeClass('on');
	$('#header .gnb_sub').stop().hide();
	$(this).addClass('on');
	$(this).find('.gnb_sub').stop().fadeIn(200);
});
$('#header ul.gnb > li').mouseleave(function(){
	$('#header ul.gnb > li').removeClass('on');
	$('#header .gnb_sub').stop().fadeOut(200);
});


</script>

<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />
</body>
</html>