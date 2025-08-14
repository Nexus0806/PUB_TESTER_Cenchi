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
            <form name="submitForm" method="post" action="${pageContext.request.contextPath}/preuser/campaign/campaignSubmit.do">
                
                <%-- ================================================================= --%>
                <%-- 2. 서버로부터 받은 campIdx, userIdx를 숨겨서 전송합니다. --%>
                <%-- 이 값들은 이 페이지를 보여주는 GET 방식 컨트롤러에서 model.addAttribute로 전달해야 합니다. --%>
                <input type="hidden" name="campIdx" value="${campVo.campIdx}">
                <%-- ================================================================= --%>
                
                <div class="View_wrap">
                    <div class="View_con">
                        <div class="View_top mb40">
                            <p class="v_tit">체험단 신청</p>
                        </div>

                        <div class="apply_wrap mb30">
                            <h4>신청 한마디 <span>(선택)</span></h4>
                            <p class="mb10">신청 시 광고주가 참고할 수 있는 내용이 있다면 작성해 주세요.</p>
                            <%-- 3. VO 필드명에 맞춰 name="sumCont" 지정 --%>
                            <textarea name="sumCont" rows="5" placeholder="내용 입력"></textarea>
                        </div>

                        <div class="apply_wrap">
                            <h4>주소</h4>
                            <div class="add_wrap">
                                <%-- 주소 필드들에는 id만 부여해서 자바스크립트가 값을 읽을 수 있도록 합니다. --%>
                                <input id="zipcode" placeholder="우편번호..." type="text" readonly>
                                <a href="#none" class="btn a bk" onclick="openDaumPostcode()">우편번호 찾기</a>
                            </div>
                            <input id="address1" class="mt5" placeholder="기본 주소..." type="text" readonly>
                            <input id="address2" class="mt5" placeholder="상세 주소" type="text">
                            
                            <%-- 3개의 주소 값을 합쳐서 전송할 숨겨진 input. name="sumAddress" 지정 --%>
                            <input type="hidden" name="sumAddress" id="sumAddress">
                        </div>
                    </div>

                    <div class="View_info">
                        <p class="sn_img mb20" style="background: url(${pageContext.request.contextPath}/_img/pc/main/${campVo.campThub})no-repeat 50% 50% / cover;"></p> 		
                        <div class="sche">
                            <p class="sche_tit">${campVo.campTitle}</p>
                            <%-- ... 캠페인 정보 표시 ... --%>

                            <div class="prv_wrap mt20">
                                <p class="checkbox">
                                    <span>
                                        <input type="checkbox" id="prv01" name="privacy" value="prv01">
                                        <label for="prv01">체험단 유의사항, 개인정보 및 콘텐츠 제3자 제공, 저작물 이용에 동의합니다.</label>
                                    </span>
                                </p>
                                <a href="javascript:void(0)" class="prv_cont" onclick="...">[자세히보기]</a>
                            </div>

                            <div class="prv_wrap mb20 mt10">
                                <p class="checkbox">
                                    <span>
                                        <input type="checkbox" id="prv02" name="privacy" value="prv02">
                                        <label for="prv02">체험단 미션을 모두 확인했습니다.</label>
                                    </span>
                                </p>
                                <a href="javascript:void(0)" class="prv_cont" onclick="...">[자세히보기]</a>
                            </div>

                            <div class="btn_wrap">
                                <%-- 4. a 링크를 button으로 변경하고 id를 부여합니다. --%>
                                <button type="submit" id="submitBtn" class="btn" style="width:100%;">신청하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    // '신청하기' 버튼을 클릭했을 때의 동작
    $('#submitBtn').on('click', function(event) {
        
        // 유효성 검사 1: 첫 번째 동의 체크
        if ($('#prv01').is(':checked') === false) {
            alert('체험단 유의사항, 개인정보 제공 등에 동의해주세요.');
            event.preventDefault(); // 폼 전송을 막습니다.
            return; 
        }
        
        // 유효성 검사 2: 두 번째 동의 체크
        if ($('#prv02').is(':checked') === false) {
            alert('체험단 미션을 모두 확인했는지 체크해주세요.');
            event.preventDefault(); // 폼 전송을 막습니다.
            return;
        }

        // 유효성 검사를 모두 통과한 경우, 주소 필드를 하나로 합칩니다.
        const zipcode = $('#zipcode').val();
        const address1 = $('#address1').val();
        const address2 = $('#address2').val();
        
        // 예시: [12345] 서울시 강남구 테헤란로 (상세주소)
        const fullAddress = '[' + zipcode + '] ' + address1 + ' ' + address2;
        
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
