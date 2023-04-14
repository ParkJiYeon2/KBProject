package hera.cules.three.yeon.controller;


import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hera.cules.three.soo.dto.Criteria;
import hera.cules.three.soo.dto.PageMaker;
import hera.cules.three.yeon.dto.NoticeDTO;
import hera.cules.three.yeon.service.NoticeService;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	@Autowired
	private NoticeService noticeService;
//	private Criteria cri;

	
//	공지 전체조회
	@RequestMapping(value = "/NoticeSelect", method = RequestMethod.GET)
	public String list( Model model,NoticeDTO noticeDTO, Criteria criteria) throws Exception {
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(criteria);
		    pageMaker.setTotalCount(noticeService.listCount(0));
		    
		    model.addAttribute("listcount", noticeService.listCount(0));
		    model.addAttribute("list", noticeService.noticeList(criteria));
		    model.addAttribute("pageMaker", pageMaker);
		    List<Map<String, Object>> fileList = noticeService.selectFileList(noticeDTO.getNum());
			model.addAttribute("file", fileList);
			logger.info("list", model);
			logger.info("file", model);

		return "./notice/notice_select_all_view";
	}

//	공지 상세조회
	@RequestMapping(value = "/NoticeSelectDetail", method = RequestMethod.GET)
	public String detail(Model model, NoticeDTO noticeDTO) throws Exception {
		model.addAttribute("noticeDTO", noticeService.noticeSelect(noticeDTO.getNum()));
	    List<Map<String, Object>> fileList = noticeService.selectFileList(noticeDTO.getNum());
		model.addAttribute("file", fileList);
		return "./notice/notice_select_detail_view";
	}

//	공지 등록 폼
	@RequestMapping(value = "/NoticeInsert", method = RequestMethod.GET)
	public String insert() {
		return "./notice/notice_insert_view";
	}

// 공지 등록
	@RequestMapping(value = "/NoticeInsert", method = RequestMethod.POST)
	public String insert(Model model, NoticeDTO noticeDTO, MultipartHttpServletRequest mpRequest) throws Exception {
		
		model.addAttribute("list", noticeService.noticeList(noticeDTO));
		noticeService.noticeInsert(noticeDTO, mpRequest);
		return "./notice/notice_insert";
	}
//공지 수정 폼
	@RequestMapping(value = "/NoticeUpdate", method = RequestMethod.GET)
	public String update(NoticeDTO noticeDTO, Model model) throws Exception {
		
		model.addAttribute("update", noticeService.noticeSelect(noticeDTO.getNum()));
		
		List<Map<String, Object>> fileList = noticeService.selectFileList(noticeDTO.getNum());
		model.addAttribute("file", fileList);
		return "./notice/notice_update_view";
	}
//공지 수정	
	@RequestMapping(value = "/NoticeUpdate", method = RequestMethod.POST)
	public String update(NoticeDTO noticeDTO,
			 @RequestParam(value="fileNoDel[]") String[] files,
			 @RequestParam(value="fileNameDel[]") String[] fileNames,
			 MultipartHttpServletRequest mpRequest) throws Exception {
		noticeService.noticeUpdate(noticeDTO, files, fileNames, mpRequest);
		
		return "./notice/notice_update";
	}

	
//	공지 삭제
	@RequestMapping(value = "/NoticeDelete", method = RequestMethod.GET)
	public String delete(NoticeDTO noticeDTO) {
		noticeService.noticeDelete(noticeDTO.getNum());
		return "./notice/notice_delete_view";
		
	}

//	 첨부파일 다운로드
	 @RequestMapping(value="/NoticeFileDown")
		public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
			Map<String, Object> resultMap = noticeService.selectFileInfo(map);
			String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
			String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
			
			// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환
			byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\KB_Notice\\file\\"+storedFileName));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
		}

}
