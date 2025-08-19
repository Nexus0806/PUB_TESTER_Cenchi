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
	
<script>
  $(document).ready(function () {
    var contextPath = '${pageContext.request.contextPath}';

    // 현재 화면의 필터 상태를 읽어오는 헬퍼
    function getFilters() {
      return {
        region:   $('#regionInput').val() || '',   // 탭 선택 지역 이름
        category: $('#category').val()     || '',
        channel:  $('#channel').val()      || '',
        type:     $('#type').val()         || '',
        sort:     $('#sort').val()         || '',
        searchKeyword:  $('#headerKeyword').val() || ''  // 헤더 검색창 (header.jsp)
      };
    }

    // AJAX 필터링: overrides로 특정 값만 덮어쓸 수 있도록
    function filterCampaigns(overrides) {
      var searchData = Object.assign({}, getFilters(), overrides || {});

      // ajax 라고 하는데 이게 뭔지 잘 모르겠음;
      $.ajax({
        url: contextPath + '/preuser/campaign/filterCampaigns.do',
        type: 'GET',
        data: searchData,		// << 검색어 저장되는 부분
        dataType: 'json',
        success: function (response) {
          var campaignListHtml = '';

          if (response && response.length > 0) {
            $.each(response, function (index, vo) {
              var dDayText = '';
              if (vo.dDay === 0) dDayText = '<span class="p_date p_day">D-Day</span>';
              else if (vo.dDay < 0) dDayText = '<span class="p_date p_close">모집 마감</span>';
              else dDayText = '<span class="p_date">' + vo.dDay + '일 남음</span>';

              var adTypeClass = '';
              if (vo.campAdType === '틱톡') adTypeClass = 'sns_tik';
              else if (vo.campAdType === '클립' || vo.campAdType === '구매형') adTypeClass = 'sns_etc';
              else if (vo.campAdType === '인스타그램' || vo.campAdType === '릴스') adTypeClass = 'sns_inst';
              else if (vo.campAdType === '유튜브') adTypeClass = 'sns_yout';
              else if (vo.campAdType === '블로그' || vo.campAdType === '블로그+클립') adTypeClass = 'sns_blog';

              campaignListHtml += ''
                + '<li>'
                +   '<a href="' + contextPath + '/preuser/campaign/campaignView.do?campIdx=' + vo.campIdx + '">'
                +     '<div class="prd_img">'
                +       '<img src="' + contextPath + '/_img/pc/main/' + vo.campThub + '" alt="" '
                +            'onerror="this.onerror=null; this.src=\'' + contextPath + '/_img/pc/main/no_img.png\';">'
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
                + '</li>';
            });
          } else {
            campaignListHtml = '<li><p>검색 결과가 없습니다.</p></li>';
          }

          $('.pd_list ul.prd_li').html(campaignListHtml);
        },
        error: function (xhr, status, error) {
          console.error('AJAX Error:', status, error);
          $('.pd_list ul.prd_li').html('<li><p>데이터를 불러오는 중 오류가 발생했습니다.</p></li>');
        }
      });
    }

    // ───────────────── 이벤트 바인딩 ─────────────────

    // (1) 지역 탭 클릭 시
    $('.tab-link').on('click', function () {
      $('.tab-link').removeClass('current');
      $(this).addClass('current');

      var selectedRegion = $(this).data('region-name') || '';
      $('#regionInput').val(selectedRegion);

      filterCampaigns();
    });

    // (2) 드롭다운(카테고리/채널/타입/정렬) 변경 시
    $('.searchCondition').on('change', function () {
      filterCampaigns();
    });

    // (3) 헤더 검색 아이콘/버튼 클릭 또는 헤더 폼 제출 시
    // header.jsp 에서 a#headerSearchBtn 클릭 → submit 트리거가 걸려 있으므로,
    // 여기서는 submit을 가로채어 AJAX 호출로 연결합니다.
    $(document).on('submit', 'form.header-search', function (e) {
      e.preventDefault();
      // 목록 페이지니까 전체 이동 대신 AJAX로 목록만 갱신
      filterCampaigns();
    });

    // ─────────────── 초기 값 복원 (선택) ───────────────
    // 서버에서 model로 내려준 DTO가 있다면 반영
    var selectedRegion  = '${campaignSearchDTO.region}';
    var selectedCategory = '${campaignSearchDTO.category}';
    var selectedChannel  = '${campaignSearchDTO.channel}';
    var selectedType     = '${campaignSearchDTO.type}';
    var selectedSort     = '${campaignSearchDTO.sort}';

    if (selectedRegion) {
      $('.tab-link').removeClass('current');
      $('li[data-region-name="' + selectedRegion + '"]').addClass('current');
      $('#regionInput').val(selectedRegion);
    }
    if (selectedCategory) $('#category').val(selectedCategory);
    if (selectedChannel)  $('#channel').val(selectedChannel);
    if (selectedType)     $('#type').val(selectedType);
    if (selectedSort)     $('#sort').val(selectedSort);

    // 필요 시 첫 로딩에 현재 필터로 한번 호출하고 싶다면 주석 해제
    // filterCampaigns();
  });
