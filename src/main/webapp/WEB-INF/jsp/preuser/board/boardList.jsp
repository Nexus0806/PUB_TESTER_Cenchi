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
			<jsp:include page="/WEB-INF/jsp/_inc/sideMenu.jsp" />
			
			<div class="cont right">
				<h2 class="sub_tit">커뮤니티</h2>

				<div class="filter_wrap">
					<ul class="ck_btn">
						<li>
							<input type="checkbox" id="ft01" class="n_ck" checked>
							<label for="ft01" class="ft_btn">ALL</label>
						</li>
						<li>
							<input type="checkbox" id="ft02" class="n_ck">
							<label for="ft02" class="ft_btn">BEST</label>
						</li>
						<li>
							<input type="checkbox" id="ft03" class="n_ck">
							<label for="ft03" class="ft_btn">노하우</label>
						</li>
						<li>
							<input type="checkbox" id="ft04" class="n_ck">
							<label for="ft04" class="ft_btn">일상</label>
						</li>
						<li>
							<input type="checkbox" id="ft05" class="n_ck">
							<label for="ft05" class="ft_btn">질문하기</label>
						</li>
						<li>
							<input type="checkbox" id="ft06" class="n_ck">
							<label for="ft06" class="ft_btn">동행</label>
						</li>
						<li>
							<input type="checkbox" id="ft07" class="n_ck">
							<label for="ft07" class="ft_btn">공지</label>
						</li>
					</ul>

				</div><!-- filter_wrap -->

				<div class="list_search">
					<div class="list_wrap">
						<label for="searchCondition" class="sr-only">검색조건 선택</label>
						<select id="searchCondition" name="searchCondition" class="searchCondition">
							<option value="all">전체</option>
							<option value="bbsTitle">제목</option>
							<option value="bbsCont">내용</option>
						</select>
						<label for="searchKeyword" class="sr-only">검색어 입력</label>
						<input id="searchKeyword" name="searchKeyword" title="검색어 입력" placeholder="검색어를 입력하세요." class="info_in" type="text" value="">
						<a href="javascript:;" class="b_btn" title="검색버튼" onclick="submit('', 1);">검색</a>
					</div>

					<div class="my_ck">
						<p class="checkbox">
							<span>
								<input type="checkbox" id="wrt" name="fix" value="wrt">
								<label for="wrt">내글</label>
							</span>
						</p>
						<p class="checkbox">
							<span>
								<input type="checkbox" id="cmt" name="fix" value="cmt">
								<label for="cmt">내 댓글</label>
							</span>
						</p>
						<a href="boardWrite.html" class="btn">글 작성</a>
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
											<span class="cmt">${board.pstCmtCnt}</span>
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

			<p class="pagination">
				<a href="#" class="direction prev end" title="맨처음 페이지로 이동" onclick="fnLinkPage(1); ">맨처음 페이지로 이동</a>
				<a href="#" class="direction prev" title="이전 페이지로 이동" onclick="fnLinkPage(1); ">이전 페이지로 이동</a>
				<a href="javascript:void(0);" class="on" title="현재 페이지">1</a>
				<a href="javascript:void(0);" onclick="fnLinkPage(2);">2</a>
				<a href="javascript:void(0);" onclick="fnLinkPage(3);">3</a>
				<a href="javascript:void(0);" onclick="fnLinkPage(4);">4</a>
				<a href="javascript:void(0);" onclick="fnLinkPage(5);">5</a>
				<a href="javascript:void(0);" onclick="fnLinkPage(6);">6</a>
				<a href="javascript:void(0);" onclick="fnLinkPage(7);">7</a>
				<a href="javascript:void(0);" onclick="fnLinkPage(8);">8</a>
				<a href="javascript:void(0);" onclick="fnLinkPage(9);">9</a>
				<a href="javascript:void(0);" onclick="fnLinkPage(10);">10</a>
				<a href="#" class="direction next" title="다음 페이지로 이동" onclick="fnLinkPage(11); ">다음 페이지로 이동</a>
				<a href="#" class="direction next end" title="맨끝 페이지로 이동" onclick="fnLinkPage(121); ">맨끝 페이지로 이동</a>
			</p>


			</div>
		</div><!-- s_cont -->
	</div><!-- sub_content -->


<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>
</html>


<!-- 이건 대부분 공통으로 사용되는 양식임, 사용하세요! -->