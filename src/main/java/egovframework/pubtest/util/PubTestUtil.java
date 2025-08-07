package egovframework.pubtest.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class PubTestUtil {
	
	public static long calcDday(String dateStr) {
				// DB 에서 datetime 을 불러오는데 문제가 있어 String 으로 받은 후, LocalDateTime 으로 파싱
				LocalDateTime dateTime = LocalDateTime.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				LocalDate start = dateTime.toLocalDate();
				LocalDate today = LocalDate.now();
				return ChronoUnit.DAYS.between(today, start);
	}
}

