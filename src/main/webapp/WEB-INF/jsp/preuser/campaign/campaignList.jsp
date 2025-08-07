<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>캠페인 리스트</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #fff;
            padding: 30px;
        }

        .campaign-wrapper {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .campaign-card {
            width: 200px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            overflow: hidden;
            background-color: #f9f9f9;
            transition: transform 0.3s;
        }

        .campaign-card:hover {
            transform: translateY(-5px);
        }

        .campaign-thumb img {
            width: 100%;
            height: 140px;
            object-fit: cover;
        }

        .campaign-body {
            padding: 10px;
        }

        .campaign-type {
            font-size: 12px;
            color: gray;
            margin-bottom: 5px;
        }

        .campaign-title {
            font-weight: bold;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .campaign-desc {
            font-size: 13px;
            color: #444;
            margin-bottom: 8px;
        }

        .campaign-meta {
            font-size: 12px;
            color: #777;
            display: flex;
            justify-content: space-between;
        }

        .badge {
            background: #eee;
            border-radius: 5px;
            padding: 2px 6px;
            font-size: 11px;
            color: #333;
        }
    </style>
</head>
<body>

    <h2>프리미엄 체험단</h2>

    <div class="campaign-wrapper">
        <c:forEach var="campaign" items="${campaignList}">
            <div class="campaign-card">
                <div class="campaign-thumb">
                    <img src="${campaign.campThub}" alt="${campaign.campTitle}">
                </div>
                <div class="campaign-body">
                    <div class="campaign-type">${campaign.campType}</div>
                    <div class="campaign-title">${campaign.campTitle}</div>
                    <div class="campaign-desc">${campaign.campService}</div>
                    <div class="campaign-meta">
                        <span class="badge">
                            <c:choose>
                                <c:when test="${campaign.campStartdate == today}">
                                    D-Day
                                </c:when>
                                <c:otherwise>
                                    <fmt:parseDate value="${campaign.campEnddate}" var="endDate" pattern="yyyy-MM-dd"/>
                                    <fmt:formatDate value="${endDate}" pattern="MM/dd"/>
                                </c:otherwise>
                            </c:choose>
                        </span>
                        <span class="badge">신청 ${campaign.campHit}명 / 모집 ${campaign.campRecruite}명</span>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>
