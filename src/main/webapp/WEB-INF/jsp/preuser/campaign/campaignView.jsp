<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
							<p class="v_tit">${campVo.campTitle}</p>

							<ul class="opt">
								<!-- 아이콘 클래스명 입니다. yout 유튜브 숏츠 / yout02 유튜브 / nblog 네이버 블로그 / insta 인스타그램 -->
								<li class="sns_tit"><p class="op_sns yout02"></p><span>${campVo.campAdType}</span></li>
								<li><p class="op_num">#${campVo.campIdx}</p></li>
								<li><p class="op_cate">${campVo.campType}</p></li>
								<li><p class="op_cate02">${campVo.campCate}</p></li>
							</ul>
						</div><!-- View_top -->

						<ul class="con_list">
							<li>
								<span class="c_tit">주최자</span>
								<b class="c_info clt" style="color: #222;"><span class="c_ic"></span>관리자 DB 공사중</b>
							</li>
							<li>
								<span class="c_tit">제공서비스/물품</span>
								<p class="edit clt">${campVo.campService}</p>
							</li>
							<li>
								<span class="c_tit">방문정보</span>
									<div id="daumRoughmapContainer1754449174733" class="root_daum_roughmap root_daum_roughmap_landing clt"></div>
							</li>
							<li>
								<span class="c_tit">방문 주소</span>
								<p class="edit clt">${campVo.campAddress}</p>
							</li>
							<li>
								<c:choose>
									<c:when test="${campVo.campType == '방문형' or campVo.campType == '구매형' or campVo.campType == '포장형'}">
										<span class="c_tit">방문 및 예약 안내</span>
									</c:when>
									<c:when test="${campVo.campType == '배송형'}">
										<span class="c_tit">배송 및 구매 안내</span>
									</c:when>
								</c:choose>
								<p class="edit clt">
								
									- 체험 가능 요일 : ${campVo.campAvailDays}  <br>
									- 체험 가능 시간 : ${campStartTime}	~ ${campEndTime} <br>
									
									- 당일 예약 : <c:choose>
												    <c:when test="${campVo.campReserve eq 'Y'}">
												        당일예약 가능합니다. <br>
												    </c:when>
												    <c:otherwise>
												        당일예약이 불가능합니다. 사전 문의 바랍니다. <br>
												    </c:otherwise>
												</c:choose>
									<br>
									- 예약 시 주의사항: ${campVo.campCaution}
									<br><br>
																		
								<c:choose>
							        <c:when test="${campVo.campType == '방문형' or campVo.campType == '구매형' or campVo.campType == '포장형'}"> 
							                🚨 자세한 방문 일정 및 영상가이드는 담당자 연락처로 연락하여 조율 바랍니다. <br> <br>
							                - 방문하여 촬영 후 영상을 올리는 체험입니다. <br>
											- 신청 전 체험단 미션 및 방문 일정 필수 확인 <br>
											- 반드시 체험하실 수 있는 분들만 신청해 주세요. <br>
											- 당첨후 단순 변심으로 취소 시 취소횟수 부과 <br>
											- 유료 광고 라벨표시 필수 (영상 내 문구 포함) <br>
							        </c:when>
							        <c:when test="${campVo.campType == '배송형'}">
							                💻 온라인으로 진행되는 체험입니다. 제품은 회원 정보에 등록된 주소로 발송될 예정이니, 주소를 다시 한번 확인해 주세요. <br> <br>
							                - 선정된 이후 프로필에 등록된 주소로 제품 발송예정 <br>
											- 당첨 후 단순 변심으로 취소 시 취소횟수 부과 <br>
											- 배송이 시작된 이후 제품하자가 아닌 단순취소 시 제품비용 또는 왕복배송비가 청구됩니다. <br>
							        </c:when>
							        <c:otherwise>
							                - 자세한 가이드는 선정 후 개별적으로 안내됩니다.
							        </c:otherwise>
							    </c:choose>
							    
								</p>
							</li>
							<li>
								<span class="c_tit">키워드 정보</span>
								<div class="tag clt">
									<c:forEach var="keyword" items="${keywordList}">
										<em>${keyword}</em>
									</c:forEach>
								</div>
							</li>
							<li>
								<span class="c_tit">체험단 미션</span>
								<p class="edit clt">${campVo.campMission}</p>
							</li>
							<li>
								<span class="c_tit">공정위 문구(배너)</span>
								<p class="edit clt"> 
									<img src="${pageContext.request.contextPath}/_img/pc/comn/JFTC_logo.avif"
									         alt="공정거래위원회 로고" 
									         style="width: 100px; vertical-align: middle;">
								</p>
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
						<p class="sn_img mb20" style="background: url(${pageContext.request.contextPath}/images/pc/main/${campVo.campThub})no-repeat 50% 50% / cover;"></p> 		
							
						<div class="sche">
							<p class="sche_tit">체험단 일정</p>
								<ul class="sche_list">
								    <li class="point">
								        <span class="sc_tit">체험단 신청 기간</span>
								        <p>
								            <%-- 1. recStartDate 문자열을 "yyyy-MM-dd" 형식으로 읽어서 날짜 객체로 변환 후 "parsedRecStart" 변수에 저장 --%>
								            <fmt:parseDate value="${recStartDate}" pattern="yyyy-MM-dd" var="parsedRecStart" />
								            <%-- 2. "parsedRecStart" 변수(날짜 객체)를 "MM-dd" 형식의 문자열로 출력 --%>
								            <fmt:formatDate value="${parsedRecStart}" pattern="MM-dd" /> ~
								
								            <fmt:parseDate value="${recEndDate}" pattern="yyyy-MM-dd" var="parsedRecEnd" />
								            <fmt:formatDate value="${parsedRecEnd}" pattern="MM-dd" />
								        </p>
								    </li>
								    <li>
								        <span class="sc_tit">리뷰어 발표</span>
								        <p>
								            <fmt:parseDate value="${reviewerDate}" pattern="yyyy-MM-dd" var="parsedReviewer" />
								            <fmt:formatDate value="${parsedReviewer}" pattern="MM-dd" />
								        </p>
								    </li>
								    <li>
								        <span class="sc_tit">체험기간</span>
								        <p>
								            <fmt:parseDate value="${expStartDate}" pattern="yyyy-MM-dd" var="parsedExpStart" />
								            <fmt:formatDate value="${parsedExpStart}" pattern="MM-dd" /> ~
								            
								            <fmt:parseDate value="${expEndDate}" pattern="yyyy-MM-dd" var="parsedExpEnd" />
								            <fmt:formatDate value="${parsedExpEnd}" pattern="MM-dd" />
								        </p>
								    </li>
								    <li>
								        <span class="sc_tit">실시간 지원 현황</span>
								        <p>지원 <span> ${campVo.campRecruite}</span> / 모집 <span>${campVo.campSumCount}</span></p>
								    </li>
								</ul>

							<div class="Calendar">
							    <p class="month_box">
							        <a href="javascript:void(0)" class="cla_l"></a>
							        <span class="month"></span> 
							        <a href="javascript:void(0)" class="cla_r"></a>
							    </p>
							    <ul class="Cal_li">
							    </ul>
							</div>

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
								<a href="${pageContext.request.contextPath}/preuser/campaign/campaignSubmit.do?campIdx=${campVo.campIdx}" class="btn">신청하기</a>
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
	
