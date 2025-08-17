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
		// 폼 제출 시 실행될 함수
		function validateForm() {
			const form = document.getElementById("writeForm");
			
			// 1. 카테고리 선택 여부 확인
			if (form.pstCate.value === "") {
				alert("카테고리를 선택해주세요.");
				form.pstCate.focus();
				return false; // 폼 제출 중단
			}
			
			// 2. 제목 입력 여부 확인
			if (form.pstTitle.value.trim() === "") {
				alert("제목을 입력해주세요.");
				form.pstTitle.focus();
				return false; // 폼 제출 중단
			}
			
			// 3. 내용 입력 여부 확인
			if (form.pstCont.value.trim() === "") {
				alert("내용을 입력해주세요.");
				form.pstCont.focus();
				return false; // 폼 제출 중단
			}
			
			// 모든 검사를 통과하면 true를 반환하여 폼 제출 진행
			return true; 
		}
	</script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/_inc/header.jsp" />

<script src="${pageContext.request.contextPath}/_js/ui.js"></script>

<div id="sub_content">
	<div class="s_cont">
		
		<%-- 사이드 메뉴 Include --%>
		<jsp:include page="/WEB-INF/jsp/_inc/sideMenu.jsp" />

		<div class="cont right">
			<h2 class="sub_tit">게시글 작성</h2>
			
			<form id="writeForm" action="${pageContext.request.contextPath}/preuser/board/addBoard.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
				<div class="write_wrap">
					<h4 class="mt30">제목</h4>
					<div class="sel tit_flex">
						<label class="sr-only">카테고리</label>
						<select name="pstCate">
							<option value="">카테고리 선택</option>
							<option value="노하우">노하우</option>
							<option value="일상">일상</option>
							<option value="질문하기">질문하기</option>
							<option value="동행">동행</option>
						</select>
						
						<input type="text" name="pstTitle" class="wt_tit" placeholder="제목을 입력해주세요.">
					</div>

					<h4 class="mt30">내용</h4>
					<textarea name="pstCont" style="width: 100%; height: 350px; padding: 15px; border-radius: 10px; border: 1px solid #ddd; resize: vertical;" placeholder="내용을 입력해주세요."></textarea>

					<h4 class="mt30">파일업로드</h4>
					<div class="filebox">
						<input type="file" name="pstImg" id="file" class="sr-only">
						<label for="file"><span></span>클릭하거나 드래그/드롭 해주세요. 5MB 이하의 JPEG, PNG 파일</label>
					</div>

					<div class="btn_wrap ct mt40">
						<button type="submit" class="btn ct">등록하기</button>
						
						<a href="${pageContext.request.contextPath}/preuser/board/boardList.do" class="btn ct bk_line">목록으로</a>
					</div>
				</div></form>
		</div></div></div>
		<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />

</body>
</html>

