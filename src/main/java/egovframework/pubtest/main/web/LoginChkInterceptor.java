package egovframework.pubtest.main.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

// 로그인이 필요한 페이지에 접근하려고 할때 접근하려고 하는 대상이 로그인 된 상태인지 체크함
public class LoginChkInterceptor implements HandlerInterceptor {

	  @Override
	  public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		  HttpSession s = req.getSession(false);
		  Object loginUser = (s == null) ? null : s.getAttribute("LOGIN_USER");

		  if (loginUser != null) {	// 접근하려는 대상이 로그인 된 유저면
			  return true; // 통과
		  }
		  
		  // 로그인하지 않은 경우, 원래 가려던 주소 저장 (로그인 후 복귀용)
		  String uri = req.getRequestURI();
		  String qs  = req.getQueryString();
		  String dest = (qs == null) ? uri : (uri + "?" + qs);
		  req.getSession(true).setAttribute("REDIRECT_AFTER_LOGIN", dest);

		  // 로그인 페이지로 보내기
		  res.sendRedirect(req.getContextPath() + "/preuser/member/login.do");
		  return false;
	  }

}
