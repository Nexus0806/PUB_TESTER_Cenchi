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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/slick.css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<title>중소기업을 위한 공공체험단</title>
	<script src="/_js/pop_layer.js"></script>
	<script src="/_js/cont.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/_inc/header.jsp" />

<script src="/js/ui.js"></script>


	<div id="wrap">
		<div class="banner_wrap">
			<ul class="banner">
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="${pageContext.request.contextPath}/_img/pc/main/bn_no_img.png" alt="" / style="background: url(${pageContext.request.contextPath}/_img/pc/main/bn01.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="${pageContext.request.contextPath}/_img/pc/main/bn_no_img.png" alt="" / style="background: url(${pageContext.request.contextPath}/_img/pc/main/bn02.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="${pageContext.request.contextPath}/_img/pc/main/bn_no_img.png" alt="" / style="background: url(${pageContext.request.contextPath}/_img/pc/main/bn03.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="${pageContext.request.contextPath}/_img/pc/main/bn_no_img.png" alt="" / style="background: url(${pageContext.request.contextPath}/_img/pc/main/bn01.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="${pageContext.request.contextPath}/_img/pc/main/bn_no_img.png" alt="" / style="background: url(${pageContext.request.contextPath}/_img/pc/main/bn02.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
				<li>
					<a href="#none">
						<div class="img_wrap">
							<img src="${pageContext.request.contextPath}/_img/pc/main/bn_no_img.png" alt="" / style="background: url(${pageContext.request.contextPath}/_img/pc/main/bn03.png)no-repeat 50% 50% / cover;">
						</div><!-- img_wrap -->
					</a>
				</li>
			</ul>
		</div><!-- banner_wrap 메인 롤링배너 -->

		<div class="pd_slider section sec03">
			<h2 class="h2_tit h2_tit02">인기 체험단</h2>

			<ul class="prd_li prd_slide">
				<c:forEach var="vo" items="${popCampList}">
					<li>
						<a href="${pageContext.request.contextPath}/preuser/campaign/campaignView.do?campIdx=${vo.campIdx}">
							<div class="prd_img">
								<img src="${pageContext.request.contextPath}/_img/pc/main/${vo.campThub}"
								alt="" 
								style="background: url(${pageContext.request.contextPath}/_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;"
								onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/_img/pc/main/no_img.png';">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
							</div><!-- prd_img -->
							<a href="${pageContext.request.contextPath}/preuser/campaign/campaignView.do?campIdx=${vo.campIdx}">
								<c:choose>
								<c:when test="${vo.campAdType eq '틱톡'}">
									<p class="sns_txt sns_tik">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '클립' or vo.campAdType eq '구매형'}">
									<p class="sns_txt sns_etc">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '인스타그램' or vo.campAdType eq '릴스'}">
									<p class="sns_txt sns_inst">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '유튜브'}">
									<p class="sns_txt sns_yout">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '블로그' or vo.campAdType eq '블로그+클립'}">
									<p class="sns_txt sns_blog">${vo.campType}</p>
								</c:when>
								</c:choose>
								<div class="prd_txt">
									<strong>${vo.campTitle}</strong>
									<p>${vo.campService}</p>
								</div><!-- prd_txt -->
								<div class="prd_rec">
									<c:choose>
									<c:when test="${vo.dDay eq 0}">
										<span class="p_date p_day">D-Day</span>
									</c:when>
									<c:when test="${vo.dDay lt 0}">
										<span class="p_date p_close">모집 마감</span>
									</c:when>
									<c:otherwise>
										<span class="p_date">${vo.dDay}일 남음</span>
									</c:otherwise>
									</c:choose>
										<ul class="rec_app">
											<li class="tt">신청 <b>${vo.campSumCount}</b>명</li>
											<li> / 모집 <em>${vo.campRecruite}</em>명</li>
										</ul>
								</div><!-- prd_rec -->
							</a>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>

		<div class="pd_list section sec04">
			<h2 class="h2_tit h2_tit03">신규 체험단</h2>

			<div class="web">
				<ul class="prd_li prd_li02">
				<c:forEach var="vo" items="${newCampList}">
					<li>
						<a href="${pageContext.request.contextPath}/preuser/campaign/campaignView.do?campIdx=${vo.campIdx}">
							<div class="prd_img">
								<img src="${pageContext.request.contextPath}/_img/pc/main/no_img.png" alt="" / style="background: url(${pageContext.request.contextPath}/_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<c:choose>
								<c:when test="${vo.campAdType eq '틱톡'}">
									<p class="sns_txt sns_tik">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '인스타그램' or vo.campAdType eq '릴스'}">
									<p class="sns_txt sns_inst">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '유튜브'}">
									<p class="sns_txt sns_yout">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '블로그' or vo.campAdType eq '블로그+클립'}">
									<p class="sns_txt sns_blog">${vo.campType}</p>
								</c:when>
								<c:otherwise>
									<p class="sns_txt sns_etc">${vo.campType}</p>
								</c:otherwise>
							</c:choose>
							<div class="prd_txt">
								<strong>${vo.campTitle}</strong>
								<p>${vo.campService}</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<c:choose>
								<c:when test="${vo.dDay eq 0}">
									<span class="p_date p_day">D-Day</span>
								</c:when>
								<c:when test="${vo.dDay lt 0}">
									<span class="p_date p_close">모집 마감</span>
								</c:when>
								<c:otherwise>
									<span class="p_date">${vo.dDay}일 남음</span>
								</c:otherwise>
								</c:choose>
									<ul class="rec_app">
										<li class="tt">신청 <b>${vo.campSumCount}</b>명</li>
										<li> / 모집 <em>${vo.campRecruite}</em>명</li>
									</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
				</c:forEach>
				</ul>
			</div> <!-- web -->
		</div><!-- pd_list sec04 체험단 리스트 (슬라이드X) -->

		<div class="pd_list section sec05">
			<h2 class="h2_tit h2_tit04">마감임박</h2>

			<div class="web">
				<ul class="prd_li prd_li02">
					<c:forEach var="vo" items="${deadCampList}">
					<li>
						<a href="${pageContext.request.contextPath}/preuser/campaign/campaignView.do?campIdx=${vo.campIdx}">
							<div class="prd_img">
								<img src="${pageContext.request.contextPath}/_img/pc/main/no_img.png" alt="" / style="background: url(${pageContext.request.contextPath}/_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;">
							</div><!-- prd_img -->
							<c:choose>
								<c:when test="${vo.campAdType eq '틱톡'}">
									<p class="sns_txt sns_tik">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '클립' or vo.campAdType eq '구매형'}">
									<p class="sns_txt sns_etc">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '인스타그램' or vo.campAdType eq '릴스'}">
									<p class="sns_txt sns_inst">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '유튜브'}">
									<p class="sns_txt sns_yout">${vo.campType}</p>
								</c:when>
								<c:when test="${vo.campAdType eq '블로그' or vo.campAdType eq '블로그+클립'}">
									<p class="sns_txt sns_blog">${vo.campType}</p>
								</c:when>
							</c:choose>
							<div class="prd_txt">
								<strong>${vo.campTitle}</strong>
								<p>${vo.campService}</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<c:choose>
								<c:when test="${vo.dDay eq 0}">
									<span class="p_date p_day">D-Day</span>
								</c:when>
								<c:when test="${vo.dDay lt 0}">
									<span class="p_date p_close">모집 마감</span>
								</c:when>
								<c:otherwise>
									<span class="p_date">${vo.dDay}일 남음</span>
								</c:otherwise>
								</c:choose>
									<ul class="rec_app">
										<li class="tt">신청 <b>${vo.campSumCount}</b>명</li>
										<li> / 모집 <em>${vo.campRecruite}</em>명</li>
									</ul>
							</div><!-- prd_rec -->
						</a>
					</li>
				</c:forEach>
				</ul>
			</div> <!-- web -->
		</div><!-- pd_list sec05 체험단 리스트 (슬라이드X) -->

		<div class="bt_banner section sec06">
			<div class="bt_bn">
				<p class="web"><img src="${pageContext.request.contextPath}/_img/pc/main/ft_bn.png" alt="" /></p>
				<p class="tablet"><img src="./_img/ta/main/ft_bn_ta.png" alt="" /></p>
				<p class="mobile"><img src="./_img/mo/main/ft_bn_mo.png" alt="" /></p>
			</div><!-- bt_bn -->
		</div><!-- bt_banner sec06 하단 배너 -->
    </div><!-- wrap -->

	<div class="content"></div> <!-- 좌우 여백 없는 content-->
	<div class="s_content"></div> <!-- 좌우 여백 있는 content-->
	
	<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />
</body>

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
