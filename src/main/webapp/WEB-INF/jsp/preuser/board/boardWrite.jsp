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
		<div id="left_menu" class="lnb left">
	<ul class="lnb_li">
		<li>
			<p class="left_tit">마이페이지</p>
			<ul class="sub_li">
				<li class="on"><a href="#none">내 체험단</a></li>
				<li><a href="#none">체험단 신청 관리</a></li>
				<li><a href="#none">체험단 취소</a></li>
				<li><a href="#none">커뮤니티</a></li>
			</ul>
		</li>
		<!-- <li>
			<ul class="sub_li">
				<li><a href="#none">커뮤니티</a></li>
			</ul>
		</li> -->
		<li>
			<p class="left_tit">내 정보 관리</p>
			<ul class="sub_li">
				<li><a href="#none">프로필</a></li>
				<li><a href="#none">찜 목록</a></li>
			</ul>
		</li>
		<li>
			<p class="left_tit">고객센터</p>
			<ul class="sub_li">
				<li><a href="#none">자주 묻는 질문</a></li>
				<li><a href="#none">문의 내역</a></li>
				<li><a href="#none">공지 / 이벤트</a></li>
			</ul>
		</li>
	</ul>
	<p class="basic_btn">
		<a href="#none" class="logout">로그아웃</a>
	</p>
</div> <!-- left -->			<div class="cont right">
				<h2 class="sub_tit">게시글 작성</h2>
				<!-- 게시글 수정 시 타이틀 변경 -->
				<!-- <h2 class="sub_tit">게시글 수정</h2> -->

				<div class="write_wrap">
					<h4 class="mt30">제목</h4>
					<div class="sel tit_flex">
						<label class="sr-only">카테고리</label>
						<select>
							<option value="">ALL</option>
							<option value="">BEST</option>
							<option value="">노하우</option>
							<option value="">일상</option>
							<option value="">질문하기</option>
							<option value="">동행</option>
							<option value="">공지</option>
						</select>
						<input type="text" class="wt_tit" placeholder="제목을 입력해주세요.">
					</div>

					<h4 class="mt30">내용</h4>
					<p style="padding: 120px 10px; border-radius: 10px; border: 1px solid #ddd;">에디터 넣어주세요.</p>


					<h4 class="mt30">파일업로드</h4>
					<div class="filebox">
						<input type="file" id="file" class="sr-only">
						<label for="file"><span></span>클릭하거나 드래그/드롭 해주세요. 5MB 이하의 JPEG, PNG 파일</label>
						<!-- 첨부된 파일표시 -->
						<!-- <p>
							<a href="javascript:void(0)">File 1.jpg(128KB)</a>
							<button class="del"></button>
						</p> -->
					</div>

					<div class="btn_wrap ct mt40">
						<!-- 등록하기 버튼 -->
						<a href="#none" class="btn ct">등록하기</a>

						<!-- 삭제하기 / 수정하기 버튼 -->
						<!-- <a href="#none" class="btn ct bk_line">삭제하기</a>
						<a href="#none" class="btn ct bk">수정하기</a> -->
					</div>
				</div><!-- write_wrap -->
			</div><!-- cont right -->
		</div><!-- s_cont -->
	</div><!-- sub_content -->


<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>
</html>


<!-- 이건 대부분 공통으로 사용되는 양식임, 사용하세요! -->