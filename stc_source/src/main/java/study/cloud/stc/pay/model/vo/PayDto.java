package study.cloud.stc.pay.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Component
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PayDto {

	
	private Date RsvDate;			//예약날짜
	private int proNum;				//상품번호
	private String rsvNum;          //예약번호
	private int rsvAmount;			//총금액
	
	
	private String rsvTime;			//예약시간
	private Date payDate;			//결제시간
	
	
	private String proAddress;		//
	private String proPhone;
	
	
	
	
}
