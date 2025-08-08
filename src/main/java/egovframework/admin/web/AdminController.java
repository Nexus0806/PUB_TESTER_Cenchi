package egovframework.admin.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.admin.service.AdminService;
import egovframework.admin.service.InfUserVO;

@Controller
public class AdminController {

	@Resource(name = "adminService")
	private AdminService adminService;
	
	@GetMapping(value = "/admin/login.do")
	public String adminLogin(Model model)
	{
		
		return "/admin/login";
	}
	
	@PostMapping(value = "admin/logout")
	public String adminLogout(@RequestParam String adminID,
								@RequestParam String adminPW,
								Model model)
	{
		return "redirect:/admin/login.do";
	}
	
	@RequestMapping("/admin/infList.do")
	public String adminInfList(Model model)
	{
		List<InfUserVO> list = adminService.getInfUserList();
		int listCount = adminService.countInfUserList();

		model.addAttribute("infList", list);
		model.addAttribute("infListCnt", listCount);
		return "/admin/infList";
	}
}
