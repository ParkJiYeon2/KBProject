package hera.cules.three.member.controller;






import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hera.cules.three.member.dto.MemberDTO;
import hera.cules.three.member.service.MemberService;
import hera.cules.three.soo.dto.Criteria;
import hera.cules.three.soo.dto.PageMaker;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private HttpServletRequest request;
	
	//회원 전체 조회 , 총 갯수 구하기 , 페이징 처리
	@RequestMapping(value = "/MemberSelect", method = RequestMethod.GET)
	public String list(Model model, Criteria criteria) {
		request.getParameter("id");
		model.addAttribute("list", memberService.memberSelectAll(criteria));
		model.addAttribute("count", memberService.count());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(memberService.listcount());
		model.addAttribute("pageMaker", pageMaker);
		logger.info("list", model);
		return "./member/member_select_all_view";
	}

	//회원 상세 조회
	@RequestMapping(value = "/MemberSelectDetail", method = RequestMethod.GET)
	public String detail(Model model, MemberDTO memberDTO) {
		request.getParameter("id");
		model.addAttribute("memberDTO", memberService.memberSelect(memberDTO.getId( )));
		return "./member/member_select_detail_view";
	}

	//회원 가입
	@RequestMapping(value = "/MemberInsert", method = RequestMethod.GET)
	public String insert( ) {
		request.getParameter("id");
		return "./member/member_insert";
	}
	//회원 가입
	@RequestMapping(value = "/MemberInsert", method = RequestMethod.POST)
	// 모델의 이름으로 프로퍼티값을 자동으로 뷰까지 전달하여 뷰에서 출력하고 @ModelAttribute 어노테이션은 생략한다.
	public String insert(MemberDTO memberDTO, Model model) {

		request.getParameter("id");
		model.addAttribute("list", memberService.memberSelectAll(null));
		memberService.memberInsert(memberDTO);
		return "./counseling/member_insert_view";
	}

	//회원 수정
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.GET)
	// 뷰에 전달할 오브젝트 정보를 저장하고 오브젝트를 반환하는 메소드를 선언한다.
	public String update(Model model, MemberDTO memberDTO) {
		request.getParameter("id");
		model.addAttribute("memberDTO", memberService.memberSelect(memberDTO.getId( )));
		return "./member/member_update";
	}

	//회원 수정
	@RequestMapping(value = "/MemberUpdate")
	public String update(MemberDTO memberDTO) {
		request.getParameter("id");
		memberService.memberUpdate(memberDTO);
		return "./member/member_update_view";
	}

	//회원 탈퇴
	@RequestMapping(value = "/MemberDelete", method = RequestMethod.GET)
	public String delete(MemberDTO memberDTO) {
		request.getParameter("id");
		memberService.memberDelete(memberDTO.getId( ));
		return "./member/member_delete";
	}
	
	//비밀번호 수정
	@RequestMapping(value = "/PassUpdate")
	public String passupdate(MemberDTO memberDTO, Model model) {
		request.getParameter("id");
		model.addAttribute("memberDTO", memberService.memberSelect(memberDTO.getId()));
		return "./member/pass_update";
	}
	//비밀번호 수정 뷰
	@RequestMapping(value = "/PassUpdateView", method = RequestMethod.POST)
	public String passupdateview(MemberDTO memberDTO) {
		request.getParameter("id");
		memberService.passupdate(memberDTO);
		return "./member/pass_update_view";
		
	}
	// 오류 페이지

	@ExceptionHandler(RuntimeException.class)

	public String exceptionHandler(Model model, Exception e) {

		model.addAttribute("exception", e);

		return "./member/error";

	}
}
