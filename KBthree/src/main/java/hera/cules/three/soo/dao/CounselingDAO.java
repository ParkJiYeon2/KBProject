package hera.cules.three.soo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hera.cules.three.soo.dto.CounselingDTO;
import hera.cules.three.soo.dto.Criteria;

@Repository
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class CounselingDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	//전체 조회
	public List<CounselingDTO> selectAll(Criteria criteria) {
		return sqlSessionTemplate.selectList("selectAll", criteria);
	}
	//개별 조회
	public CounselingDTO select(int num) {
		return sqlSessionTemplate.selectOne("select", num);
	}
	@Transactional
	//상담 생성하기
	public void insert(CounselingDTO counselingDTO) {
		sqlSessionTemplate.insert("insert", counselingDTO);
	}
	//상담 수정하기
	public void update(CounselingDTO counselingDTO) {
		sqlSessionTemplate.update("update", counselingDTO);
	}
	//상담 삭제하기
	public void delete(int num) {
		sqlSessionTemplate.delete("delete", num);
	}
	//게시글 총 갯수 구하기
	public int countSoo() {
		return sqlSessionTemplate.selectOne("hera.cules.three.soo.dto.countsoo");
	}
	//조회수 구하기
	public void hit(int num) {
		sqlSessionTemplate.update("hit", num);
		
	}
	}
