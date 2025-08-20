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
	<link rel="shortcut icon" href="_img/favicon.png"/> <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/default.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/slick.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_css/main.css" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<title>중소기업을 위한 공공체험단</title>
	<script src="/_js/pop_layer.js"></script>
	<script src="/_js/cont.js"></script>
	
	<script>
	$(document).ready(function () {
		var contextPath = '${pageContext.request.contextPath}';

		// Helper function to get current filter values
		function getFilters() {
			return {
				channel:  $('#channel').val() || '',
				type:     $('#type').val()    || '',
				category: $('#category').val() || '',
				searchKeyword: $('#searchKeyword').val() || ''
			};
		}

		// AJAX function to filter campaigns
		function filterMyCampaigns() {
			var searchData = getFilters();
			
			// Note: You need to create this new endpoint in your controller.
			$.ajax({
				url: contextPath + '/preuser/mypage/filterMyCampaigns.do', 
				type: 'GET',
				data: searchData,
				dataType: 'json',
				success: function (response) {
					var myCampaignListHtml = '';
					if (response && response.length > 0) {
						$.each(response, function (index, vo) {
							// 1. D-Day Text Logic
							var dDayText = '';
							if (vo.dDay === 0) {
								dDayText = '<span class="p_date p_day">D-Day</span>';
							} else if (vo.dDay < 0) {
								dDayText = '<span class="p_date p_close">모집 마감</span>';
							} else {
								dDayText = '<span class="p_date">' + vo.dDay + '일 남음</span>';
							}

							// 2. Ad Type (Channel) CSS Class Logic
							var adTypeClass = '';
							if (vo.campAdType === '틱톡') adTypeClass = 'sns_tik';
							else if (vo.campAdType === '클립' || vo.campAdType === '구매형') adTypeClass = 'sns_etc';
							else if (vo.campAdType === '인스타그램' || vo.campAdType === '릴스') adTypeClass = 'sns_inst';
							else if (vo.campAdType === '유튜브') adTypeClass = 'sns_yout';
							else if (vo.campAdType === '블로그' || vo.campAdType === '블로그+클립') adTypeClass = 'sns_blog';

							// 3. Buttons HTML Logic
							var buttonsHtml = '';
							if (vo.sumState === '신청') {
								buttonsHtml = '<a href="#none" class="btn gray_line">신청 취소</a>'
											+ '<a href="/preuser/mypage/mycampaignEdit.do?campIdx=' + vo.campIdx + '" class="btn bk">신청 내역 수정</a>';
							} else if (vo.sumState === '취소') {
								buttonsHtml = '<a href="#none" class="btn red_line w100">취소 사유 조회</a>';
							} else if (vo.reviewDday < 0) {
								buttonsHtml = '<a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a>';
							} else if (vo.reviewDday >= 0) {
								buttonsHtml = '<a href="#none" class="btn">리뷰 제출</a>'
											+ '<a href="#none" class="btn gray_line">체험단 취소</a>';
							} else if (vo.selectDday < 0) {
								buttonsHtml = '<a href="#none" class="btn blue_line w100">모집이 종료된 체험단입니다.</a>';
							}
							
							// 4. Assemble the List Item HTML
							myCampaignListHtml += ''
								+ '<li>'
								+   '<a href="' + contextPath + '/preuser/campaign/campaignView.do?campIdx=' + vo.campIdx + '">'
								+     '<div class="prd_img">'
								+       '<img src="' + contextPath + '/_img/pc/main/' + vo.campThub + '" alt=""'
								+            ' style="background: url(' + contextPath + '/_img/pc/main/sec02_img02.png) no-repeat 50% 50% / cover;"'
								+            ' onerror="this.onerror=null; this.src=\'' + contextPath + '/_img/pc/main/no_img.png\';">'
								+     '</div>'
								+     '<p class="sns_txt ' + adTypeClass + '">' + vo.campType + '</p>'
								+     '<div class="prd_txt">'
								+       '<strong>' + vo.campTitle + '</strong>'
								+       '<p>' + vo.campService + '</p>'
								+     '</div>'
								+     '<div class="prd_rec">'
								+       dDayText
								+       '<ul class="rec_app">'
								+         '<li class="tt">신청 <b>' + vo.campSumCount + '</b>명</li>'
								+         '<li> / 모집 <em>' + vo.campRecruite + '</em>명</li>'
								+       '</ul>'
								+     '</div>'
								+   '</a>'
								+   '<div class="prd_rec02">'
								+     '<p class="my_review">리뷰기한까지 <span>' + vo.reviewDday + '</span>일 남음</p>'
								+     '<p class="my_select">체험단 선정 까지 <span>' + vo.selectDday + '</span>일 남음</p>'
								+   '</div>'
								+   '<div class="btn_wrap flex mt15">'
								+     buttonsHtml
								+   '</div>'
								+ '</li>';
						});
					} else {
						myCampaignListHtml = '<li><p style="text-align: center; width: 100%; padding: 50px 0;">검색 결과가 없습니다.</p></li>';
					}
					$('.pd_list ul.prd_li').html(myCampaignListHtml);
				},
				error: function (xhr, status, error) {
					console.error('AJAX Error:', status, error);
					$('.pd_list ul.prd_li').html('<li><p>데이터를 불러오는 중 오류가 발생했습니다.</p></li>');
				}
			});
		}

		// --- Event Bindings ---

		// (1) For dropdowns (select tags)
		$('.searchCondition').on('change', function () {
			filterMyCampaigns();
		});

		// (2) For the search button click
		$('#searchBtn').on('click', function (e) {
			e.preventDefault(); // Prevent the default <a> tag behavior
			filterMyCampaigns();
		});

		// (3) For 'Enter' key in the search input
		$('#searchKeyword').on('keypress', function (e) {
			if (e.which === 13) { // 13 is the keycode for Enter
				e.preventDefault();
				filterMyCampaigns();
			}
		});
		
		// --- Initial State Restoration (from ModelAttribute) ---
		var initialCategory = '${mypageSearchDTO.category}';
		var initialChannel  = '${mypageSearchDTO.channel}';
		var initialType     = '${mypageSearchDTO.type}'; // Assuming you add 'type' to MypageSearchDTO
		var initialKeyword  = '${mypageSearchDTO.searchKeyword}';

		if (initialCategory) $('#category').val(initialCategory);
		if (initialChannel)  $('#channel').val(initialChannel);
		if (initialType)     $('#type').val(initialType);
		if (initialKeyword)  $('#searchKeyword').val(initialKeyword);
		
		// Optional: Trigger initial search on page load if filters are pre-filled
		// filterMyCampaigns();
	});
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/_inc/header.jsp" />
<script src="/_js/ui.js"></script>

