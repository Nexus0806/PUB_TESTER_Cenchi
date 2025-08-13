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
<script src="/preuser/_js/pop_layer.js"></script>
<script src="/preuser/_js/cont.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/_inc/header.jsp" />
<script src="/js/ui.js"></script>

<div id="sub_content">
	<div class="s_cont">
		<jsp:include page="/WEB-INF/jsp/_inc/sideMenu.jsp" />
	
<div class="right">
				<h2 class="sub_tit">내 체험단</h2>

				<div class="select_wrap sel_flex">
					<div class="sel">
						<select id="" name="" class="searchCondition">
							<option value="">미션유형</option>
							<option value="">방문형(오프라인)</option>
							<option value="">구매형(온라인)</option>
							<option value="">배송형(온라인)</option>
							<option value="">기자단</option>
							<option value="">플랫폼 기자단</option>
							<option value="">당일지급</option>
							<option value="">포장</option>
						</select>
					</div>
					<div class="sel">
						<select id="" name="" class="searchCondition">
							<option value="">카테고리</option>
							<option value="">맛집</option>
							<option value="">식품</option>
							<option value="">뷰티</option>
							<option value="">여행</option>
							<option value="">디지털</option>
							<option value="">반려동물</option>
							<option value="">기타</option>
						</select>
					</div>

						<div class="list_wrap w100">
							<input id="searchKeyword" name="searchKeyword" title="검색어 입력" placeholder="검색어를 입력하세요." class="info_in" type="text" value="">
							<a href="javascript:;" class="b_btn" title="검색버튼" onclick="submit('', 1);" style="margin-left:10px;">검색</a>
						</div>

				</div>


				<div class="pd_list">
					<!-- prd_li03 컨텐츠 한 줄에 5개씩 -->
					<!-- prd_li04 컨텐츠 한 줄에 4개씩 -->
					<ul class="prd_li prd_li04">
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img03.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<!-- <a href="#none" class="sn_like">찜하기</a> -->
								<!-- 찜하기 O -->
								<a href="#none" class="sn_like on">찜하기</a>
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img01.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<!-- <a href="#none" class="btn gray_line">체험단 취소</a> -->
								<a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a>
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img06.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<!-- <p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p> -->
								<p class="my_comp">리뷰 완료됨</p>
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<!-- <a href="#none" class="btn">리뷰 제출</a> -->
								<!-- <a href="#none" class="btn gray_line">체험단 취소</a> -->
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a>
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img12.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
							</div><!-- prd_img -->

							<p class="sns_txt sns_blog">배송</p>
							<div class="prd_txt">
								<strong>[아이아이] CCP로션&amp;CCP스틱밤</strong>
								<p>로션 1개+스틱밤 1개</p>
							</div><!-- prd_txt -->
							<div class="prd_rec">
								<span class="p_date">1일 남음</span>
								<ul class="rec_app">
									<li class="tt">신청 <b>150</b>명</li>
									<li> / 모집 <em>10</em>명</li>
								</ul>
							</div><!-- prd_rec -->

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img04.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img05.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img10.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img07.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img11.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img09.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
						<li>
							<div class="prd_img">
								<img src="../_img/pc/main/no_img.png" alt="" style="background: url(../_img/pc/main/sec02_img08.png)no-repeat 50% 50% / cover;">
								<!-- 찜하기 X -->
								<a href="#none" class="sn_like">찜하기</a>
								<!-- 찜하기 O -->
								<!-- <a href="#none" class="sn_like on">찜하기</a> -->
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<p class="my_review">리뷰기한까지 <span>10</span>일 남음</p>
								<p class="my_select">선정 까지 <span>10</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
								<!-- <a href="/preuser/mypage/expgroEdit.html" class="btn bk">신청 내역 수정</a> -->
								<!-- <a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a> -->
							</div>
						</li>
					</ul>
				</div>

				<p class="pagination">
					<a href="#" class="direction prev end" title="맨처음 페이지로 이동" onclick="fnLinkPage(1); ">맨처음 페이지로 이동</a>
					<a href="#" class="direction prev" title="이전 페이지로 이동" onclick="fnLinkPage(1); ">이전 페이지로 이동</a>
					<a href="javascript:void(0);" class="on" title="현재 페이지">1</a>
					<a href="javascript:void(0);" onclick="fnLinkPage(2);">2</a>
					<a href="javascript:void(0);" onclick="fnLinkPage(3);">3</a>
					<a href="javascript:void(0);" onclick="fnLinkPage(4);">4</a>
					<a href="javascript:void(0);" onclick="fnLinkPage(5);">5</a>
					<a href="javascript:void(0);" onclick="fnLinkPage(6);">6</a>
					<a href="javascript:void(0);" onclick="fnLinkPage(7);">7</a>
					<a href="javascript:void(0);" onclick="fnLinkPage(8);">8</a>
					<a href="javascript:void(0);" onclick="fnLinkPage(9);">9</a>
					<a href="javascript:void(0);" onclick="fnLinkPage(10);">10</a>
					<a href="#" class="direction next" title="다음 페이지로 이동" onclick="fnLinkPage(11); ">다음 페이지로 이동</a>
					<a href="#" class="direction next end" title="맨끝 페이지로 이동" onclick="fnLinkPage(121); ">맨끝 페이지로 이동</a>
				</p>

			</div><!-- cont_all -->
		</div><!-- s_cont -->
	</div><!-- sub_content -->

<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>

</html>