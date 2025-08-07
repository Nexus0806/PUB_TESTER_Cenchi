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
import egovframework.pubtest.util.PubTestUtil;

@Controller
public class PubTesterMainController {

    @Resource(name = "pubTesterMainService")
    private PubTesterMainService pubTesterMainService;
	
	@RequestMapping(value = "/index.do")
    public String loadMain(Model model) throws Exception {
		List<PubTesterMainVO> popList = pubTesterMainService.getPopularCampaign();
		for(PubTesterMainVO row : popList)
		{			
			if(row.getCampStartDate() != null)
			{
				// localdate 이용하여 체험단까지 남은 D-Day 계산
				long dDay = PubTestUtil.calcDday(row.getCampStartDate());
				row.setdDay(dDay);
			}
		}
		
		List<PubTesterMainVO> newList = pubTesterMainService.getNewCampaign();
		for(PubTesterMainVO row : newList)
		{			
			if(row.getCampStartDate() != null)
			{
				long dDay = PubTestUtil.calcDday(row.getCampStartDate());
				row.setdDay(dDay);
			}
		}
		
		List<PubTesterMainVO> deadList = pubTesterMainService.getDeadlineCampaign();
		for(PubTesterMainVO row : deadList)
		{			
			if(row.getCampStartDate() != null)
			{
				long dDay = PubTestUtil.calcDday(row.getCampStartDate());
				row.setdDay(dDay);
			}
		}
		
		model.addAttribute("popCampList",popList);
		model.addAttribute("newCampList",newList);
		model.addAttribute("deadCampList",deadList);
        return "/index";
    }
}
