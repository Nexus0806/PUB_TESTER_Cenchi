<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<header>
	<div id="header">
		<h1>
			<a href="/index.do" class="logo"></a>
		</h1>

		<ul class="gnb">
			<li><a href="/preuser/campaign/campaignList.do">체험단 검색</a></li>
			<li><a href="/preuser/board/boardList.do">커뮤니티</a></li>
			<li><a href="#none">공지/이벤트</a></li>
			<li><a href="#none">이용가이드</a></li>
		</ul><!-- gnb -->

		<div class="h_right">
			<form class="header-search s_wrap" method="get" action="${pageContext.request.contextPath}/preuser/campaign/campaignList.do">
				<input type="search" class="search" id="headerKeyword" name="searchKeyword"
						placeholder="어떤 체험단을 찾고 있나요?"
               			value="${fn:escapeXml(param.keyword)}" />
        		<a href="javascript:void(0);" class="s_btn" id="headerSearchBtn" role="button">검색</a>
        			
				<input type="hidden" name="category" value="${fn:escapeXml(param.category)}" />
        		<input type="hidden" name="channel"  value="${fn:escapeXml(param.channel)}" />
        		<input type="hidden" name="type"   value="${fn:escapeXml(param.adtype)}" />
        		<input type="hidden" name="region"   value="${fn:escapeXml(param.region)}" />
        		<input type="hidden" name="sort"     value="${fn:escapeXml(param.sort)}" />        			
			</form>
			<c:choose>
			<%-- 세션에 로그인 정보가 있다면 --%>
			<c:when test="${not empty sessionScope.LOGIN_USER}">
				<div class="login_wrap02">
					<a href="javascript:void(0)" class="bell" onclick="">
						<span>1</span>
					</a>
					<%-- 나중에 마이페이지 연결하기... --%>
					<a href="/preuser/mypage/mycampaign.do" class="my">
					<span class="myimg"></span> 
					<c:out value="${sessionScope.LOGIN_USER.userNickName != null ? sessionScope.LOGIN_USER.userNickName : '닉네임설정'}"/> 님
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="login_wrap">
					<a href="/preuser/member/login.do">로그인</a>
				</div><!-- login_wrap -->
			</c:otherwise>
			</c:choose>
		</div><!-- h_right -->
	</div> <!-- header -->

	<div id="tm_header">
		<div class="tm_h_wrap">
			<h1>
				<a href="/index.html" class="logo"></a>
			</h1>

			<div class="tm_right">
				<div class="s_wrap">
					<a href="#none" type="button" class="sch_btn">검색</a>
				</div><!-- s_wrap -->
				<div class="ham">
					<a href="#none" class="navi_btn"></a>
				</div><!-- ham -->
			</div><!-- h_right -->
		</div><!-- tm_h_wrap -->

		<div class="navi">
			<div class="lnb">
				<div class="nv_h">
					<h1>
						<a href="/index.html" class="logo"></a>
					</h1>

					<div class="nv_btn">
						<a href="#none" class="close"></a>
					</div><!-- h_right -->
				</div><!-- nv_h -->

				<div class="login_wrap">
					<a href="/preuser/member/login.do">로그인 <p>해주세요.</p></a>
				</div><!-- login_wrap -->

				<ul class="dep01">
					<li><a href="/preuser/campaign/campaignList.do">체험단 검색</a></li>
					<li><a href="#none">커뮤니티</a></li>
					<li><a href="#none">공지/이벤트</a></li>
					<li><a href="#none">이용가이드</a></li>
				</ul> <!-- dep01 -->
			</div><!-- lnb -->
			<div class="nav_bg"></div>
		</div> <!-- navi -->
	</div><!-- tm_header -->

	<div class="tm_sch_wrap">
		<div class="tm_sch_all">
			<a href="#none" class="tm_x"></a>
			<div class="tm_sch">
				<input type="search" class="tm_sh" placeholder="어떤 체험단을 찾고 있나요?">
				<a href="#none" class="tm_s_btn" type="button">검색</a>
			</div><!-- tm_sch -->
		</div><!-- tm_sch_all -->
	</div><!-- tm_sch_wrap -->

	<div id="tm_bt_header">
		<ul class="tm_bt">
			<li>
				<a href="#none" class="ic_home">
					<div class="bt_icon"></div>
					<p>홈</p>
				</a>
			</li>
			<li>
				<a href="#none" class="ic_menu">
					<div class="bt_icon"></div>
					<p>카테고리</p>
				</a>
			</li>
			<li>
				<a href="#none" class="ic_comm">
					<div class="bt_icon"></div>
					<p>커뮤니티</p>
				</a>
			</li>
			<li>
				<a href="#none" class="ic_my">
					<div class="bt_icon"></div>
					<p>마이페이지</p>
				</a>
			</li>
		</ul>
	</div><!-- tm_bt_header -->
	
	
	<script>
  // 헤더가 모든 페이지에 공통 포함되므로, 요소 존재 여부를 확인하며 안전하게 동작
  document.querySelector('.header-search')?.addEventListener('submit', function () {
    const getVal = sel => document.querySelector(sel)?.value || '';

    // campaignList.jsp 에만 있는 필터 DOM에서 최신값을 읽어 히든에 반영
    const cat = getVal('#category');     // <select id="category">
    const ch  = getVal('#channel');      // <select id="channel">
    const typ = getVal('#type');         // <select id="type"> (= adtype)
    const reg = getVal('#regionInput');  // <input id="regionInput"> (스크립트에서 regionInput 이라는 이름으로 받고 있음)
    const srt = getVal('#sort');         // <select id="sort">

    if (cat) this.querySelector('input[name=category]').value = cat;
    if (ch)  this.querySelector('input[name=channel]').value  = ch;
    if (typ) this.querySelector('input[name=adtype]').value   = typ;
    if (reg) this.querySelector('input[name=region]').value   = reg;
    if (srt) this.querySelector('input[name=sort]').value     = srt;
  });
  
  // 검색 아이콘 클릭 시
  $(document).on('click keydown', '#headerSearchBtn', function(e){
	    if (e.type === 'click' || (e.type === 'keydown' && (e.key === 'Enter' || e.key === ' '))) {
	      e.preventDefault();
	      const $form = $(this).closest('form.header-search');
	      // form의 submit 핸들러(히든값 덮어쓰기 등)가 실행되도록 트리거
	      $form.trigger('submit');
	    }
	  });
	</script>

</header>