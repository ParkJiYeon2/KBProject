package hera.cules.three.yeon.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hera.cules.three.soo.dto.Criteria;
import hera.cules.three.yeon.dao.NoticeDAO;
import hera.cules.three.yeon.dto.NoticeDTO;
import hera.cules.three.yeon.file.NoticeFileUtils;

@Service
public class NoticeService {
@Autowired
private NoticeDAO noticeDAO;
@Resource(name="noticeFileUtils")
private NoticeFileUtils noticeFileUtils;

	//전체조회 + 페이징
	public List<NoticeDTO> noticeList(Criteria criteria) {
	return noticeDAO.selectAll(criteria);
	}
	
	//공지 개수
		public int listCount(int num) {
			return noticeDAO.ListCount(num);
		}

	//공지 상세 조회
	public NoticeDTO noticeSelect(int num) {
		return noticeDAO.select(num);
	}
	
	//공지 등록 - max 함수+파일 업로드
	public boolean noticeInsert (NoticeDTO noticeDTO, MultipartHttpServletRequest mpRequest) throws Exception {
		//max 함수를 이용해 글번호를 순차적으로 입력 시킨다.
		int num = noticeDAO.maxNum();
		if (num == 0) {
			num = 1;
		} else {
			num = num + 1;
		}
		noticeDTO.setNum(num);
		
		List<Map<String,Object>> list = noticeFileUtils.parseInsertFileInfo(noticeDTO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			noticeDAO.insertFile(list.get(i)); 
		}

		try {
			noticeDAO.insert(noticeDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace(); }
		return true;
	}
	//파일 업로드 조회
	public List<Map<String, Object>> selectFileList(int num) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.selectFileList(num);
	}
	//첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return noticeDAO.selectFileInfo(map);
	}
	//공지 수정
	public void noticeUpdate(NoticeDTO noticeDTO,String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		noticeDAO.update(noticeDTO);
		List<Map<String, Object>> list = noticeFileUtils.parseUpdateFileInfo(noticeDTO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				noticeDAO.insertFile(tempMap);
			}else {
				noticeDAO.updateFile(tempMap);
			}
		}
	}
	//공지 삭제
	public void noticeDelete(int num) {
		noticeDAO.delete(num);
	}
	
}
