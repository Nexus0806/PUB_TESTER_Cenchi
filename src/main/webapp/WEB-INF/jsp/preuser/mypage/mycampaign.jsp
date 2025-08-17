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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/main.css" />
	
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
					<c:forEach var="vo" items="${campList}">
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

							<!-- prd_rec02 내 체험단 리스트 my_review 리뷰기한까지 / my_select 선정까지 / my_comp 리뷰 완료됨 -->
							<div class="prd_rec02">
								<%-- 리뷰 기한은 오늘 ~ CAMP_ENDDATE--%>
								<p class="my_review">리뷰기한까지 <span>${vo.reviewDday}</span>일 남음</p>
								<%-- 발표 기한은 오늘 ~ CAMP_ANODATE--%>
								<p class="my_select">체험단 선정 까지 <span>${vo.selectDday}</span>일 남음</p>
								<!-- <p class="my_comp">리뷰 완료됨</p> -->
							</div><!-- prd_rec02 -->

							<!-- btn 리뷰 제출 / btn gray_line 체험단 취소 / btn bk 신청 내역 수정 / btn blue_line w100 완료된 리뷰 보기 -->
							<div class="btn_wrap flex mt15">
							<c:choose>
							<c:when test="${vo.sumState eq '신청'}">	<%-- 체험단에 신청했을때 --%>
								<a href="#none" class="btn gray_line">신청 취소</a>
								<a href="/preuser/campaign/campaignEdit.html" class="btn bk">신청 내역 수정</a>
							</c:when>	
							<c:when test="${vo.sumState eq '취소'}">	<%-- 체험단을 취소 했을 때 --%>
								<a href="#none" class="btn red_line w100">취소 사유 보기</a>
							</c:when>	
							<c:when test="${vo.reviewDday lt 0}">	<%-- 체험단이 완전히 끝난 후 --%>
								<a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a>
							</c:when>	
							<c:when test="${vo.reviewDday ge 0}">	<%-- 체험단 선정 후, 리뷰 기한 일때 --%>
								<a href="#none" class="btn">리뷰 제출</a>
								<a href="#none" class="btn gray_line">체험단 취소</a>
							</c:when>	
							<%-- 체험단 모집이 끝났을 때 1. 체험단 선정됨 2. 체험단에 떨어짐--%>
							<c:when test="${vo.selectDday lt 0}">	
								<a href="#none" class="btn blue_line w100">모집이 종료된 체험단입니다.</a>
							</c:when>	
							</c:choose>
							</div>
						</li>
						</c:forEach>
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