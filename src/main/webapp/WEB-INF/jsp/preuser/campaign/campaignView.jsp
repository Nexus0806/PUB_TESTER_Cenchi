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
							<p class="v_tit">[함경/개성시] 함흥 북경 냉면 손치기 구이</p>

							<ul class="opt">
								<!-- 아이콘 클래스명 입니다. yout 유튜브 숏츠 / yout02 유튜브 / nblog 네이버 블로그 / insta 인스타그램 -->
								<li class="sns_tit"><p class="op_sns yout02"></p><span>유튜브</span></li>
								<li><p class="op_num">#800421</p></li>
								<li><p class="op_cate">방문형(오프라인)</p></li>
								<li><p class="op_cate02">맛집</p></li>
							</ul>
						</div><!-- View_top -->

						<ul class="con_list">
							<li>
								<span class="c_tit">주최자</span>
								<b class="c_info clt" style="color: #222;"><span class="c_ic"></span> 넥서스팀 김가현 사원</b>
							</li>
							<li>
								<span class="c_tit">제공서비스/물품</span>
								<p class="edit clt">에디터에 입력된 내용 노출시켜주세요.</p>
							</li>
							<li>
								<span class="c_tit">방문정보</span>
								<!-- 카카오맵 -->
								<!-- 1. 지도 노드 -->
								<div id="daumRoughmapContainer1754449174733" class="root_daum_roughmap root_daum_roughmap_landing clt"></div>
							</li>
							<li>
								<span class="c_tit">방문 주소</span>
								<p class="edit clt">에디터에 입력된 내용 노출시켜주세요.</p>
							</li>
							<li>
								<span class="c_tit">방문 및 예약 안내</span>
								<p class="edit clt">에디터에 입력된 내용 노출시켜주세요.</p>
							</li>
							<li>
								<span class="c_tit">키워드 정보</span>
								<div class="tag clt">
									<em>북한 면치기 음식점</em>
									<em>남북 관계</em>
								</div>
							</li>
							<li>
								<span class="c_tit">체험단 미션</span>
								<p class="edit clt">에디터에 입력된 내용 노출시켜주세요.</p>
							</li>
							<li>
								<span class="c_tit">공정위 문구(배너)</span>
								<p class="edit clt">에디터에 입력된 내용 노출시켜주세요.</p>
							</li>
						</ul>

						<div class="comment_wrap mt40">
							<h3 class="sub_tit02">신청자 댓글</h3>
							<div class="cmt clt">
								<p class="prop_img"></p>
								<ul class="cmt_txt">
									<li class="name">닉네임</li>
									<li>신청자 작성 내용 노출시켜주세요.</li>
									<li class="date">2025.08.05 14:11</li>
								</ul>
								<a href="#none" class="modify">수정</a>
							</div>
							<div class="cmt clt">
								<p class="prop_img"></p>
								<ul class="cmt_txt">
									<li class="name">닉네임</li>
									<li>신청자 작성 내용 노출시켜주세요.</li>
									<li class="date">2025.08.05 14:11</li>
								</ul>
								<a href="#none" class="modify">수정</a>
							</div>
							<div class="cmt clt">
								<p class="prop_img"></p>
								<ul class="cmt_txt">
									<li class="name">닉네임</li>
									<li>신청자 작성 내용 노출시켜주세요.</li>
									<li class="date">2025.08.05 14:11</li>
								</ul>
								<a href="#none" class="modify">수정</a>
							</div>
						</div><!-- comment_wrap -->
					</div><!-- View_con -->

					<div class="View_info">
						<!-- 이미지 -->
						<p class="sn_img mb20" style="background: url(https://sian.pms.or.kr/preuser/_img/pc/cont/view_img.jpg)no-repeat 50% 50% / cover;"></p>

						<div class="sche">
							<p class="sche_tit">체험단 일정</p>
							<ul class="sche_list">
								<li class="point">
									<span class="sc_tit">체험단 신청 기간</span>
									<p>7/1(화) ~ 7/5(토)</p>
								</li>
								<li>
									<span class="sc_tit">리뷰어 발표</span>
									<p>7/17(목)</p>
								</li>
								<li>
									<span class="sc_tit">체험기간</span>
									<p>7/21(월) ~ 7/27(일)</p>
								</li>
								<li>
									<span class="sc_tit">실시간 지원 현황</span>
									<p>지원 <span>0</span> / 모집 <span>31</span></p>
								</li>
							</ul>


							<div class="Calendar">
								<p class="month_box">
									<a href="javascript:void(0)" class="cla_l"></a>
									<span class="month">2025년 7월</span>
									<a href="javascript:void(0)" class="cla_r"></a>
								</p>
								<ul class="Cal_li">
									<!-- 신청기간 li class="on" -->
									<!-- 리뷰어 발표 li class="on red" -->
									<!-- 체험기간 li class="on blue" -->
									<!-- 현재 날짜 li class="on tday" -->
									<li>Sun</li>
									<li>Mon</li>
									<li>Tue</li>
									<li>Wed</li>
									<li>The</li>
									<li>Fri</li>
									<li>Sat</li>

									<li></li>
									<li></li>
									<li class="on"><a href="#none">1</a></li>
									<li class="on"><a href="#none">2</a></li>
									<li class="on"><a href="#none">3</a></li>
									<li class="on"><a href="#none">4</a></li>
									<li class="on"><a href="#none">5</a></li>

									<li class="on tday"><a href="#none">6</a></li>
									<li><a href="#none">7</a></li>
									<li><a href="#none">8</a></li>
									<li><a href="#none">9</a></li>
									<li><a href="#none">10</a></li>
									<li><a href="#none">11</a></li>
									<li><a href="#none">12</a></li>

									<li><a href="#none">13</a></li>
									<li><a href="#none">14</a></li>
									<li><a href="#none">15</a></li>
									<li><a href="#none">16</a></li>
									<li class="on red"><a href="#none">17</a></li>
									<li><a href="#none">18</a></li>
									<li><a href="#none">19</a></li>

									<li><a href="#none">20</a></li>
									<li class="on blue"><a href="#none">21</a></li>
									<li class="on blue"><a href="#none">22</a></li>
									<li class="on blue"><a href="#none">23</a></li>
									<li class="on blue"><a href="#none">24</a></li>
									<li class="on blue"><a href="#none">25</a></li>
									<li class="on blue"><a href="#none">26</a></li>

									<li class="on blue"><a href="#none">27</a></li>
									<li><a href="#none">28</a></li>
									<li><a href="#none">29</a></li>
									<li><a href="#none">30</a></li>
									<li><a href="#none">31</a></li>
									<li></li>
									<li></li>
								</ul>
							</div><!-- Calendar -->

							<ul class="cal_point mb10">
								<li>
									<span class="cal_on"></span>
									<p>체험단 신청 기간</p>
								</li>
								<li>
									<span class="cal_red"></span>
									<p>리뷰어 발표</p>
								</li>
								<li>
									<span class="cal_blue"></span>
									<p>체험기간</p>
								</li>
								<li>
									<span class="cal_tday"></span>
									<p>현재 날짜</p>
								</li>
							</ul>

							<div class="btn_wrap">
								<div class="v_icon">
									<a href="#none" class="btn ic like">
										찜하기
										<!-- 찜하기 X -->
										<span class="like_icon"></span>
										<!-- 찜하기 O -->
										<!-- <span class="like_icon on"></span> -->
									</a>
									<a href="javascript:void(0)" onclick="layer_open('delPop', 'del_Pop');return false;" class="btn ic link">공유<span class="link_icon"></span></a>
								</div><!-- v_icon -->
								<a href="https://sian.pms.or.kr/preuser/expgroup/expWrite.html" class="btn">신청하기</a>
							</div><!-- btn_wrap -->
						</div><!-- sche -->

					</div><!-- View_info -->
				</div><!-- View_wrap -->
			</div><!-- cont_all -->
		</div><!-- s_cont -->
	</div><!-- sub_content -->

	<!-- 링크 팝업 -->
	<div class="layer" id="del_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delPop">
			<p class="pop_title">
				<a class="cbtn" href="#none">닫기</a>
			</p>
			<div class="pop_cont c">
				<p>www.withsystem.com</p>
				<p class="btn_wrap">
					<a href="#" class="btn2">복사하기</a>
				</p>
			</div>
		</div>
	</div>


<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>
</html>

