package hera.cules.three.member.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString
public class MemberDTO {
	
	//유저 아이디
	private String id;
	//유저 이름
	private String name;
	//유저 비밀번호
	private String pass;
	//주소
	private String address;
	//우편번호
	private String postcode;
	//상세 주소
	private String detailAddress;
	//생일
	private String birthday;
	//이메일
	private String email;
	//골뱅이
	private String at;
	//이메일 주소
	private String domain;
	//010 018과 같은 휴대폰 앞번호
	private String telecom;
	//휴대폰 중간번호
	private String phonenum;
	//휴대폰 맨끝번호
	private String phonenum2;
	//계좌번호
	private String accountnum;
	//계좌 비밀번호
	private String accountpass;
	//직장명
	private String compname;
	//부서명
	private String deptname;
	//직장 전화번호
	private String compphone;
	//직장 주소
	private String compaddress;
	//주소 수신 동의
	private String reqpost;
	//이메일 수신 동의
	private String reqemail;
	//sms 수신 동의
	private String reqsms;
	//직업
	private String job;
	//관심 분야
	private String interest;
	//회원 번호 시퀀스 생성
	private int num;
}
