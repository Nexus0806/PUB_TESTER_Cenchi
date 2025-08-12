package egovframework.pubtest.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class PubTestUtil {
	
	// DB 에서 datetime 을 불러오는데 문제가 있어 String 으로 받은 후, LocalDateTime 으로 파싱
	
	public static long calcDday(String dateStr) { // D-Day 계산 함수
				LocalDateTime dateTime = LocalDateTime.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				LocalDate start = dateTime.toLocalDate();
				LocalDate today = LocalDate.now();
				return ChronoUnit.DAYS.between(today, start);
	}
	
	public static String datetimeToTime(String dateStr) { // date을 time 데이터만 남도록 변환 (date time)
		
	       LocalDateTime dateTime = LocalDateTime.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	       DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	       return dateTime.format(timeFormatter);
	}
	
	public static String removeYearAndTimeFromDateTime(String dateStr) {
	    DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    LocalDateTime dateTime = LocalDateTime.parse(dateStr, inputFormatter);
	    DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("MM-dd");
	        
	    return dateTime.format(outputFormatter);
	}
	   
    public static String datetimeToDate(String dateStr) {
        // 입력값이 null이거나 비어있으면 그대로 null 반환
        if (dateStr == null || dateStr.trim().isEmpty()) {
            return null;
        }
        
        try {
            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime dateTime = LocalDateTime.parse(dateStr, inputFormatter);
            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            return dateTime.format(outputFormatter);
        } catch (Exception e) {
            // 혹시 모를 포맷 에러에 대비
            return null;
        }
    }
}

