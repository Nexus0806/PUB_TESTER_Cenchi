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
	
	<script type="text/javascript">
	function fn_link_page(pageNo) {
	    // 현재 URL의 모든 파라미터를 가져옵니다.
	    const urlParams = new URLSearchParams(window.location.search);
	    
	    // 'currentPageNo' 파라미터 값을 클릭한 페이지 번호로 설정(또는 변경)합니다.
	    urlParams.set('currentPageNo', pageNo);
	    
	    // 새로운 파라미터가 적용된 URL로 페이지를 이동시킵니다.
	    location.href = "${pageContext.request.contextPath}/preuser/board/boardList.do?" + urlParams.toString();
	}
	function fn_search(fromCheckbox) {
	    const wrtCheckbox = document.getElementById('wrt');
	    const cmtCheckbox = document.getElementById('cmt');

	    // 체크박스 중 하나만 선택되도록 처리
	    if (fromCheckbox === 'wrt' && wrtCheckbox.checked) {
	        cmtCheckbox.checked = false;
	    } else if (fromCheckbox === 'cmt' && cmtCheckbox.checked) {
	        wrtCheckbox.checked = false;
	    }

	    // myContent 파라미터 값 결정
	    let myContent = '';
	    if (wrtCheckbox.checked) {
	        myContent = 'wrt';
	    } else if (cmtCheckbox.checked) {
	        myContent = 'cmt';
	    }

	    const urlParams = new URLSearchParams(window.location.search);
	    let category = urlParams.get('category') || 'ALL';
	    const searchCondition = document.getElementById('searchCondition').value;
	    const searchKeyword = document.getElementById('searchKeyword').value;
	    
	    // 새 URL 생성 (searchKeyword가 없어도 검색 가능하도록 수정)
	    let newUrl = "${pageContext.request.contextPath}/preuser/board/boardList.do?category=" + category;
	    if (myContent) {
	        newUrl += "&myContent=" + myContent;
	    }
	    if (searchKeyword.trim() !== "") {
	        newUrl += "&searchCondition=" + searchCondition + "&searchKeyword=" + encodeURIComponent(searchKeyword);
	    }
	    
	    location.href = newUrl;
	}

	// 검색 버튼용 함수 (기존 검색 기능 유지)
	function fn_search_btn() {
	    if (document.getElementById('searchKeyword').value.trim() === "") {
	        alert("검색어를 입력해주세요.");
	        return;
	    }
	    fn_search(); // 메인 검색 함수 호출
	}
	</script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/_inc/header.jsp" />

<script src="/_js/ui.js"></script>