<!--  달력용 스크립트 -->
<script>
$(document).ready(function() {
    // --- 1. 모든 변수를 document.ready 내부에 선언하여 충돌 방지 ---
    let currentDisplayDate;
    let globalSchedule;

    // --- 2. 데이터 수신 ---
    const recStartDateStr = '${recStartDate}';
    const recEndDateStr   = '${recEndDate}';
    const reviewerDateStr = '${reviewerDate}';
    const expStartDateStr = '${expStartDate}';
    const expEndDateStr   = '${expEndDate}';
    const baseDateStr     = '${baseDate}'; 

    if (!baseDateStr || baseDateStr.startsWith('$')) {
        console.error("오류: baseDate 값을 JSP로부터 받지 못했습니다.");
        $('.Calendar').text("달력 정보를 불러올 수 없습니다.");
        return;
    }

    // --- 3. Date 객체 생성 ---
    const dateParts = baseDateStr.split('-');
    currentDisplayDate = new Date(parseInt(dateParts[0]), parseInt(dateParts[1]) - 1, parseInt(dateParts[2]));
    
    globalSchedule = {
        rec_start: recStartDateStr ? new Date(recStartDateStr) : null,
        rec_end:   recEndDateStr ? new Date(recEndDateStr) : null,
        reviewer:  reviewerDateStr ? new Date(reviewerDateStr) : null,
        exp_start: expStartDateStr ? new Date(expStartDateStr) : null,
        exp_end:   expEndDateStr ? new Date(expEndDateStr) : null
    };
    
    for (const key in globalSchedule) {
        if (globalSchedule[key]) globalSchedule[key].setHours(0, 0, 0, 0);
    }

    // --- 4. [요청하신 디버깅 코드] renderCalendar 호출 직전 파라미터 확인 ---
    const yearParam = currentDisplayDate.getFullYear();
    const monthParam = currentDisplayDate.getMonth();

    console.log("--- renderCalendar 호출 직전 파라미터 값 ---");
    console.log("year 파라미터:", yearParam, "(타입:", typeof yearParam, ")");
    console.log("month 파라미터:", monthParam, "(타입:", typeof monthParam, ")");
    console.log("schedule 파라미터:", globalSchedule);
    console.log("---------------------------------------");
    // --- [디버깅 코드 끝] ---

    // --- 5. 초기 달력 생성 및 이벤트 등록 ---
    renderCalendar(yearParam, monthParam, globalSchedule);

    $('.cla_l').on('click', function() {
        currentDisplayDate.setMonth(currentDisplayDate.getMonth() - 1);
        renderCalendar(currentDisplayDate.getFullYear(), currentDisplayDate.getMonth(), globalSchedule);
    });
    $('.cla_r').on('click', function() {
        currentDisplayDate.setMonth(currentDisplayDate.getMonth() + 1);
        renderCalendar(currentDisplayDate.getFullYear(), currentDisplayDate.getMonth(), globalSchedule);
    });
});


    /**
     * [디버깅 모드] 동적으로 달력을 생성하고 스케줄에 따라 스타일을 적용하는 함수
     */
     function renderCalendar(year, month, schedule) {
    	    console.log("--- renderCalendar 함수 실행 ---");

    	    const today = new Date();
    	    today.setHours(0, 0, 0, 0);

    	    const firstDay = new Date(year, month, 1);
    	    const lastDay = new Date(year, month + 1, 0);
    	    const firstDayOfWeek = firstDay.getDay();

    	    // [수정됨] 문자열 더하기 방식으로 변경
    	    $('.Calendar .month').text(year + '년 ' + (month + 1) + '월');

    	    const calendarList = $('.Cal_li');
    	    calendarList.empty();
    	    calendarList.append('<li>Sun</li><li>Mon</li><li>Tue</li><li>Wed</li><li>Thu</li><li>Fri</li><li>Sat</li>');

    	    // 시작일 이전의 빈 칸 추가
    	    for (let i = 0; i < firstDayOfWeek; i++) {
    	        calendarList.append('<li><a href="#none"></a></li>');
    	    }

    	    // 실제 날짜 추가
    	    const totalDays = lastDay.getDate();
    	    for (let day = 1; day <= totalDays; day++) {
    	        const currentDay = new Date(year, month, day);
    	        let classList = [];

    	        if (schedule.rec_start && schedule.rec_end && currentDay >= schedule.rec_start && currentDay <= schedule.rec_end) {
    	            classList.push('on');
    	        }
    	        if (schedule.exp_start && schedule.exp_end && currentDay >= schedule.exp_start && currentDay <= schedule.exp_end) {
    	            classList.push('on', 'blue');
    	        }
    	        if (schedule.reviewer && currentDay.getTime() === schedule.reviewer.getTime()) {
    	            classList = ['on', 'red'];
    	        }
    	        if (currentDay.getTime() === today.getTime()) {
    	            classList.push('tday');
    	        }
    	        
    	        // [수정됨] 가장 중요! 날짜(day)가 정상적으로 추가되도록 문자열 더하기 방식으로 변경
    	        calendarList.append('<li class="' + classList.join(' ') + '"><a href="#none">' + day + '</a></li>');
    	    }
    	    
    	    console.log("--- renderCalendar 함수 정상 종료 ---");
    	}
</script>


<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>
</html>

