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
				<div class="region">
					<div class="selec_reg">
						<h2 class="sub_tit">지역</h2>
						<div class="search_filter">
							<!-- 선택된 reg01, reg02 -->
							<ul>
								<li>재택<a href="javascript:void(0)" class="x"></a></li>
								<li>동대문구<a href="javascript:void(0)" class="x"></a></li>
							</ul>
						</div>
					</div> <!-- selec_reg -->
					<ul class="reg01">
						<li class="tab-link current" data-tab="tab-1">재택</li>
						<li class="tab-link" data-tab="tab-2">기자단</li>
						<li class="tab-link" data-tab="tab-3">당일지급</li>
						<li class="tab-link" data-tab="tab-4">서울</li>
						<li class="tab-link" data-tab="tab-5">경기</li>
						<li class="tab-link" data-tab="tab-6">인천</li>
						<li class="tab-link" data-tab="tab-7">강원</li>
						<li class="tab-link" data-tab="tab-8">대전</li>
						<li class="tab-link" data-tab="tab-9">세종</li>
						<li class="tab-link" data-tab="tab-10">충남</li>
						<li class="tab-link" data-tab="tab-11">충북</li>
						<li class="tab-link" data-tab="tab-12">부산</li>
						<li class="tab-link" data-tab="tab-13">울산</li>
						<li class="tab-link" data-tab="tab-14">경남</li>
						<li class="tab-link" data-tab="tab-15">경북</li>
						<li class="tab-link" data-tab="tab-16">대구</li>
						<li class="tab-link" data-tab="tab-17">광주</li>
						<li class="tab-link" data-tab="tab-18">전남</li>
						<li class="tab-link" data-tab="tab-19">전북</li>
						<li class="tab-link" data-tab="tab-20">제주</li>
					</ul>

					<div id="tab-1" class="tab_con current">
						<ul class="reg02">
							<li>
								<input type="checkbox" id="re01" class="n_ck02" checked>
								<label for="re01" class="ft_btn">동대문구</label>
							</li>
							<li>
								<input type="checkbox" id="re02" class="n_ck02">
								<label for="re02" class="ft_btn">동작구</label>
							</li>
							<li>
								<input type="checkbox" id="re03" class="n_ck02">
								<label for="re03" class="ft_btn">마포구</label>
							</li>
							<li>
								<input type="checkbox" id="re04" class="n_ck02">
								<label for="re04" class="ft_btn">서대문구</label>
							</li>
							<li>
								<input type="checkbox" id="re05" class="n_ck">
								<label for="re05" class="ft_btn">서초구</label>
							</li>
							<li>
								<input type="checkbox" id="re06" class="n_ck">
								<label for="re06" class="ft_btn">성동구</label>
							</li>
						</ul>
					</div>
					<div id="tab-2" class="tab_con"><p>기자단</p></div>
					<div id="tab-3" class="tab_con"><p>당일지급</p></div>
					<div id="tab-4" class="tab_con">서울</div><!-- tab-4 -->
					<div id="tab-5" class="tab_con"><p>경기</p></div>
					<div id="tab-6" class="tab_con"><p>인천</p></div>
					<div id="tab-7" class="tab_con"><p>강원</p></div>
					<div id="tab-8" class="tab_con"><p>대전</p></div>
					<div id="tab-9" class="tab_con"><p>세종</p></div>
					<div id="tab-10" class="tab_con"><p>충남</p></div>
					<div id="tab-11" class="tab_con"><p>충북</p></div>
					<div id="tab-12" class="tab_con"><p>부산</p></div>
					<div id="tab-13" class="tab_con"><p>울산</p></div>
					<div id="tab-14" class="tab_con"><p>경남</p></div>
					<div id="tab-15" class="tab_con"><p>경북</p></div>
					<div id="tab-16" class="tab_con"><p>대구</p></div>
					<div id="tab-17" class="tab_con"><p>광주</p></div>
					<div id="tab-18" class="tab_con"><p>전남</p></div>
					<div id="tab-19" class="tab_con"><p>전북</p></div>
					<div id="tab-20" class="tab_con"><p>제주</p></div>
				</div><!-- region -->

				<div class="select_wrap">
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
					<div class="sel">
						<select id="" name="" class="searchCondition">
							<option value="">채널</option>
							<option value="">블로그</option>
							<option value="">인스타그램</option>
							<option value="">유튜브</option>
							<option value="">숏츠</option>
							<option value="">클립</option>
						</select>
					</div>
					<div class="sel">
						<select id="" name="" class="searchCondition">
							<option value="">유형</option>
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
							<option value="">최신순</option>
							<option value="">마감임박순</option>
							<option value="">인기순</option>
						</select>
					</div>
				</div>

				<div class="pd_list">
					<ul class="prd_li prd_li02">
						
				<c:forEach var="vo" items="${popCampList}">
					<li>
						<a href="${pageContext.request.contextPath}/preuser/campaign/campaignView.do?campIdx=${vo.campIdx}">
							<div class="prd_img">
								<img src="${pageContext.request.contextPath}/_img/pc/main/${vo.campThub}"
								alt="" 
								style="background: url(${pageContext.request.contextPath}/_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;"
								onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/_img/pc/main/no_img.png';">
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
									<span class="p_date p_day">모집 마감</span>
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
				</div>

			</div><!-- cont_all -->
		</div><!-- s_cont -->
	</div><!-- sub_content -->

<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>>
</html>
