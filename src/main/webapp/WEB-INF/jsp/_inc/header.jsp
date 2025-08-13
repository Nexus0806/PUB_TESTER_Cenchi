<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
	<div id="header">
		<h1>
			<a href="/index.do" class="logo"></a>
		</h1>

		<ul class="gnb">
			<li>
				<a href="/preuser/campaign/campaignList.do">체험단 검색</a>
				<div class="gnb_sub">
					<ul class="sub_menu">
						<li><a href="#none">체험단 신청하기</a></li>
						<li><a href="#none">체험단 문의사항</a></li>
					</ul>
				</div><!-- gnb_sub -->
			</li>
			<li><a href="#none">커뮤니티</a></li>
			<li><a href="#none">공지/이벤트</a></li>
			<li><a href="#none">이용가이드</a></li>
		</ul><!-- gnb -->

		<div class="h_right">
			<div class="s_wrap">
				<input type="search" class="search" placeholder="어떤 체험단을 찾고 있나요?">
				<a href="#none" class="s_btn" type="button">검색</a>
			</div><!-- search_wrap -->
			<c:choose>
			<%-- 세션에 로그인 정보가 있다면 --%>
			<c:when test="${not empty sessionScope.LOGIN_USER}">
				<div class="login_wrap02">
					<a href="javascript:void(0)" class="bell" onclick="">
						<span>1</span>
					</a>
					<%-- 나중에 마이페이지 연결하기... --%>
					<a href="#" class="my">
					<span class="myimg"></span> 
					<c:out value="${sessionScope.LOGIN_USER.name != null ? sessionScope.LOGIN_USER.name : sessionScope.LOGIN_USER.email}"/> 님
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
					<li>
						<a href="/preuser/campaign/campaignList.do">체험단 검색</a>
						<ul class="dep02">
							<li><a href="#none">- 체험단 신청하기</a></li>
							<li><a href="#none">- 체험단 문의사항</a></li>
						</ul>
					</li>
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

</header>