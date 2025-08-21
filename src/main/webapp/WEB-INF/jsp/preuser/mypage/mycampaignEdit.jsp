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
        <div class="cont_all">
            <%-- 1. form 태그로 전체를 감쌉니다. --%>
            <form name="submitForm" method="post" action="${pageContext.request.contextPath}/preuser/mypage/mycampaignEdit.do">
                
                <%-- ================================================================= --%>
                <%-- 2. 서버로부터 받은 campIdx, userIdx를 숨겨서 전송합니다. --%>
                <%-- 이 값들은 이 페이지를 보여주는 GET 방식 컨트롤러에서 model.addAttribute로 전달해야 합니다. --%>
                <input type="hidden" name="campIdx" value="${campVo.campIdx}">
                <input type="hidden" name="sumIdx" value="${submitInfo.sumIdx}">
                <%-- ================================================================= --%>
                
                <div class="View_wrap">
                    <div class="View_con">
                        <div class="View_top mb40">
                            <p class="v_tit">신청 내역 수정</p>
                        </div>

                        <div class="apply_wrap mb30">
                            <%-- 3. VO 필드명에 맞춰 name="sumCont" 지정 --%>
                            <textarea name="sumCont" rows="5" placeholder="내용 입력"><c:out value="${submitInfo.sumCont}"></c:out></textarea>
                        </div>

                        <div class="apply_wrap">
                            <h4>주소</h4>
                            <div class="add_wrap">
                                <%-- 주소 필드들에는 id만 부여해서 자바스크립트가 값을 읽을 수 있도록 합니다. --%>
                                <input id="zipCode" name="zipCode" placeholder="우편번호..." type="text" readonly
                                value="${submitInfo.zipCode}">
                                <a href="#none" class="btn a bk" onclick="openDaumPostcode()">우편번호 찾기</a>
                            </div>
                            <input id="address1" class="mt5" placeholder="기본 주소..." type="text" readonly
                            value="${addr1}">
                            <input id="address2" class="mt5" placeholder="상세 주소" type="text"
                            value="${addr2}">
                            <%-- 3개의 주소 값을 합쳐서 전송할 숨겨진 input. name="sumAddress" 지정 --%>
                            <input type="hidden" name="sumAddress" id="sumAddress">
                        </div>
                    </div>

					<div class="View_info">
                        <p class="sn_img mb20" style="background: url(${pageContext.request.contextPath}/_img/pc/main/${campVo.campThub})no-repeat 50% 50% / cover;"></p> 		
						<c:choose>
							<c:when test="${campVo.campAdType eq '틱톡'}">
								<p class="sns_txt sns_tik">${campVo.campType}</p>
							</c:when>
							<c:when test="${campVo.campAdType eq '클립' or campVo.campAdType eq '구매형'}">
								<p class="sns_txt sns_etc">${campVo.campType}</p>
							</c:when>
							<c:when test="${campVo.campAdType eq '인스타그램' or campVo.campAdType eq '릴스'}">
								<p class="sns_txt sns_inst">${campVo.campType}</p>
							</c:when>
							<c:when test="${campVo.campAdType eq '유튜브'}">
								<p class="sns_txt sns_yout">${campVo.campType}</p>
							</c:when>
							<c:when test="${campVo.campAdType eq '블로그' or campVo.campAdType eq '블로그+클립'}">
								<p class="sns_txt sns_blog">${campVo.campType}</p>
							</c:when>
						</c:choose>
						<div class="prd_txt">
							<strong>${campVo.campTitle}</strong>
							<p>${campVo.campService}</p>
						</div><!-- prd_txt -->
						<div class="prd_rec">
							<c:choose>
								<c:when test="${campVo.dDay eq 0}">
									<span class="p_date p_day">D-Day</span>
								</c:when>
								<c:when test="${campVo.dDay lt 0}">
									<span class="p_date p_close">모집 마감</span>
								</c:when>
								<c:otherwise>
									<span class="p_date">${campVo.dDay}일 남음</span>
								</c:otherwise>
								</c:choose>
							<ul class="rec_app">
								<li class="tt">신청 <b>${campVo.campSumCount}</b>명</li>
								<li> / 모집 <em>${campVo.campRecruite}</em>명</li>
							</ul>
						</div><!-- prd_rec -->
						<div class="btn_wrap mt30">
    						<button type="submit" id="submitBtn" class="btn" style="width:100%;">수정하기</button>
						</div>
					</div><!-- View_info -->
                </div>
            </form>
        </div>
    </div>
</div>

<%-- 카카오 우편번호 검색 서비스 --%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
function openDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 도로명/지번 주소 중 선택된 타입에 따라 주소 결정
      var addr = '';        // 기본주소
      var extraAddr = '';   // 참고항목(법정동, 건물명 등)

      if (data.userSelectedType === 'R') { // 도로명
        addr = data.roadAddress;

        // 법정동/건물명 등 참고항목 조합
        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
          extraAddr += data.bname;
        }
        if (data.buildingName !== '' && data.apartment === 'Y') {
          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        if (extraAddr !== '') {
          addr += ' ' + extraAddr;
        }
      } else { // 지번
        addr = data.jibunAddress;
      }

      // 입력 필드에 채우기
      document.getElementById('zipCode').value  = data.zonecode; // 새 우편번호(5자리)
      document.getElementById('address1').value = addr;
      // 커서는 상세주소로
      var detail = document.getElementById('address2');
      detail.focus();

      // 이미 만들어둔 fullAddress(hidden)는 submit 직전에 JS로 합치므로 여기선 건드리지 않아도 됩니다.
      // 만약 즉시 합치고 싶다면 아래 주석 해제:
      // document.getElementById('sumAddress').value = '[' + data.zonecode + '] ' + addr + ' ' + detail.value;
    },
    // 모바일 등에서 화면 꽉 차게 사용하고 싶으면 width/height 옵션 생략(기본 팝업)
  }).open();
}
</script>

<script>
$(document).ready(function() {
    // '신청하기' 버튼을 클릭했을 때의 동작
    $('#submitBtn').on('click', function(event) {
        
        // 유효성 검사를 모두 통과한 경우, 주소 필드를 하나로 합칩니다.
        const zipCode = $('#zipCode').val();
        const address1 = $('#address1').val();
        const address2 = $('#address2').val();
        
        // 예시: [12345] 서울시 강남구 테헤란로 (상세주소)
        const fullAddress = address1 + ' ' + address2;
        
        // 합쳐진 주소 값을 숨겨진 input(#sumAddress)에 넣어줍니다.
        $('#sumAddress').val(fullAddress);

        // 이제 폼이 정상적으로 서버에 전송됩니다.
        alert('신청서가 제출됩니다.');
    });
});
</script>

	<jsp:include page="/WEB-INF/jsp/_inc/footer.jsp" />
</body>

</html>
