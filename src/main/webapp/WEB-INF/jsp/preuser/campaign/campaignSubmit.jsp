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
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/default.css" /> <!-- css 불러와야함 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/main.css" /> <!-- css 불러와야함 -->
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

<div id="sub_content">
		<div class="s_cont">
			<div class="cont_all">
				<div class="View_wrap">
					<div class="View_con">
						<div class="View_top mb40">
							<p class="v_tit">체험단 신청</p>
						</div><!-- View_top -->

						<div class="apply_wrap mb30">
							<h4>신청 한마디 <span>(선택)</span></h4>
							<p class="mb10">신청 시 광고주가 참고할 수 있는 내용이 있다면 작성해 주세요.</p>
							<textarea name="" rows="" cols="" placeholder="내용 입력"></textarea>
						</div><!-- apply_wrap -->

						<div class="apply_wrap">
							<h4>주소</h4>
							<div class="add_wrap">
								<input placeholder="우편번호 (검색버튼을 눌러 입력해 주세요.)" type="text">
								<a href="#none" class="btn a bk">우편번호 찾기</a>
							</div>
							<input class="mt5" placeholder="기본 주소 (검색버튼을 눌러 입력해 주세요.)" type="text">
							<input class="mt5" placeholder="상세 주소" type="text">
						</div><!-- apply_wrap -->
					</div><!-- View_con -->

					<div class="View_info">
						<!-- 이미지 -->
						<p class="sn_img mb20" style="background: url(https://sian.pms.or.kr/preuser/_img/pc/cont/view_img.jpg)no-repeat 50% 50% / cover;"></p>

						<div class="sche">
							<p class="sche_tit">[함경/개성시] 함흥 북경 냉면 손치기 구이</p>
							<ul class="sche_list">
								<li class="point">자유식사권 16만원 + 30만 포인트</li>
							</ul>
							<ul class="opt">
								<!-- 아이콘 클래스명 입니다. yout 유튜브 숏츠 / yout02 유튜브 / nblog 네이버 블로그 / insta 인스타그램 -->
								<li class="sns_tit"><p class="op_sns yout02"></p><span>유튜브</span></li>
								<li><p class="op_cate">방문형(오프라인)</p></li>
								<li><p class="op_cate02">맛집</p></li>
							</ul>

							<div class="prv_wrap mt20">
								<p class="checkbox">
									<span>
										<input type="checkbox" id="prv01" name="privacy" value="prv01">
										<label for="prv01">체험단 유의사항, 개인정보 및 콘텐츠 제3자 제공, 저작물 이용에 동의합니다.</label>
									</span>
								</p>
								<a href="javascript:void(0)" class="prv_cont" onclick="window.open('https://sian.pms.or.kr/preuser/expgroup/Popup/AgreePop.html','_blank','width=600, height=600, top=100, left=500, scrollbars=yes')">[자세히보기]</a>
							</div>

							<div class="prv_wrap mb20 mt10">
								<p class="checkbox">
									<span>
										<input type="checkbox" id="prv02" name="privacy" value="prv02">
										<label for="prv02">체험단 미션을 모두 확인했습니다.</label>
									</span>
								</p>
								<a href="javascript:void(0)" class="prv_cont" onclick="window.open('https://sian.pms.or.kr/preuser/expgroup/Popup/AgreePop.html','_blank','width=600, height=600, top=100, left=500, scrollbars=yes')">[자세히보기]</a>
							</div>


							<div class="btn_wrap">
								<a href="#none" class="btn" style="width:100%;">신청하기</a>
							</div><!-- btn_wrap -->
						</div><!-- sche -->

					</div><!-- View_info -->
				</div><!-- View_wrap -->
			</div><!-- cont_all -->
		</div><!-- s_cont -->
	</div><!-- sub_content -->

<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>>
</html>