<div id="sub_content">
	<div class="s_cont">
		<jsp:include page="/WEB-INF/jsp/_inc/sideMenu.jsp" />
	
	<div class="right">
			<h2 class="sub_tit">내 체험단</h2>
				
				<form id="myCampaignSearchForm" onsubmit="return false;">
					<div class="select_wrap sel_flex">
						<div class="sel">
							<select id="channel" name="channel" class="searchCondition">
								<option value="">채널</option>
								<option value="릴스">릴스</option>
								<option value="블로그">블로그</option>
								<option value="블로그+클립">블로그+클립</option>
								<option value="유튜브">유튜브</option>
								<option value="인스타그램">인스타그램</option>
								<option value="클립">클립</option>
								<option value="틱톡">틱톡</option>
							</select>
						</div>
						<div class="sel">
							<select id="type" name="type" class="searchCondition">
								<option value="">유형</option>
								<option value="구매형">구매형</option>
								<option value="방문형">방문형</option>
								<option value="배송형">배송형</option>
								<option value="포장형">포장형</option>
							</select>
						</div>
						<div class="sel">
							<select id="category" name="category" class="searchCondition">
									<option value="">카테고리</option>
									<option value="PC방">PC방</option>
									<option value="베이커리">베이커리</option>
									<option value="분식집">분식집</option>
									<option value="뷰티">뷰티</option>
									<option value="와인바">와인바</option>
									<option value="음식점">음식점</option>
									<option value="초밥집">초밥집</option>
									<option value="치킨집">치킨집</option>
									<option value="카페">카페</option>
									<option value="피자집">피자집</option>
								</select>
						</div>
						<div class="list_wrap w100">
							<input id="searchKeyword" name="searchKeyword" title="검색어 입력" placeholder="검색어를 입력하세요." class="info_in" type="text" value="">
							<a href="#" id="searchBtn" class="b_btn" title="검색버튼" style="margin-left:10px;">검색</a>
						</div>
					</div>
				</form>

				<div class="pd_list">
					<ul class="prd_li prd_li04">
						<c:forEach var="vo" items="${campList}">
							<li>
								<a href="${pageContext.request.contextPath}/preuser/campaign/campaignView.do?campIdx=${vo.campIdx}">
								<div class="prd_img">
									<img src="${pageContext.request.contextPath}/_img/pc/main/${vo.campThub}"
									alt="" 
									style="background: url(${pageContext.request.contextPath}/_img/pc/main/sec02_img02.png)no-repeat 50% 50% / cover;" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/_img/pc/main/no_img.png';">
								</div><c:choose>
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
								</div><div class="prd_rec">
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
								</div></a>

								<div class="prd_rec02">
									<p class="my_review">리뷰기한까지 <span>${vo.reviewDday}</span>일 남음</p>
									<p class="my_select">체험단 선정 까지 <span>${vo.selectDday}</span>일 남음</p>
								</div><div class="btn_wrap flex mt15">
								<c:choose>
								<c:when test="${vo.sumState eq '신청'}">	
									<a href="#none" class="btn gray_line">신청 취소</a>
									<a href="/preuser/mypage/mycampaignEdit.do?campIdx=${vo.campIdx}" class="btn bk">신청 내역 수정</a>
								</c:when>	
								<c:when test="${vo.sumState eq '취소'}">
									<a href="#none" class="btn red_line w100">취소 사유 조회</a>
								</c:when>	
								<c:when test="${vo.reviewDday lt 0}">
									<a href="#none" class="btn blue_line w100">완료된 리뷰 보기</a>
								</c:when>	
								<c:when test="${vo.reviewDday ge 0}">
									<a href="#none" class="btn">리뷰 제출</a>
									<a href="#none" class="btn gray_line">체험단 취소</a>
								</c:when>	
								<c:when test="${vo.selectDday lt 0}">	
									<a href="#none" class="btn blue_line w100">모집이 종료된 체험단입니다.</a>
								</c:when>	
								</c:choose>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				
				</div></div></div><jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>
</html>