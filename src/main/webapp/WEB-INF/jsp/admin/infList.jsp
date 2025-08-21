<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no">
	<meta name="generator" content="editplus">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<title>공공체험단 관리자</title>
	<link rel="stylesheet" type="text/css" href="https://sian.pms.or.kr/with_adm/_css/default.css">
	<script type="text/javascript" src="https://sian.pms.or.kr/with_adm/_js/jquery-3.2.1.min.js"></script>
	<script src="https://sian.pms.or.kr/with_adm/_js/pop_layer.js"></script></head>
<body>
	<div id="wrap">
		<div id="header">
			<h1><a href="/admin/infList.do"><img src="${pageContext.request.contextPath}/_img/pc/comn/logo.svg"></a></h1>
			<div id="head_right">	
				<p>
					<strong>admin</strong>님 환영합니다. 
				</p>
				<a href="/admin/infList.do" class="mp">관리자 관리</a>
				<a href="/admin/login.do" class="out">로그아웃</a>
			</div>
		</div>	
		
		<div id="container">
			<ul id="lmn">
				<li class="on"><a href="/admin/infList.do">회원관리</a>
					<ul class="dep3">
						<li class="on"><a href="/admin/infList.do">인플루언서 관리</a></li>
						<li><a href="/admin/bssList.do">사업자 관리</a></li>
					</ul>	
				</li>
				<li ><a href="/admin/comList.do">커뮤니티</a>
					<ul class="dep3">
						<li ><a href="/admin/comList.do">커뮤니티 게시글 관리</a></li>
					</ul>
				</li>
				<li ><a href="/admin/notList.do">공지/이벤트관리</a>
					<ul class="dep3">
						<li ><a href="/admin/notList.do">공지사항 관리</a></li>
						<li ><a href="/admin/evtList.do">이벤트 관리</a></li>
					</ul>
				</li>
				<li ><a href="/admin/accWaitList.do">체험단 관리</a>
					<ul class="dep3">
						<li ><a href="/admin/accWaitList.do">체험단 승인 관리</a></li>
						<li ><a href="/admin/accCompList.do">체험단 게시글 관리</a></li>
					</ul>
				</li>
			</ul>	
			
			<div id="content">
				<h2>인플루언서 관리</h2>
				<div id="search_field">
					<table class="basic l">
						<caption>검색 영역</caption>
						<colgroup><col style="width:150px"><col style="width:auto"><col style="width:150px"><col style="width:auto"></colgroup>
						<tbody>
							<tr>
								<th>검색</th>
								<td>
									<p class="input">
										<input name="searchKeyword" id="searchKeyword" type="text" size="30" value="" title="조회">
										<span class="sbtn"><a href="javascript:void(0);" onclick="">조회</a></span>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>	

				<div class="listTop">
					<p>총 ${infListCnt}명, 1 of 3 Pages</p>
					<div class="select_wrap">
						<select id="orderBy" name="orderBy" title="정렬기준 선택">
							<option value="desc" selected>등록일 정렬 ↓</option>
							<option value="asc">등록일 정렬 ↑</option>
						</select>
						<select id="pageUnit" name="pageUnit" title="출력 개수 선택">
							<option value="10" selected>10개 출력</option>
							<option value="20">20개 출력</option>
							<option value="30">30개 출력</option>
						</select>
					</div>
				</div>

				<table class="basic hover">
					<caption>관리자 명단</caption>
					<colgroup>
					<col style="width:10%"> <%-- 회원가입일 --%> 
					<col style="width:5%">	<%-- 실명 --%> 
					<col style="width:8%">	<%-- 닉네임 --%> 
					<col style="width:10%">	<%-- 핸드폰번호 --%> 
					<col style="width:10%">	<%-- 이메일 --%> 
					<col style="width:8%">	<%-- 생일 --%> 
					<col style="width:3%">	<%-- 성별 --%> 
					<col style="width:5%">	<%-- 활동지역 --%> 
					<col style="width:5%">	<%-- 활동주제 --%> 
					<col style="width:5%">	<%-- 방문횟수 --%> 
					<col style="width:5%">	<%-- 협찬횟수 --%> 
					<col style="width:5%">	<%-- 패널티 --%> 
					<col style="width:5%">	<%-- 취소횟수 --%> 
					<col style="width:5%">	<%-- 유저평점 --%> 
					<col style="width:auto"><%-- 활동내역 --%> 
					</colgroup>
					<thead>
						<tr>
							<th>회원가입일</th>
							<th>실명</th>
							<th>닉네임</th>
							<th>핸드폰 번호</th>
							<th>이메일</th>
							<th>생일</th>
							<th>성별</th>
							<th>활동지역</th>
							<th>활동주제</th>
							<th>방문횟수</th>
							<th>협찬횟수</th>
							<th>패널티</th>
							<th>취소횟수</th>
							<th>유저평점</th>
							<th>활동내역</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="user" items="${infList}">
						<tr>
							<td>${user.userRegDate}</td>
							<td><a href="/admin/detail/infDetail.do">${user.userName}</a></td>
							<td>${user.userNick}</td>
							<td>${user.userPhoneNum}</td>
							<td>${user.userEmail}</td>
							<td>${user.userBirth}</td>
							<td>
							<c:choose>
								<c:when test="${user.userSex == 'F'}">여</c:when>
								<c:otherwise>남</c:otherwise>
							</c:choose>
							</td>
							<td>${user.userArea}</td>
							<td>${user.userAct}</td>
							<td>${user.userVisitCnt}</td>
							<td>${user.userhisCnt}</td>
							<td>${user.userBanCnt}</td>
							<td>${user.userCancelCnt}</td>
							<td>${user.userScore}/5.0</td>
							<td>
								<p class="sbtn">
									<a href="https://sian.pms.or.kr/with_adm/admin/adminWrite.html">수정</a>
									<a class="gray_line" href="javascript:void(0)" onclick="layer_open('delPop', 'del_Pop');return false;">삭제</a>
								</p>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
			   
				<div class="paging">
				   <a class="btn_first"></a>
				   <a class="btn_prev"></a>
				   <a class="current">1</a>
				   <a>2</a>
				   <a>3</a>
				   <a>4</a>
				   <a>5</a>
				   <a>6</a>
				   <a>7</a>
				   <a>8</a>
				   <a>9</a>
				   <a>10</a>
				   <a class="btn_next"></a>
				   <a class="btn_last"></a>
				   <p class="f_r sbtn"><a href="https://sian.pms.or.kr/with_adm/admin/adminWrite.html" class="navy">등록</a></p>
			   </div>
			</div>
		</div>
	</div><!-- wrap -->


	<div class="layer" id="del_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delPop">
			<p class="pop_title">
				<a class="cbtn" href="#none">닫기</a>
			</p>
			<div class="pop_cont c">
				<p>삭제된 정보는 <u class="red">복구할 수 없습니다.</u></p>
				<p>삭제하시겠습니까?</p>
				<p class="btn_wrap">
					<a href="#">취소</a>
					<a href="#" class="gray_line">삭제</a>
				</p>
			</div>
		</div>
	</div>

</body>

<!-- Mirrored from sian.pms.or.kr/with_adm/admin/adminList.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 08 Aug 2025 01:45:22 GMT -->
</html>