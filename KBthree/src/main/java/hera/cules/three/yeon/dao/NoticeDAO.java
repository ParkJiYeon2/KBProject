package hera.cules.three.yeon.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hera.cules.three.soo.dto.Criteria;
import hera.cules.three.yeon.dto.NoticeDTO;


@Repository
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class NoticeDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
//페이징 DTO 포함된 전체 조회	
	public List<NoticeDTO> selectAll(Criteria criteria) {
		return sqlSessionTemplate.selectList("noticeselectAll",criteria);
	}

//공지 총개수
	public int ListCount(int num) {
		return sqlSessionTemplate.selectOne("noticeListCount");
	}
//	페이징
	public List<NoticeDTO> getList(NoticeDTO searchDTO) {
		return sqlSessionTemplate.selectList("getList" , searchDTO); 
	}
//공지 상세 조회	
	public NoticeDTO select(int num) {
		return sqlSessionTemplate.selectOne("noticeselect", num);
	}
//공지 등록
	@Transactional
	public void insert (NoticeDTO noticeDTO) {
		sqlSessionTemplate.insert("noticeinsert", noticeDTO);
	}
//max 함수 글번호 순차 자동 입력
	public int maxNum() {
		return sqlSessionTemplate.selectOne("noticemaxNum");
	}
//파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("noticeinsertFile", map);
	}
//파일 조회
	public List<Map<String, Object>> selectFileList (int num) throws Exception {
		return sqlSessionTemplate.selectList("noticeselectFileList", num);
	}
//첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("noticeselectFileInfo", map);
	}
//첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.update("noticeupdateFile", map);
	}
//공지 수정	
	public void update(NoticeDTO noticeDTO) {
		sqlSessionTemplate.update("noticeupdate", noticeDTO);
	}
// 공지 삭제	
	public void delete(int num) {
		sqlSessionTemplate.delete("noticedelete", num);
	}
}
