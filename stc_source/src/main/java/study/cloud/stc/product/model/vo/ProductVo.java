package study.cloud.stc.product.model.vo;

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
public class ProductVo {

//	----------- -------- ------------- 
//	PRO_NUM     NOT NULL NUMBER        
//	PRO_NAME    NOT NULL VARCHAR2(60)  
//	PRO_ADDRESS          VARCHAR2(100) 
//	PRO_PHONE            VARCHAR2(20)  
//	PRO_PRICE   NOT NULL NUMBER 
//  PRO_DATE         Date
	
	private int proNum;
	private String proName;
	private String proAddress;
	private String proPhone;
	private String proPrice;
	private String proDate;
}
