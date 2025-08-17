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
	
	<script type.text/javascript>
	// '좋아요' 버튼을 클릭했을 때 실행되는 함수
	function toggleLike(pstIdx) {
	    // jQuery의 ajax 기능을 사용하여 서버와 통신
	    $.ajax({
	        type: "POST", // HTTP 요청 방식
	        url: "${pageContext.request.contextPath}/preuser/board/toggleLike.do", // 요청을 보낼 서버 API 주소
	        data: { pstIdx: pstIdx }, // 서버에 보낼 데이터 (게시물 번호)
	        
	        // 서버로부터 성공적으로 응답을 받았을 때 실행되는 함수
	        success: function(response) {
	            // response 객체에는 {isLiked: true, likeCount: 124} 와 같은 JSON 데이터가 들어있습니다.
	            
	            // 1. 화면의 '좋아요' 숫자 업데이트
	            $("#likeCount").text(response.likeCount);
	            
	            // 2. 버튼의 스타일(class) 변경
	            // isLiked가 true이면 'liked' 클래스를 추가하고, false이면 제거합니다.
	            $("#likeBtn").toggleClass('liked', response.isLiked);
	        },
	        // 통신 중 에러가 발생했을 때 실행되는 함수
	        error: function(err) {
	            alert("좋아요 처리에 실패했습니다. 다시 시도해주세요.");
	            console.log(err);
	        }
	    });
	}
	</script>
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
</div> 	
		<div class="cont right">
					<div class="bbs_view">
						<div class="boardTop">
							<h3 class="sub_tit02">${board.pstTitle}</h3>
							<p class="sub">
								<span><b>작성자</b> <c:out value="${board.authorNickname}" default="관리자" /></span>
								<span><b>등록일</b> ${board.pstRegdate}</span>
								<span><b>조회수</b> ${board.pstHit}</span>
							</p>
						</div>
						<div class="board_cont">
							<p style="font-weight:400">
								${board.pstCont}
							</p>
						</div>

						<div class="cmt_ico">
							<div class="cmt01">
							    <button type="button" id="likeBtn" class="like_btn ${board.isLikedByCurrentUser ? 'liked' : ''}" onclick="toggleLike(${board.pstIdx});">
							        <span class="like_img">좋아요</span>
							    </button>
							    <p>좋아요 <span id="likeCount">${board.pstLike}</span></p> <%-- JS가 숫자를 업데이트할 수 있도록 ID 부여 --%>
							</div>
							<div class="cmt01">
								<span class="comm_img">댓글</span>
								<p>댓글 <span> ${board.pstCmtCnt}</span></p>
							</div>
						</div><!-- cmt_ico -->

						<div class="comment_wrap mb20">
							<c:forEach items="${board.comments}" var="comment">
								<div class="cmt clt">
									<p class="prop_img"></p>
									<ul class="cmt_txt">
										<li class="name">${comment.authorNickname}</li>
										<li>${comment.cmtCont}</li>
										<li class="date">${comment.cmtRegdate}</li>
									</ul>
									<a href="#none" class="modify">수정</a>
								</div>
							</c:forEach>
						<!-- <div class="cmt clt">
								<p class="prop_img"></p>
								<ul class="cmt_txt">
									<li class="name">닉네임</li>
									<li>신청자 작성 내용 노출시켜주세요.</li>
									<li class="date">2025.08.05 14:11</li>
								</ul>
								<a href="#none" class="modify">수정</a>
								<댓글 수정시 노출 (수정댓글 입력창)> 
								<div class="modi_cmt">
									<textarea name="" placeholder="수정할 내용을 입력해주세요." class="mb5"></textarea>
									<a href="#none" class="btn2 bk_line">취소</a>
									<a href="#none" class="btn2 bk">등록</a>
								</div> 
							</div >--> 
						</div><!-- comment_wrap -->

						<!-- 새 댓글 입력창 -->
						<h4>댓글 등록</h4>
						<form action="${pageContext.request.contextPath}/preuser/board/addComment.do" method="post">
						    <input type="hidden" name="pstIdx" value="${board.pstIdx}">
						    
						    <div class="cmt_ip mb40">
						        <textarea name="cmtCont" placeholder="댓글을 입력해주세요."></textarea>
						        <button type="submit" class="btn">등록</button>
						    </div>
						</form>

						<ul class="prev_next">
							<li class="prev">
								<strong>다음글</strong>
								<span class="no-data">게시글이 없습니다.</span>
							</li>
							<li class="next">
								<strong>이전글</strong>
								<a href="javascript:;" onclick=""><span>인증제도 개발 시스템 서비스 개편</span></a>
							</li>
						</ul>
					</div>
					<p class="basic_btn c">
						<a class="line_b" href="${pageContext.request.contextPath}/preuser/board/boardList.do" onclick="">목록으로</a>
					</p>

				

			</div>
		</div><!-- s_cont -->
	</div><!-- sub_content -->


<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>
</html>


<!-- 이건 대부분 공통으로 사용되는 양식임, 사용하세요! -->