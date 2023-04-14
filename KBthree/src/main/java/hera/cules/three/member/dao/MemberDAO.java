package hera.cules.three.member.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hera.cules.three.member.dto.MemberDTO;
import hera.cules.three.soo.dto.Criteria;


//빈(Bean)으로 데이터베이스 스캔을 구성한다.
@Repository
//메소드를 호출할 때 자동으로 인터셉트한다.
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class MemberDAO {
@Autowired
SqlSessionTemplate sqlSessionTemplate;
@Autowired
HttpSession httpSession;
//회원 전체조회
public List<MemberDTO> selectAll(Criteria criteria) {
return sqlSessionTemplate.selectList("memberselectAll", criteria);
}
//회원 상세조회
public MemberDTO select(String id) {
return sqlSessionTemplate.selectOne("memberselect", id);
}
//회원 중복가입 아이디 비밀번호 체크
public MemberDTO logincheck(MemberDTO memberDTO, HttpServletRequest request) {
 return sqlSessionTemplate.selectOne("memberlogincheck", memberDTO);
}
//회원 데이터 갯수 구하기
public int count() {
	return sqlSessionTemplate.selectOne("membercount");
}
//회원 데이터 목록 페이징 처리
public List<MemberDTO> listpage(Criteria criteria){
	return sqlSessionTemplate.selectList("memberlistpage", criteria);
}
//회원 넘버 번호로 데이터 갯수 구하기
public int listcount() {
	return sqlSessionTemplate.selectOne("memberlistcount");
}
//아이디 찾기
public MemberDTO idsearch(MemberDTO memberDTO) {
	return sqlSessionTemplate.selectOne("memberidsearch", memberDTO);
}
//비밀번호 찾기
public MemberDTO passwordsearch(MemberDTO memberDTO) {
	return sqlSessionTemplate.selectOne("memberpasswordsearch", memberDTO);
}
//트랜잭션을 설정한다.
@Transactional
//회원 가입
public void insert(MemberDTO memberDTO) {
sqlSessionTemplate.insert("memberinsert", memberDTO);
}
//회원 정보 수정
public void update(MemberDTO memberDTO) {
sqlSessionTemplate.update("memberupdate", memberDTO);
}
//회원 탈퇴
public void delete(String id) {
sqlSessionTemplate.delete("memberdelete", id);
}
//비밀번호 수정
public void passupdate(MemberDTO memberDTO) {
sqlSessionTemplate.update("memberpassupdate", memberDTO);
}
}