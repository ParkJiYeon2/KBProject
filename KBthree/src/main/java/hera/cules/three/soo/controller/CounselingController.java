package hera.cules.three.soo.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hera.cules.three.soo.dto.CounselingDTO;
import hera.cules.three.soo.dto.Criteria;
import hera.cules.three.soo.dto.PageMaker;
import hera.cules.three.soo.service.CounselingService;

@Controller
public class CounselingController {
	private static final Logger logger = LoggerFactory.getLogger(CounselingController.class);
	@Autowired
	private CounselingService counselingService;

	
	//전체 조회 , 총갯수 구하기 , 페이징처리
	@RequestMapping(value = "/CounselingSelect", method = RequestMethod.GET)
	public String list(Criteria criteria,Model model) {
		model.addAttribute("listcount", counselingService.counselingCount());
		model.addAttribute("list", counselingService.counselingSelectAll(criteria));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(counselingService.counselingCount());
		
		model.addAttribute("pageMaker", pageMaker);
		logger.info("list", model);
		return "./counseling/counseling_select_all_view";
	}

	
	//상세 조회
	@RequestMapping(value = "/CounselingSelectDetail", method = RequestMethod.GET)
	public String detail(Model model, CounselingDTO counselingDTO) {
		model.addAttribute("counselingDTO", counselingService.counselingSelect(counselingDTO.getNum()));
		return "./counseling/counseling_select_view";
	}

	
	//생성 겟
	@RequestMapping(value = "/CounselingInsert", method = RequestMethod.GET)
	public String insert() {
		return "./counseling/counseling_insert";
	}

	
	//생성 포스트
	@RequestMapping(value = "/CounselingInsert", method = RequestMethod.POST)
	public String insert(CounselingDTO counselingDTO, Model model) {
		counselingService.counselingInsert(counselingDTO);
		return "./counseling/counseling_insert_view";
	}

	//수정 겟
	@RequestMapping(value = "/CounselingUpdate", method = RequestMethod.GET)
	public String update(Model model, CounselingDTO counselingDTO) {
		model.addAttribute("counselingDTO", counselingService.counselingSelect(counselingDTO.getNum()));
		return "./counseling/counseling_update";
	}

	//수정 포스트
	@RequestMapping(value = "/CounselingUpdate", method = RequestMethod.POST)
	public String update(CounselingDTO counselingDTO) {
		counselingService.counselingUpdate(counselingDTO);
		return "./counseling/counseling_update_view";
	}

	//삭제
	@RequestMapping(value = "/CounselingDelete", method = RequestMethod.GET)
	public String delete(CounselingDTO counselingDTO) {
		counselingService.counselingDelete(counselingDTO.getNum());
		return "./counseling/counseling_delete";
	}
	
	//더미 데이터 생성 for 문
	@RequestMapping(value = "/dummy", method = RequestMethod.GET)
	public String dummy() {
		for (int i = 2; i < 100; i++) {
			CounselingDTO counselingDTO = new CounselingDTO();
			
			counselingDTO.setSubject("더미용제목" + i);
			counselingDTO.setAddress("더미용주소" + i);
			counselingDTO.setBusinesschoice("더미용업무" + i);
			counselingDTO.setContent("더미용내용" + i);
			counselingDTO.setDetailaddress("더미용상세주소" + i);
			counselingDTO.setName("더미용이름" + i);
			counselingDTO.setPhonenumber("더미용폰번호" + i);
			counselingDTO.setPostcode("더미용우편번호" + i);
			counselingDTO.setReservation("더미용지정날짜" + i);
			
			counselingService.counselingInsert(counselingDTO);
		}
		return "./counseling/counseling_insert_view";
		
	}
	
	//메인 페이지
	@RequestMapping(value = "/Main", method = RequestMethod.GET)
	public String Main() {
		return "./counseling/main";
		
	}
	
}
