package hera.cules.three.soo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import hera.cules.three.soo.dao.CounselingDAO;
import hera.cules.three.soo.dto.CounselingDTO;
import hera.cules.three.soo.dto.Criteria;

@Service
public class CounselingService {
	@Autowired
	private CounselingDAO counselingDAO;
	//전체 조회
	public List<CounselingDTO> counselingSelectAll(Criteria criteria) {
		return counselingDAO.selectAll(criteria);
	}
	//개별 조회
	public CounselingDTO counselingSelect(int num) {
		counselingDAO.hit(num);
		return counselingDAO.select(num);
	}
	//상담 만들기
	public void counselingInsert(CounselingDTO counselingDTO) {
		try {
			counselingDAO.insert(counselingDTO);
			
			//데이터 무결성 검사 예외처리
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	//상담 수정하기
	public void counselingUpdate(CounselingDTO counselingDTO) {
		counselingDAO.update(counselingDTO);
	}
	//상담 삭제하기
	public void counselingDelete(int num) {
		counselingDAO.delete(num);
	}
	//게시글 총 갯수 구하기
	public int counselingCount() {
		return counselingDAO.countSoo();
	}
}
