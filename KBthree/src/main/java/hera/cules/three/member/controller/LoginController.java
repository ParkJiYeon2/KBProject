package hera.cules.three.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hera.cules.three.member.dto.MemberDTO;
import hera.cules.three.member.service.MemberService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
private MemberService memberService;
	@RequestMapping(value = "LoginMain")
	public String loginmain() {
		return "./login/login_main";
	}
@RequestMapping(value = "LoginCheck", method = RequestMethod.POST)
public String logincheck(MemberDTO memberDTO, HttpServletRequest request, Model model) {
	MemberDTO logincheck = memberService.logincheck(memberDTO, request);
	logger.info("logincheck", logincheck);
	if (logincheck == null) {
		return "./login/login_error";
	}else {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("id", memberDTO.getId());
		logger.info("memberDTO", httpSession);
		
		return "./counseling/main";
	}
}
@RequestMapping(value = "Logout")
public String logout(HttpSession httpsession) {
	httpsession.invalidate();
	return "./login/logout";
}

@RequestMapping(value = "idsearch")
public String idsearch(){
	return "./login/id_search";
}
@RequestMapping(value = "idsearchview", method = RequestMethod.POST)
public String idsearchview(MemberDTO memberDTO, Model model) {
	model.addAttribute("memberDTO", memberService.idsearch(memberDTO));
	return "./login/id_search_view";
}
@RequestMapping(value = "passwordsearch")
public String passwordsearch(){
	return "./login/password_search";
}
@RequestMapping(value = "passwordsearchview", method = RequestMethod.POST)
public String passwordsearchview(MemberDTO memberDTO, Model model) {
	model.addAttribute("memberDTO", memberService.passwordsearch(memberDTO));
	return "./login/password_search_view";
}

}
