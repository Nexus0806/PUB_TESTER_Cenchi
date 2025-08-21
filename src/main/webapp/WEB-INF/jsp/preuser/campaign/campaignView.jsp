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
	
	<style>
	    /* 메뉴 버튼과 메뉴를 감싸는 컨테이너 (위치 기준점 역할) */
	    .cmt_actions {
	        position: relative; /* 자식 요소인 .more_menu의 위치 기준이 됩니다. */
	        margin-left: auto; /* 오른쪽 끝으로 보내기 위함 */
	    }
	
	    /* 3점(수정) 아이콘 버튼 */
	    .cmt_actions .modify {
	        padding: 5px;
	        font-size: 1.2em;
	        line-height: 1;
	    }
	
	    /* 클릭 시 나타날 메뉴 (독립된 레이어로 띄움) */
	    .more_menu {
	        position: absolute; /* 문서 흐름에서 벗어나 공중에 뜹니다. */
	        top: 100%; /* 기준점(.cmt_actions)의 바로 아래에 위치 */
	        right: 0; /* 기준점의 오른쪽에 정렬 */
	        background-color: #fff;
	        border: 1px solid #ddd;
	        border-radius: 4px;
	        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
	        min-width: 80px; /* 최소 너비 지정 */
	        z-index: 10; /* 다른 요소들 위에 보이도록 z-index 설정 */
	        padding: 5px 0;
	    }
	
	    /* 메뉴 안의 링크 스타일 */
	    .more_menu a {
	        display: block; /* 링크 영역을 넓혀 클릭하기 쉽게 만듭니다. */
	        padding: 8px 12px;
	        font-size: 14px;
	        color: #333;
	        text-decoration: none;
	    }
	
	    .more_menu a:hover {
	        background-color: #f5f5f5;
	    }
	</style>
</head>
<body>

<c:if test="${not empty msg}">
    <script type="text/javascript">
        alert("${msg}");
    </script>
</c:if>


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
								<li class="sns_tit">
								<c:choose>
									<c:when test="${campVo.campAdType eq '유튜브'}">
										<p class="op_sns yout02"></p>
										<span>${campVo.campAdType}</span>
									</c:when>
									<c:when test="${campVo.campAdType eq '블로그' or campVo.campAdType eq '블로그+클립'}">
										<p class="op_sns nblog"></p>
										<span>${campVo.campAdType}</span>
									</c:when>
									<c:when test="${campVo.campAdType eq '인스타그램' or campVo.campAdType eq '릴스'}">
										<p class="op_sns insta"></p>
										<span>${campVo.campAdType}</span>
									</c:when>
									<c:when test="${campVo.campAdType eq '틱톡'}">
										<p class="op_sns tiktok"></p>
										<span>${campVo.campAdType}</span>
									</c:when>
									<c:otherwise>
										<p class="op_sns etc"></p>
										<span>${campVo.campAdType}</span>
									</c:otherwise>
								</c:choose>
								</li>
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
						    <c:forEach items="${commentList}" var="comment">
						        <div class="cmt clt" data-cmt-idx="${comment.cmtIdx}" data-user-idx="${comment.userIdx}" data-buss-idx="${comment.bussIdx}">
						            <p class="prop_img"></p>
						            <ul class="cmt_txt">
						                <li class="name">${comment.authorNickname}</li>
						                <li class="content">${comment.cmtCont}</li>
						                <li class="date">${comment.cmtRegdate}</li>
						            </ul>
						
						            <c:if test="${(loginUserType == 'inf' and loginUserIdx == comment.userIdx) or (loginUserType == 'BUSS' and loginUserIdx == comment.bussIdx)}">
						                <div class="cmt_actions">
						                    <a href="javascript:void(0);" class="modify">⋮</a>
						                    <div class="more_menu" style="display:none;">
						                        <a href="javascript:void(0);" class="edit">수정</a>
						                        <a href="javascript:void(0);" class="delete">삭제</a>
						                    </div>
						                </div>
						            </c:if>
						            
						            <div class="modi_cmt" style="display:none;">
						                <textarea class="mb5">${comment.cmtCont}</textarea>
						                <a href="javascript:void(0);" class="btn2 bk_line cancel">취소</a>
						                <a href="javascript:void(0);" class="btn2 bk save">등록</a>
						            </div> 
						        </div>
						    </c:forEach>
						</div>
						
						<h4>댓글 등록</h4>
						<form action="${pageContext.request.contextPath}/preuser/campaign/addComment.do" method="post">
						    <input type="hidden" name="campIdx" value="${campVo.campIdx}">
						    
						    <div class="cmt_ip mb40">
						        <textarea name="cmtCont" placeholder="댓글을 입력해주세요."></textarea>
						        <button type="submit" class="btn">등록</button>
						    </div>
						</form>				
					</div><!-- View_con -->

					<div class="View_info">
						<!-- 이미지 -->
						<p class="sn_img mb20" style="background: url(${pageContext.request.contextPath}/_img/pc/main/${campVo.campThub})no-repeat 50% 50% / cover;"></p> 		
							
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
								        <p>지원 <span> ${campVo.campSumCount}</span> / 모집 <span>${campVo.campRecruite}</span></p>
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

