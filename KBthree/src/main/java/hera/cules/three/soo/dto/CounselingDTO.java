package hera.cules.three.soo.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//lombok 라이브러리 어노테이션
@Component
@Setter
@Getter
@ToString
public class CounselingDTO {
	
	//게시글 번호 Max 함수 쿼리문 사용
	private int num;
	//유저 이름
	private String name;
	//주소
	private String address;
	//우편번호
	private String postcode;
	//상세 주소
	private String detailaddress;
	//제목
	private String subject;
	//내용
	private String content;
	//업무 선택
	private String businesschoice;
	//휴대 번호
	private String phonenumber;
	//예약 지정 날짜
	private String reservation;
	//현재 날짜 자동생성
	private String writeday;
	//유저 아이디
	private String id;
	//로우넘버
	private int rnum;
	//조회수
	private int hit;
	

}
