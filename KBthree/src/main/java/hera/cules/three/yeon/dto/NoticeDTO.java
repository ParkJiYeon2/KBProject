package hera.cules.three.yeon.dto;

import org.springframework.stereotype.Component;

import hera.cules.three.soo.dto.Criteria;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Component
@Getter
@Setter
@ToString
public class NoticeDTO extends Criteria {
	
	private int num;
	private String name;
	private String subject;
	private String content;
	private String writeday;

}
