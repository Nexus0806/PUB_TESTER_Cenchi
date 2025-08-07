package egovframework.pubtest.main.web;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.pubtest.main.service.PubTesterMainService;
import egovframework.pubtest.main.service.PubTesterMainVO;

@Controller
public class PubTesterMainController {

    @Resource(name = "pubTesterMainService")
    private PubTesterMainService pubTesterMainService;
	
	@RequestMapping(value = "/index.do")
    public String loadMain(Model model) throws Exception {
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		List<PubTesterMainVO> vo = pubTesterMainService.getPopularCampaign();
		
		// localdate 이용하여 체험단까지 남은 D-Day 계산
		for(PubTesterMainVO row : vo)
		{			
			if(row.getCampStartDate() != null)
			{
				// DB 에서 datetime 을 불러오는데 문제가 있어 String 으로 받은 후, LocalDateTime 으로 파싱
				LocalDateTime dateStr = LocalDateTime.parse(row.getCampStartDate(),
															DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				LocalDate start = dateStr.toLocalDate();
				LocalDate today = LocalDate.now();
				long dDay = ChronoUnit.DAYS.between(today, start);
				row.setdDay(dDay);
			}
		}
		
		model.addAttribute("popCampList",vo);

        return "/index";
    }
}
