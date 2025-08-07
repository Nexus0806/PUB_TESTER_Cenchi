
package egovframework.pubtest.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import egovframework.pubtest.service.UserService;
import egovframework.pubtest.service.UserVO;

@Controller
public class UserController {

    @Resource(name = "userService")
    private UserService userService;

    // 회원가입 폼 이동
    @GetMapping("/join.do")
    public String joinForm() {
        return "join";
    }

    // 회원가입 처리
    @PostMapping("/join.do")
    public String join(UserVO vo) {
        userService.insertMember(vo);
        return "redirect:/login.do";
    }

    // 로그인 폼 이동
    @GetMapping("/login.do")
    public String loginForm() {
        return "login";
    }

    // 로그인 처리
    @PostMapping("/login.do")
    public String login(UserVO vo, Model model) {
        UserVO loginUser = userService.login(vo);
        if (loginUser != null) {
            model.addAttribute("user", loginUser);
            return "main";
        } else {
            model.addAttribute("error", "로그인 실패");
            return "login";
        }
    }

    // 체험단 목록
    @RequestMapping("/experienceList.do")
    public String list(Model model) {
        List<UserVO> list = userService.selectExperienceList();
        model.addAttribute("list", list);
        return "list";
    }

    // 체험단 상세
    @RequestMapping("/experienceView.do")
    public String view(@RequestParam("expId") String expId, Model model) {
        UserVO vo = userService.selectExperienceDetail(expId);
        model.addAttribute("vo", vo);
        return "view";
    }
}