</script>

</head>
<body>

<jsp:include page="/WEB-INF/jsp/_inc/header.jsp" />

<script src="/_js/ui.js"></script>

<div id="sub_content">
		<div class="s_cont">
			<div class="cont_all">
				<form id="campaignSearchForm" action="${pageContext.request.contextPath}/preuser/campaign/campaignList.do" method="GET">
				
					<input type="hidden" id="regionInput" name="region" value="" />

					<div class="region">
						<div class="selec_reg">
							<h2 class="sub_tit">지역</h2>
						</div>
						<ul class="reg01">
							<li class="tab-link current" data-tab="tab-1" data-region-name="">전체</li>
							<li class="tab-link" data-tab="tab-4" data-region-name="서울">서울</li>
							<li class="tab-link" data-tab="tab-5" data-region-name="경기">경기</li>
							<li class="tab-link" data-tab="tab-6" data-region-name="인천">인천</li>
							<li class="tab-link" data-tab="tab-7" data-region-name="강원">강원</li>
							<li class="tab-link" data-tab="tab-8" data-region-name="대전">대전</li>
							<li class="tab-link" data-tab="tab-9" data-region-name="세종">세종</li>
							<li class="tab-link" data-tab="tab-10" data-region-name="충남">충남</li>
							<li class="tab-link" data-tab="tab-11" data-region-name="충북">충북</li>
							<li class="tab-link" data-tab="tab-12" data-region-name="부산">부산</li>
							<li class="tab-link" data-tab="tab-13" data-region-name="울산">울산</li>
							<li class="tab-link" data-tab="tab-14" data-region-name="경남">경남</li>
							<li class="tab-link" data-tab="tab-15" data-region-name="경북">경북</li>
							<li class="tab-link" data-tab="tab-16" data-region-name="대구">대구</li>
							<li class="tab-link" data-tab="tab-17" data-region-name="광주">광주</li>
							<li class="tab-link" data-tab="tab-18" data-region-name="전남">전남</li>
							<li class="tab-link" data-tab="tab-19" data-region-name="전북">전북</li>
							<li class="tab-link" data-tab="tab-20" data-region-name="제주">제주</li>
						</ul>
						
					</div><div class="select_wrap">
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
							<select id="sort" name="sort" class="searchCondition">
								<option value="최신순">최신순</option>
								<option value="마감임박순">마감임박순</option>
								<option value="인기순">인기순</option>
							</select>
						</div>
					</div>
				</form>

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
				</div>

			</div><!-- cont_all -->
		</div><!-- s_cont -->
	</div><!-- sub_content -->

<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>
</html>