<div id="sub_content">
		<div class="s_cont">
			<jsp:include page="/WEB-INF/jsp/_inc/sideMenu.jsp" />
			
			<div class="cont right">
				<h2 class="sub_tit">커뮤니티</h2>
				
				<div class="filter_wrap">
				    <ul class="ck_btn">
				        <li>
				            <input type="checkbox" id="ft01" class="n_ck" ${search.category == 'ALL' || search.category == null ? 'checked' : ''}>
				            
				            <label for="ft01" class="ft_btn" onclick="location.href='${pageContext.request.contextPath}/preuser/board/boardList.do?category=ALL'">ALL</label>
				        </li>
				        <li>
				            <input type="checkbox" id="ft02" class="n_ck" ${search.category == 'BEST' ? 'checked' : ''}>
				            <label for="ft02" class="ft_btn" onclick="location.href='${pageContext.request.contextPath}/preuser/board/boardList.do?category=BEST'">BEST</label>
				        </li>
				        <li>
				            <input type="checkbox" id="ft03" class="n_ck" ${search.category == '노하우' ? 'checked' : ''}>
				            <label for="ft03" class="ft_btn" onclick="location.href='${pageContext.request.contextPath}/preuser/board/boardList.do?category=노하우'">노하우</label>
				        </li>
				        <li>
				            <input type="checkbox" id="ft04" class="n_ck" ${search.category == '일상' ? 'checked' : ''}>
				            <label for="ft04" class="ft_btn" onclick="location.href='${pageContext.request.contextPath}/preuser/board/boardList.do?category=일상'">일상</label>
				        </li>
				        <li>
				            <input type="checkbox" id="ft05" class="n_ck" ${search.category == '질문하기' ? 'checked' : ''}>
				            <label for="ft05" class="ft_btn" onclick="location.href='${pageContext.request.contextPath}/preuser/board/boardList.do?category=질문하기'">질문하기</label>
				        </li>
				        <li>
				            <input type="checkbox" id="ft06" class="n_ck" ${search.category == '동행' ? 'checked' : ''}>
				            <label for="ft06" class="ft_btn" onclick="location.href='${pageContext.request.contextPath}/preuser/board/boardList.do?category=동행'">동행</label>
				        </li>
				        <li>
				            <input type="checkbox" id="ft07" class="n_ck" ${search.category == '공지' ? 'checked' : ''}>
				            <label for="ft07" class="ft_btn" onclick="location.href='${pageContext.request.contextPath}/preuser/board/boardList.do?category=공지'">공지</label>
				        </li>
				    </ul>
				</div>
				
				<div class="list_search">
				    <div class="list_wrap">
				        <label for="searchCondition" class="sr-only">검색조건 선택</label>
				        
				        <select id="searchCondition" name="searchCondition" class="searchCondition">
				            <option value="all" ${search.searchCondition == 'all' ? 'selected' : ''}>전체</option>
				            <option value="bbsTitle" ${search.searchCondition == 'bbsTitle' ? 'selected' : ''}>제목</option>
				            <option value="bbsCont" ${search.searchCondition == 'bbsCont' ? 'selected' : ''}>내용</option>
				        </select>
				        
				        <label for="searchKeyword" class="sr-only">검색어 입력</label>
				        
				        <input id="searchKeyword" name="searchKeyword" title="검색어 입력" placeholder="검색어를 입력하세요." class="info_in" type="text" value="${search.searchKeyword}">
				        
				        <a href="javascript:;" class="b_btn" title="검색버튼" onclick="fn_search_btn();">검색</a>
				    </div>
				
					<div class="my_ck">
					    <p class="checkbox">
					        <span>
					            <input type="checkbox" id="wrt" name="fix" value="wrt" onchange="fn_search('wrt');" ${search.myContent == 'wrt' ? 'checked' : ''}>
					            <label for="wrt">내글</label>
					        </span>
					    </p>
					    <p class="checkbox">
					        <span>
					            <input type="checkbox" id="cmt" name="fix" value="cmt" onchange="fn_search('cmt');" ${search.myContent == 'cmt' ? 'checked' : ''}>
					            <label for="cmt">내 댓글</label>
					        </span>
					    </p>
					    <a href="${pageContext.request.contextPath}/preuser/board/boardWrite.do" class="btn">글 작성</a>
					</div>
				</div>

			<table class="bbs_list">
				<caption><strong>커뮤니티</strong>로 NO, 제목, 첨부파일,  등록일</caption>
				<colgroup><col style="width:80px"><col style="width:auto"><col style="width:10%"><col style="width:12%"><col style="width:8%"><col style="width:8%"></colgroup>
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회</th>
						<th scope="col">좋아요</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${boardList}" var="board">
					<c:choose>
						<c:when test="${board.pstCate == '필독'}">
							<tr class="notice">
								<td class="num"><span class="mr">필독</span></td>
								<td class="tit"><a href="${pageContext.request.contextPath}/preuser/board/boardView.do?pstIdx=${board.pstIdx}"> ${board.pstTitle}</a>
									<c:choose>
										<c:when test="${board.pstCmtCnt > 999}">
											<span class="cmt">[999+]</span>
										</c:when>
										<c:when test="${board.pstCmtCnt == 0}">
											<span class="cmt"></span>
										</c:when>
										<c:otherwise>
											<span class="cmt">[${board.pstCmtCnt}]</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>관리자</td>
								<td class="date">${board.pstRegdate}</td>
								<td>${board.pstHit}</td>
								<td class="like">${board.pstLike}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="num"> ${board.pstCate} </td>
								<td class="tit"><a href="${pageContext.request.contextPath}/preuser/board/boardView.do?pstIdx=${board.pstIdx}"> ${board.pstTitle}</a>
									<c:choose>
										<c:when test="${board.pstCmtCnt > 999}">
											<span class="cmt">[999+]</span>
										</c:when>
										<c:when test="${board.pstCmtCnt == 0}">
											<span class="cmt"></span>
										</c:when>
										<c:otherwise>
											<span class="cmt">[${board.pstCmtCnt}]</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td><c:out value="${board.authorNickname}" default="관리자" /></td>
								<td class="date">${board.pstRegdate}</td>
								<td>${board.pstHit}</td>
								<td class="like">${board.pstLike}</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</tbody>
			</table>

			<div class="pagination">
			    <%-- paginationInfo 객체가 존재하고, 총 페이지가 1개 이상일 때만 표시 --%>
			    <c:if test="${not empty paginationInfo and paginationInfo.totalPageCount > 1}">
			    
			        <%-- [맨처음 페이지] 링크 --%>
			        <a href="javascript:void(0);" class="direction prev end" title="맨처음 페이지로 이동" onclick="fn_link_page(1);">맨처음 페이지로 이동</a>
			
			        <%-- [이전 페이지 목록] 링크 (이전 페이지 블록이 있을 경우에만 표시) --%>
			        <c:if test="${paginationInfo.hasPrevPage}">
			            <a href="javascript:void(0);" class="direction prev" title="이전 페이지로 이동" onclick="fn_link_page(${paginationInfo.firstPageNoOnPageList - 1});">이전 페이지로 이동</a>
			        </c:if>
			
			        <%-- [페이지 번호] 목록 --%>
			        <c:forEach var="i" begin="${paginationInfo.firstPageNoOnPageList}" end="${paginationInfo.lastPageNoOnPageList}">
			            <c:choose>
			                <%-- 현재 페이지일 경우 --%>
			                <c:when test="${i == paginationInfo.currentPageNo}">
			                    <a href="javascript:void(0);" class="on" title="현재 페이지">${i}</a>
			                </c:when>
			                <%-- 다른 페이지일 경우 --%>
			                <c:otherwise>
			                    <a href="javascript:void(0);" onclick="fn_link_page(${i});">${i}</a>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
			
			        <%-- [다음 페이지 목록] 링크 (다음 페이지 블록이 있을 경우에만 표시) --%>
			        <c:if test="${paginationInfo.hasNextPage}">
			            <a href="javascript:void(0);" class="direction next" title="다음 페이지로 이동" onclick="fn_link_page(${paginationInfo.lastPageNoOnPageList + 1});">다음 페이지로 이동</a>
			        </c:if>
			
			        <%-- [맨끝 페이지] 링크 --%>
			        <a href="javascript:void(0);" class="direction next end" title="맨끝 페이지로 이동" onclick="fn_link_page(${paginationInfo.totalPageCount});">맨끝 페이지로 이동</a>
			    </c:if>
			</div>


			</div>
		</div><!-- s_cont -->
	</div><!-- sub_content -->


<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>
</html>


<!-- 이건 대부분 공통으로 사용되는 양식임, 사용하세요! -->