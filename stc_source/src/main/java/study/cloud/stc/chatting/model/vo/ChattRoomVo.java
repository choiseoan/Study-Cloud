package study.cloud.stc.chatting.model.vo;

import java.util.Date;

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
public class ChattRoomVo {
	private String chaRoomId;
	private String roomContents;
	private Date roomLastDate;
}
