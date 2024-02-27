package study.cloud.stc.qna.model.vo;

import java.sql.Date;
import java.util.List;

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
public class QnaVo {

//	PRO_NUM	NUMBER	No		1	상품번호
//	PRO_NAME	VARCHAR2(100 BYTE)	Yes		2	상품이름
//	MEM_ID	VARCHAR2(20 BYTE)	No		3	아이디
//	MEM_QUESTION	VARCHAR2(1000 BYTE)	Yes		4	사용자문의글
//	MEM_AUTHORITY	VARCHAR2(20 BYTE)	Yes		5	계정권한
//	HOST_ANSWER	VARCHAR2(1000 BYTE)	Yes		6	호스트답글
//	QNA_DATE	TIMESTAMP(6)	Yes		7	QNA작성시간
//  QNA_NUM NUMBER	No             8        QNA번호
	
	private int proNum;
	private String proName;
	private String memId;
	private String memQuestion;
	private String memAuthority;
	private String hostAnswer;
	private String qnaDate;
	private int qnaNum;
}