<script type="text/javascript">
// Controller에서 전달받은 현재 로그인한 사용자의 ID
const loginUserIdx = "${loginUserIdx}";

$(function() {
    // 1. '수정' 아이콘(3점 메뉴) 클릭 시: 메뉴 토글
    $('.comment_wrap').on('click', '.modify', function(e) {
        // 이벤트 전파를 중단하여, 바로 아래 document 클릭 이벤트가 실행되는 것을 방지
        e.stopPropagation(); 
        
        const $menu = $(this).next('.more_menu'); // 클릭된 아이콘 바로 옆의 메뉴

        // 현재 클릭한 메뉴를 제외한 다른 모든 메뉴는 닫기
        $('.more_menu').not($menu).hide();
        
        // 현재 메뉴를 보여주거나 숨기기 (토글)
        $menu.toggle();
    });

    // 2. 메뉴가 아닌 페이지의 다른 부분을 클릭하면 모든 메뉴 닫기
    $(document).on('click', function() {
        $('.more_menu').hide();
    });

    // 3. '수정하기' 버튼 클릭 시 (메뉴 안에서)
    $('.comment_wrap').on('click', '.edit', function() {
        const $commentDiv = $(this).closest('.cmt.clt');
        $(this).closest('.more_menu').hide(); // 메뉴 닫기

        // 기존 댓글 내용 숨기고, 수정 폼 보여주기
        $commentDiv.find('.cmt_txt').hide();
        $commentDiv.find('.modi_cmt').show().find('textarea').focus();
    });

    // 4. '삭제하기' 버튼 클릭 시
    $('.comment_wrap').on('click', '.delete', function() {
        if (!confirm("정말로 댓글을 삭제하시겠습니까?")) return;

        const $commentDiv = $(this).closest('.cmt.clt');
        const cmtIdx = $commentDiv.data('cmt-idx');

        $.ajax({
            url: "${pageContext.request.contextPath}/preuser/campaign/deleteComment.do",
            type: "POST",
            data: { cmtIdx: cmtIdx },
            success: function(response) {
                if (response.status === "success") {
                    alert("댓글이 삭제되었습니다.");
                    $commentDiv.remove(); // 화면에서 댓글 HTML 요소 제거
                } else {
                    alert("댓글 삭제에 실패했습니다.");
                }
            },
            error: function() {
                alert("서버 통신 중 오류가 발생했습니다.");
            }
        });
    });

    // 5. '등록' (수정 완료) 버튼 클릭 시
    $('.comment_wrap').on('click', '.save', function() {
        const $commentDiv = $(this).closest('.cmt.clt');
        const cmtIdx = $commentDiv.data('cmt-idx');
        const cmtCont = $commentDiv.find('.modi_cmt textarea').val();

        if (cmtCont.trim() === '') {
            alert("수정할 내용을 입력해주세요.");
            return;
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/preuser/campaign/updateComment.do",
            type: "POST",
            data: { 
                cmtIdx: cmtIdx,
                cmtCont: cmtCont
            },
            success: function(response) {
                if (response.status === "success") {
                    // 화면의 댓글 내용 업데이트
                    $commentDiv.find('.cmt_txt .content').text(cmtCont);
                    // 수정 폼 숨기고, 원래 댓글 내용 보여주기
                    $commentDiv.find('.modi_cmt').hide();
                    $commentDiv.find('.cmt_txt').show();
                } else {
                    alert("댓글 수정에 실패했습니다.");
                }
            },
            error: function() {
                alert("서버 통신 중 오류가 발생했습니다.");
            }
        });
    });

    // 6. '취소' 버튼 클릭 시 (수정 입력창에서)
    $('.comment_wrap').on('click', '.cancel', function() {
        const $commentDiv = $(this).closest('.cmt.clt');
        // 수정 폼 숨기고, 원래 댓글 내용 보여주기
        $commentDiv.find('.modi_cmt').hide();
        $commentDiv.find('.cmt_txt').show();
    });
});
</script>


<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>
</html>

