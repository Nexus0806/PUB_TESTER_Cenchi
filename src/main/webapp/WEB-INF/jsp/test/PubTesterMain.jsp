<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<link rel="shortcut icon" href="_img/favicon.png"/> <!-- 파비콘 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/default.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/slick.css"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<title>중소기업을 위한 공공체험단</title>
	<script src="/preuser/_js/pop_layer.js"></script>
	<script src="/preuser/_js/cont.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/_inc/header.jsp" />

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


</script>    <div id="wrap">
		<div class="banner_wrap">
			<ul class="banner">
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="./_img/pc/main/bn_no_img.png" alt="" / style="background: url(./_img/pc/main/bn01.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="./_img/pc/main/bn_no_img.png" alt="" / style="background: url(./_img/pc/main/bn02.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="./_img/pc/main/bn_no_img.png" alt="" / style="background: url(./_img/pc/main/bn03.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="./_img/pc/main/bn_no_img.png" alt="" / style="background: url(./_img/pc/main/bn01.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="./_img/pc/main/bn_no_img.png" alt="" / style="background: url(./_img/pc/main/bn02.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="./_img/pc/main/bn_no_img.png" alt="" / style="background: url(./_img/pc/main/bn03.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
			</ul>
		</div><!-- banner_wrap 메인 롤링배너 -->

		<div class="pd_slider section sec02">
			<h2 class="h2_tit h2_tit01">프리미엄 체험단</h2>

			<ul class="prd_li prd_slide">
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img01.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_blog">배송</p>
						<div class="prd_txt">
							<strong>[클리우] pck(블레미시 스틱)</strong>
							<p>클리우 pck 블레미시 스틱 1ea</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date">3일 남음</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>150</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_inst">방문</p>
						<div class="prd_txt">
							<strong>[서울/강동구] 셀프사진관 네모세모동그라미</strong>
							<p>흑백/컬러 셀프사진 3만원권 (2~4인) 인원 변경시 사전 연락 필수</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date p_day">D-Day</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>120</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img03.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_yout">배송</p>
						<div class="prd_txt">
							<strong>[스미키] 마이크로 마스카라EX 외</strong>
							<p>스미키 마스카라+뷰러 1세트</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date">2일 남음</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>150</b>명</li>
								<li> / 모집 <em>20</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img04.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_inst">배송</p>
						<div class="prd_txt">
							<strong>[듀이] 온열 진동 마사지기</strong>
							<p>온열 진동 마사지기 1개</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date">3일 남음</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>150</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img05.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_yout">배송</p>
						<div class="prd_txt">
							<strong>[프레이포] 쿨링 아로마 스프레이</strong>
							<p>아로마 스프레이 1세트</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date">3일 남음</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>150</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img06.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_blog">배송</p>
						<div class="prd_txt">
							<strong>[으뜸제약] 그린 오메가3</strong>
							<p>으뜸제약 그린 오메가3 1세트</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date">1일 남음</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>150</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img07.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_inst">방문</p>
						<div class="prd_txt">
							<strong>[서울/용산구] 기왓집 간장게장 2인 정식</strong>
							<p>간장게장 2인 정식</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date p_day">D-Day</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>120</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
			</ul>
		</div><!-- pd_slider sec02 체험단 리스트 (슬라이드) -->

		<div class="pd_slider section sec03">
			<h2 class="h2_tit h2_tit02">인기 체험단</h2>

			<ul class="prd_li prd_slide">
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_inst">방문</p>
						<div class="prd_txt">
							<strong>[서울/강동구] 셀프사진관 네모세모동그라미</strong>
							<p>흑백/컬러 셀프사진 3만원권 (2~4인) 인원 변경시 사전 연락 필수</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date p_day">D-Day</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>120</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img07.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_inst">방문</p>
						<div class="prd_txt">
							<strong>[서울/용산구] 기왓집 간장게장 2인 정식</strong>
							<p>간장게장 2인 정식</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date p_day">D-Day</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>120</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img03.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_yout">배송</p>
						<div class="prd_txt">
							<strong>[스미키] 마이크로 마스카라EX 외</strong>
							<p>스미키 마스카라+뷰러 1세트</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date">2일 남음</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>150</b>명</li>
								<li> / 모집 <em>20</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img05.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_yout">배송</p>
						<div class="prd_txt">
							<strong>[프레이포] 쿨링 아로마 스프레이</strong>
							<p>아로마 스프레이 1세트</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date">3일 남음</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>150</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img08.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_inst">배송</p>
						<div class="prd_txt">
							<strong>[샤오] 샤오 무선 선풍기</strong>
							<p>샤오 무선 선풍기 1개</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date">3일 남음</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>150</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img09.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_blog">배송</p>
						<div class="prd_txt">
							<strong>[미소건강헬스푸드] 미소건강주스 자몽주스</strong>
							<p>미소건강주스 자몽</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date">3일 남음</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>150</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="prd_img">
							<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img10.png)no-repeat 50% 50% / cover;">
						</div><!-- prd_img -->
						<p class="sns_txt sns_blog">배송</p>
						<div class="prd_txt">
							<strong>[해준닭갈비] 춘천닭갈비</strong>
							<p>춘천닭갈비(해준닭갈비) 밀키트</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<span class="p_date">3일 남음</span>
							<ul class="rec_app">
								<li class="tt">신청 <b>150</b>명</li>
								<li> / 모집 <em>10</em>명</li>
							</ul>
						</div><!-- prd_rec -->
					</a>
				</li>
			</ul>
		</div><!-- pd_slider sec03 체험단 리스트 (슬라이드) -->

		<div class="pd_list section sec04">
			<h2 class="h2_tit h2_tit03">신규 체험단</h2>

			<div class="web">
				<ul class="prd_li prd_li02">
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img03.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[스미키] 마이크로 마스카라EX 외</strong>
								<p>스미키 마스카라+뷰러 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">2일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>20</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img01.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[클리우] pck(블레미시 스틱)</strong>
								<p>클리우 pck 블레미시 스틱 1ea</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img06.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[으뜸제약] 그린 오메가3</strong>
								<p>으뜸제약 그린 오메가3 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">1일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img12.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[아이아이] CCP로션&CCP스틱밤</strong>
								<p>로션 1개+스틱밤 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">1일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img04.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">배송</p>
							<div class="prd_txt">
								<strong>[듀이] 온열 진동 마사지기</strong>
								<p>온열 진동 마사지기 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img05.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[프레이포] 쿨링 아로마 스프레이</strong>
								<p>아로마 스프레이 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img10.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[해준닭갈비] 춘천닭갈비</strong>
								<p>춘천닭갈비(해준닭갈비) 밀키트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img07.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">방문</p>
							<div class="prd_txt">
								<strong>[서울/용산구] 기왓집 간장게장 2인 정식</strong>
								<p>간장게장 2인 정식</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date p_day">D-Day</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>120</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">방문</p>
							<div class="prd_txt">
								<strong>[서울/강동구] 셀프사진관 네모세모동그라미</strong>
								<p>흑백/컬러 셀프사진 3만원권 (2~4인) 인원 변경시 사전 연락 필수</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date p_day">D-Day</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>120</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img11.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[서울/구로구] 헤이세이치킨</strong>
								<p>치킨 1마리(종류무관) 구매권</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">2일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img09.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[미소건강헬스푸드] 미소건강주스 자몽주스</strong>
								<p>미소건강주스 자몽</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img08.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">배송</p>
							<div class="prd_txt">
								<strong>[샤오] 샤오 무선 선풍기</strong>
								<p>샤오 무선 선풍기 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
				</ul>
			</div> <!-- web -->

			<!-- 이 아래에 있는 리스트도 상단의 web 안에 prd_li02 와 스타일 동일한 리스트 입니다!
			반응형 959px 사이즈부터 최대 6개까지만 노출되고, 더보기 버튼 누르면 나머지 리스트 노출 되게 해주시면 됩니다.
			아래 sec05 섹션도 동일하게 적용 부탁드립니다. -->

			<div class="tablet mobile">
				<ul class="prd_li prd_li02 prd_li02_2">
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img03.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[스미키] 마이크로 마스카라EX 외</strong>
								<p>스미키 마스카라+뷰러 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">2일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>20</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img01.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[클리우] pck(블레미시 스틱)</strong>
								<p>클리우 pck 블레미시 스틱 1ea</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img06.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[으뜸제약] 그린 오메가3</strong>
								<p>으뜸제약 그린 오메가3 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">1일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img12.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[아이아이] CCP로션&CCP스틱밤</strong>
								<p>로션 1개+스틱밤 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">1일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img04.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">배송</p>
							<div class="prd_txt">
								<strong>[듀이] 온열 진동 마사지기</strong>
								<p>온열 진동 마사지기 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img05.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[프레이포] 쿨링 아로마 스프레이</strong>
								<p>아로마 스프레이 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img10.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[해준닭갈비] 춘천닭갈비</strong>
								<p>춘천닭갈비(해준닭갈비) 밀키트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img07.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">방문</p>
							<div class="prd_txt">
								<strong>[서울/용산구] 기왓집 간장게장 2인 정식</strong>
								<p>간장게장 2인 정식</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date p_day">D-Day</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>120</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">방문</p>
							<div class="prd_txt">
								<strong>[서울/강동구] 셀프사진관 네모세모동그라미</strong>
								<p>흑백/컬러 셀프사진 3만원권 (2~4인) 인원 변경시 사전 연락 필수</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date p_day">D-Day</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>120</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img11.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[서울/구로구] 헤이세이치킨</strong>
								<p>치킨 1마리(종류무관) 구매권</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">2일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img09.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[미소건강헬스푸드] 미소건강주스 자몽주스</strong>
								<p>미소건강주스 자몽</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img08.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">배송</p>
							<div class="prd_txt">
								<strong>[샤오] 샤오 무선 선풍기</strong>
								<p>샤오 무선 선풍기 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
				</ul>

				<div class="list02_more">
					<a href="#none" class="li02_btn">더보기</a>
				</div><!-- list02_more -->
			</div> <!-- prd_li_wrap ta,mo -->

		</div><!-- pd_list sec04 체험단 리스트 (슬라이드X) -->

		<div class="pd_list section sec05">
			<h2 class="h2_tit h2_tit04">마감임박</h2>

			<div class="web">
				<ul class="prd_li prd_li02">
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img04.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">배송</p>
							<div class="prd_txt">
								<strong>[듀이] 온열 진동 마사지기</strong>
								<p>온열 진동 마사지기 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img10.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[해준닭갈비] 춘천닭갈비</strong>
								<p>춘천닭갈비(해준닭갈비) 밀키트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img11.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[서울/구로구] 헤이세이치킨</strong>
								<p>치킨 1마리(종류무관) 구매권</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">2일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img09.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[미소건강헬스푸드] 미소건강주스 자몽주스</strong>
								<p>미소건강주스 자몽</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img03.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[스미키] 마이크로 마스카라EX 외</strong>
								<p>스미키 마스카라+뷰러 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">2일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>20</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img06.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[으뜸제약] 그린 오메가3</strong>
								<p>으뜸제약 그린 오메가3 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">1일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img12.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[아이아이] CCP로션&CCP스틱밤</strong>
								<p>로션 1개+스틱밤 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">1일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">방문</p>
							<div class="prd_txt">
								<strong>[서울/강동구] 셀프사진관 네모세모동그라미</strong>
								<p>흑백/컬러 셀프사진 3만원권 (2~4인) 인원 변경시 사전 연락 필수</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date p_day">D-Day</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>120</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img05.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[프레이포] 쿨링 아로마 스프레이</strong>
								<p>아로마 스프레이 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img01.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[클리우] pck(블레미시 스틱)</strong>
								<p>클리우 pck 블레미시 스틱 1ea</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img07.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">방문</p>
							<div class="prd_txt">
								<strong>[서울/용산구] 기왓집 간장게장 2인 정식</strong>
								<p>간장게장 2인 정식</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date p_day">D-Day</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>120</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img08.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">배송</p>
							<div class="prd_txt">
								<strong>[샤오] 샤오 무선 선풍기</strong>
								<p>샤오 무선 선풍기 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
				</ul>
			</div> <!-- web -->

			<div class="tablet mobile">
				<ul class="prd_li prd_li02 prd_li03_2">
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img04.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">배송</p>
							<div class="prd_txt">
								<strong>[듀이] 온열 진동 마사지기</strong>
								<p>온열 진동 마사지기 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img10.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[해준닭갈비] 춘천닭갈비</strong>
								<p>춘천닭갈비(해준닭갈비) 밀키트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img11.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[서울/구로구] 헤이세이치킨</strong>
								<p>치킨 1마리(종류무관) 구매권</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">2일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img09.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[미소건강헬스푸드] 미소건강주스 자몽주스</strong>
								<p>미소건강주스 자몽</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img03.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[스미키] 마이크로 마스카라EX 외</strong>
								<p>스미키 마스카라+뷰러 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">2일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>20</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img06.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[으뜸제약] 그린 오메가3</strong>
								<p>으뜸제약 그린 오메가3 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">1일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img12.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[아이아이] CCP로션&CCP스틱밤</strong>
								<p>로션 1개+스틱밤 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">1일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">방문</p>
							<div class="prd_txt">
								<strong>[서울/강동구] 셀프사진관 네모세모동그라미</strong>
								<p>흑백/컬러 셀프사진 3만원권 (2~4인) 인원 변경시 사전 연락 필수</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date p_day">D-Day</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>120</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img05.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_yout">배송</p>
							<div class="prd_txt">
								<strong>[프레이포] 쿨링 아로마 스프레이</strong>
								<p>아로마 스프레이 1세트</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img01.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[클리우] pck(블레미시 스틱)</strong>
								<p>클리우 pck 블레미시 스틱 1ea</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img07.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">방문</p>
							<div class="prd_txt">
								<strong>[서울/용산구] 기왓집 간장게장 2인 정식</strong>
								<p>간장게장 2인 정식</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date p_day">D-Day</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>120</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
					<li>
						<a href="#none">
							<div class="prd_img">
								<img src="./_img/pc/main/no_img.png" alt="" / style="background: url(./_img/pc/main/sec02_img08.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<p class="sns_txt sns_inst">배송</p>
							<div class="prd_txt">
								<strong>[샤오] 샤오 무선 선풍기</strong>
								<p>샤오 무선 선풍기 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">3일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
				</ul>

				<div class="list03_more">
					<a href="#none" class="li03_btn">더보기</a>
				</div><!-- list03_more -->
			</div> <!-- ta,mo -->

		</div><!-- pd_list sec05 체험단 리스트 (슬라이드X) -->

		<div class="bt_banner section sec06">
			<div class="bt_bn">
				<p class="web"><img src="./_img/pc/main/ft_bn.png" alt="" /></p>
				<p class="tablet"><img src="./_img/ta/main/ft_bn_ta.png" alt="" /></p>
				<p class="mobile"><img src="./_img/mo/main/ft_bn_mo.png" alt="" /></p>
			</div><!-- bt_bn -->
		</div><!-- bt_banner sec06 하단 배너 -->
    </div><!-- wrap -->

	<div class="content"></div> <!-- 좌우 여백 없는 content-->
	<div class="s_content"></div> <!-- 좌우 여백 있는 content-->
   <footer>
	<div id="footer">
		<h1>
			<a href="#none" class="ft_logo"></a>
		</h1>
		
		<div class="ft_info">
			<div class="ft_left">
				<div class="ft_txt">
					<p>대표이사 : 이형기</p><em></em><p>hklee@withsystem.com</p><i></i>
					<p>서울 금천구 가산디지털1로 225 에이스 가산 포휴(지식산업센터) 10층 1005-1008호</p><i></i>
					<p>TEL : 02-3211-5011</p><em></em><p>FAX : 02-733-7766</p>
				</div><!-- ft_txt -->
				<p class="copy">Copyright 2020 by withsystem. All rights reserved.</p>
			</div><!-- ft_left -->
			
			<div class="ft_right">
				<ul class="privacy">
					<li>
						<a href="#none">고객센터</a>
					</li>
					<li>
						<a href="#none">이용약관</a>
					</li>
					<li>
						<a href="#none" class="point">개인정보처리방침</a>
					</li>
					<li>
						<a href="#none">운영정책</a>
					</li>
				</ul><!-- privacy -->
				
				<ul class="ft_btn">
					<li>
						<a href="#none"><img src="./_img/pc/comn/ft_sns_fb.svg" alt="" /></a>
					</li>
					<li>
						<a href="#none"><img src="./_img/pc/comn/ft_sns_blog.svg" alt="" /></a>
					</li>
					<li>
						<a href="#none" class="btn01">Brochure Download</a>
					</li>
					<li>
						<a href="#none" class="btn01">PMS</a>
					</li>
				</ul><!-- ft_btn -->				
			</div><!-- ft_right -->
		</div><!-- ft_info -->		
	</div> <!-- footer -->
</footer></body>

<script type="text/javascript">

$('.banner').slick({
  infinite: true,
  slidesToShow: 3,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 3000,
  responsive: [
    {
      breakpoint: 1440,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1,
        infinite: true,
      }
    },
	{
      breakpoint: 960,
      settings: {
        arrows: false,
		dots:true,
		draggable : true,
		slidesToShow: 2,
        slidesToScroll: 1
      }
    },
    {
      breakpoint: 640,
      settings: {
		arrows: false,
		dots:true,
		draggable : true,
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
  ]
});

$('.prd_slide').slick({
  infinite: true,
  slidesToShow: 6,
  slidesToScroll: 1,
  autoplaySpeed: 3000,
  responsive: [
    {
      breakpoint: 1440,
      settings: {
        slidesToShow: 4,
        slidesToScroll: 1,
        infinite: true,
      }
    },
	{
      breakpoint: 960,
      settings: {
		arrows: false,
		autoplay: true,
		dots:true,
		draggable : true,
        slidesToShow: 3,
        slidesToScroll: 1
      }
    },
    {
      breakpoint: 640,
      settings: {
		arrows: false,
		autoplay: true,
		dots:true,
		draggable : true,
        slidesToShow: 2,
        slidesToScroll: 1
      }
    }
  ]
});


// 더보기 sec04
$('.prd_li02_2 > li').hide();
 $(".prd_li02_2 > li").slice(0, 6).css("display", "block");
$(".li02_btn").click(function(e){
	e.preventDefault();
	$(".prd_li02_2 >li:hidden").slice(0, 6).fadeIn(200).css('display', 'block'); // 클릭시 more 갯수 지저정
	if($(".prd_li02_2 >div:hidden").length == 0){ // 컨텐츠 남아있는지 확인
		$('.li02_btn').fadeOut(100); // 컨텐츠 없을 시 버튼 사라짐
	}
});

// 더보기 sec05
$('.prd_li03_2 > li').hide();
 $(".prd_li03_2 > li").slice(0, 6).css("display", "block");
$(".li03_btn").click(function(e){
	e.preventDefault();
	$(".prd_li03_2 >li:hidden").slice(0, 6).fadeIn(200).css('display', 'block'); // 클릭시 more 갯수 지저정
	if($(".prd_li03_2 >div:hidden").length == 0){ // 컨텐츠 남아있는지 확인
		$('.li03_btn').fadeOut(100); // 컨텐츠 없을 시 버튼 사라짐
	}
});

</script>
</html>
