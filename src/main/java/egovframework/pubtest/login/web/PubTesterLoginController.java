package egovframework.pubtest.login.web;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.pubtest.login.service.JoinFormDTO;
import egovframework.pubtest.login.service.PubTesterLoginService;
import egovframework.pubtest.login.service.UserRegVO;

@Controller
@RequestMapping("/preuser/member")
public class PubTesterLoginController {

	@Resource(name = "loginService")
	private PubTesterLoginService pubTesterLoginService;
	
	@GetMapping("login.do")
	public String infLogin(@CookieValue(value="savedID", required=false) String savedID,
							Model model){
		model.addAttribute("savedID", savedID);
		return "preuser/member/login";
	}
	
	@PostMapping("login.do")
	public String infLoginChk(@RequestParam("type") String type,
								@RequestParam("loginId") String id,
								@RequestParam("loginPass") String pw,
								@RequestParam(value="save_id", required=false) String saveIDChk,
								Model model){

		Map<String, Object> idpw = new HashMap<>();
		idpw.put("type", type);
		idpw.put("id", id);
		idpw.put("pw", pw);
		
		pubTesterLoginService.chklogin(idpw);
		
		return "preuser/member/login";
	}
	
	@GetMapping("join.do")
	public String signin(@RequestParam("type") String type, Model model){
		
		model.addAttribute("userType", type); // 사용자 회원가입 유형 (inf, bss)
		model.addAttribute("joinForm", new JoinFormDTO()); // 폼 바인딩 객체?
		return "preuser/member/join";
	}
	
	@PostMapping("join.do")
	public String userReg(@Valid @ModelAttribute JoinFormDTO form,
							BindingResult binding,
							Model model,
							RedirectAttributes ra){
		 // ★ 바인딩된 DTO 스냅샷 (비번 마스킹)
//	    System.err.printf("[form] userType=%s, email=%s@%s, name=%s, phone=%s-%s-%s, birth=%s, gender=%s%n",
//	            form.getUserType(), form.getMbEmail1(), form.getMbEmail2(), form.getMbName(),
//	            form.getCall1(), form.getCall2(), form.getCall3(), form.getBirthDate(), form.getGender());
	    
		// 비어있는 값 체크, DTO 에서 채널 정보를 입력했는지 체크 했을때도 여기로 옴
		if(binding.hasErrors()) {
			model.addAttribute("userType", form.getUserType()); 
			model.addAttribute("joinForm", form);
			return "preuser/member/join"; // 검증에 실패하면 원래 페이지로 되돌려보냄
		}
		
		// 비밀번호 검증
		if(!form.getPassword().equals(form.getPassword_Chk())) {
			model.addAttribute("userType", form.getUserType());
			model.addAttribute("joinForm", form);
			model.addAttribute("pwError", "비밀번호가 일치하지 않습니다.");
			return "preuser/member/join";
		}
		
		// 약관동의 체크
		if(form.getPrivacy1() == null || form.getPrivacy2() == null) {
			model.addAttribute("userType", form.getUserType());
			model.addAttribute("joinForm", form);
			model.addAttribute("agreeError", "필수 약관에 동의가 필요합니다.");
			return "preuser/member/join";
		}
		
		// DB 저장용 객체
		UserRegVO vo = new UserRegVO();
		// 이메일, 전화번호 정보 취합
		String email = form.getMbEmail1() + "@" + form.getMbEmail2();
		String phone = form.getCall1() + "-" + form.getCall2() + "-" + form.getCall3();
		LocalDate birth = LocalDate.parse(form.getBirthDate());
		
		vo.setUserEmail(email);
		vo.setUserPW(form.getPassword());
		vo.setUserName(form.getMbName());
		vo.setUserPhone(phone);
		vo.setUserBirth(birth);
		vo.setUserGender(form.getGender());
		vo.setUserBlog(form.getUrl_Blog());
		vo.setUserInsta(form.getUrl_Insta());
		vo.setUserYoutube(form.getUrl_Youtube());
		vo.setUserTiktok(form.getUrl_Tiktok());
		vo.setUserETC(form.getUrl_ETC());
		
		pubTesterLoginService.regUser(form.getUserType(), vo);
		
		ra.addFlashAttribute("joinSuccess", true);
		return "redirect:/preuser/member/login.do"; // 임시
	}
	
	@PostMapping("email-check.do")
	public String emailCheck(@ModelAttribute JoinFormDTO form, Model model) {
		String email = form.getMbEmail1() + "@" + form.getMbEmail2();
		boolean able = pubTesterLoginService.chkEmail(form.getUserType(), email);
		
	    System.err.printf("[form] userType=%s, email=%s@%s,",
        form.getUserType(), form.getMbEmail1(), form.getMbEmail2());
		
		model.addAttribute("userType",form.getUserType());
		model.addAttribute("joinForm", form);
		model.addAttribute("emailMsg", able ? "이미 사용중인 이메일입니다." : "사용가능한 이메일입니다.");
		
		return "preuser/member/join";
	}
	
	
}
