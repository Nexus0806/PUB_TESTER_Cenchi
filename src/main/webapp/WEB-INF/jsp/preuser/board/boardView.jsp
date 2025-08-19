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
            position: absolute;   /* 문서 흐름에서 벗어나 공중에 뜹니다. */
            top: 100%;            /* 기준점(.cmt_actions)의 바로 아래에 위치 */
            right: 0;             /* 기준점의 오른쪽에 정렬 */
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            min-width: 80px;      /* 최소 너비 지정 */
            z-index: 10;          /* 다른 요소들 위에 보이도록 z-index 설정 */
            padding: 5px 0;
        }

        /* 메뉴 안의 링크 스타일 */
        .more_menu a {
            display: block;       /* 링크 영역을 넓혀 클릭하기 쉽게 만듭니다. */
            padding: 8px 12px;
            font-size: 14px;
            color: #333;
            text-decoration: none;
        }

        .more_menu a:hover {
            background-color: #f5f5f5;
        }
    </style>
	
	
<script type="text/javascript">
    // Controller에서 전달받은 현재 로그인한 사용자의 ID
    const loginUserIdx = "${loginUserIdx}";
	
	/**
	 * '좋아요' 버튼 클릭 시 실행되는 함수
	 * @param {number} pstIdx - 게시물 번호
	 */
	function toggleLike(pstIdx) {
	    $.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/preuser/board/toggleLike.do",
	        data: { pstIdx: pstIdx },
	        dataType: "json", // 서버로부터 JSON 형태의 응답을 기대합니다.
	        success: function(response) {
	            // response 예시: {isLiked: true, likeCount: 124}
	            $("#likeCount").text(response.likeCount);
	            $("#likeBtn").toggleClass('liked', response.isLiked);
	        },
	        error: function(err) {
	            alert("좋아요 처리에 실패했습니다. 다시 시도해주세요.");
	            console.log(err);
	        }
	    });
	}
	
	// jQuery: 문서가 모두 로드된 후 실행
	$(function() {

	    //================================================
	    // 댓글 수정/삭제 메뉴 관련 스크립트 (수정된 부분)
	    //================================================

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

	    //================================================
	    // 댓글 기능 관련 스크립트 (기존과 거의 동일)
	    //================================================

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
	        if (!confirm("정말로 댓글을 삭제하시겠습니까?")) {
	            return;
	        }

	        const $commentDiv = $(this).closest('.cmt.clt');
	        const cmtIdx = $commentDiv.data('cmt-idx');

	        $.ajax({
	            url: "${pageContext.request.contextPath}/preuser/board/deleteComment.do",
	            type: "POST",
	            data: { cmtIdx: cmtIdx },
	            success: function(response) {
	                if (response.status === "success") {
	                    alert("댓글이 삭제되었습니다.");
	                    $commentDiv.remove(); // 화면에서 댓글 HTML 요소를 완전히 제거
	                    // TODO: 전체 댓글 수 실시간으로 업데이트 필요 시 로직 추가
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
	            url: "${pageContext.request.contextPath}/preuser/board/updateComment.do",
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
						    <%-- 1. 이미지가 있을 경우에만 img 태그를 표시합니다. --%>
						    <c:if test="${not empty board.pstImg}">
						        <div class="board_img_wrap" style="margin-bottom: 20px; text-align: center;">
						             <%-- 2. Controller에 만든 이미지 URL을 src에 넣어줍니다. --%>
						            <img src="${pageContext.request.contextPath}/uploads/${board.pstImg}" alt="첨부 이미지" style="max-width: 100%; height: auto; border-radius: 8px;">
						        </div>
						    </c:if>
						
						    <%-- 3. 기존 게시글 내용은 그대로 표시합니다. --%>
						    <p style="font-weight:400">
						        <c:out value="${board.pstCont}" escapeXml="false" />
						    </p>
						</div>

						<div class="cmt_ico">
							<div class="cmt01">
							    <a href="javascript:void(0);" 
   									id="likeBtn" 
   									class="like_img ${board.isLikedByCurrentUser ? 'liked' : ''}" 
   									onclick="toggleLike(${board.pstIdx});">
    								<span class="like_img">좋아요</span>
								</a>

							    <p>좋아요 <span id="likeCount">${board.pstLike}</span></p> <%-- JS가 숫자를 업데이트할 수 있도록 ID 부여 --%>
							</div>
							<div class="cmt01">
								<span class="comm_img">댓글</span>
								<p>댓글 <span> ${board.pstCmtCnt}</span></p>
							</div>
						</div><!-- cmt_ico -->

						<div class="comment_wrap mb20">
						    <c:forEach items="${board.comments}" var="comment">
						        <%-- 각 댓글을 감싸는 div에 data-* 속성으로 식별 정보 추가 --%>
						        <div class="cmt clt" data-cmt-idx="${comment.cmtIdx}" data-user-idx="${comment.userIdx}" data-buss-idx="${comment.bussIdx}">
						            <p class="prop_img"></p>
						            <ul class="cmt_txt">
						                <li class="name">${comment.authorNickname}</li>
						                <li class="content">${comment.cmtCont}</li> <%-- 수정 시 내용을 바꾸기 위해 클래스 추가 --%>
						                <li class="date">${comment.cmtRegdate}</li>
						            </ul>
						
						            <%-- [수정] 로그인한 사용자와 댓글 작성자가 같을 경우에만 '수정' 버튼 표시 --%>
									<c:if test="${(loginUserType == 'inf' and loginUserIdx == comment.userIdx) or (loginUserType == 'BUSS' and loginUserIdx == comment.bussIdx)}">
									        <div class="cmt_actions"> <%-- CSS에서 position: relative; 가 적용될 컨테이너 --%>
									            
									            <%-- 1. 3점 아이콘 버튼 --%>
									            <a href="javascript:void(0);" class="modify">⋮</a>
									            
									            <%-- 2. 클릭 시 나타날 메뉴 (CSS에서 position: absolute; 가 적용됨) --%>
									            <div class="more_menu" style="display:none;">
									                <a href="javascript:void(0);" class="edit">수정</a>
									                <a href="javascript:void(0);" class="delete">삭제</a>
									            </div>
									        </div>
									 </c:if>
						            
						            <%-- 댓글 수정시 노출될 숨겨진 입력창 --%>
						            <div class="modi_cmt" style="display:none;">
						                <textarea class="mb5">${comment.cmtCont}</textarea>
						                <a href="javascript:void(0);" class="btn2 bk_line cancel">취소</a>
						                <a href="javascript:void(0);" class="btn2 bk save">등록</a>
						            </div> 
						        </div>
						    </c:forEach>
						</div>

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