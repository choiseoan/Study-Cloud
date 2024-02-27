package study.cloud.stc.reserve.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@ToString
@Getter
@Setter
public class ReserveTimeReqDto {
	private int rsvNum;
    private String rsvDate;
    private String rsvPerson;
    private int rsvAmount;
    private String rsvStatus;
    private String[] rsvTime;
    private String regDate;
    private String memId;
    private String proNum;
}


