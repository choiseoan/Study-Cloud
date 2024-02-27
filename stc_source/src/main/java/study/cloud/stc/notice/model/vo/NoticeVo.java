package study.cloud.stc.notice.model.vo;

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
public class NoticeVo {
 
//	NOTI_NUM          NOT NULL NUMBER         
//	MEM_ID            NOT NULL VARCHAR2(20)   
//	NOTI_IDX                   VARCHAR2(15)   
//	NOTI_TITLE                 VARCHAR2(100)   
//	NOTI_CONTENTS              VARCHAR2(4000) 
//	NOTI_DATE                  DATE           
//	ORIGINAL_FILENAME          VARCHAR2(100)  
//	RENAME_FILENAME            VARCHAR2(100)
	
	private int notiNum;
	private String memId;
	private String notiIdx;
	private String notiTitle;
	private String notiContents;
	private Date notiDate;
	private String originalFilename;
	private String renameFilename;
	
}
