package hera.cules.three.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import hera.cules.three.member.dao.MemberDAO;
import hera.cules.three.member.dto.MemberDTO;
import hera.cules.three.soo.dto.Criteria;

// 빈(Bean)으로 비즈니스 로직 스캔을 구성한다.
@Service
public class MemberService {
// 의존관계를 자동으로 설정한다.
@Autowired
private MemberDAO memberDAO;
public List<MemberDTO> memberSelectAll(Criteria criteria) {
return memberDAO.selectAll(criteria);
}
public MemberDTO memberSelect(String id) {
return memberDAO.select(id);
}
public void memberInsert(MemberDTO memberDTO) {
try {
memberDAO.insert(memberDTO); 
// 데이터의 무결성 제약조건(Column unique) 제약조건에 대한 예외를 처리한다.
} catch(DataIntegrityViolationException e) { 
e.printStackTrace( );
}
}
public void memberUpdate(MemberDTO memberDTO) {
memberDAO.update(memberDTO);
}
public void memberDelete(String id) {
memberDAO.delete(id);
}
public void passupdate(MemberDTO memberDTO) {
memberDAO.passupdate(memberDTO);
}
public MemberDTO logincheck(MemberDTO memberDTO, HttpServletRequest request) {
return memberDAO.logincheck(memberDTO, request);
}
public int count() {
	return memberDAO.count();
}
public List<MemberDTO> listpage(Criteria criteria){
	return memberDAO.listpage(criteria);
}
public int listcount() {
	return memberDAO.listcount();
}
public MemberDTO idsearch(MemberDTO memberDTO) {
	return memberDAO.idsearch(memberDTO);
}
public MemberDTO passwordsearch(MemberDTO memberDTO) {
	return memberDAO.passwordsearch(memberDTO);
}
}