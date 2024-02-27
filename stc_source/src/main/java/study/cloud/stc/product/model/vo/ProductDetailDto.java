package study.cloud.stc.product.model.vo;

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
public class ProductDetailDto {

	private int proNum;
	private String proName;
	private String proAddress;
	private String proPhone;
	
	private String memId;
	private String proPost;
	private String proInfo;
	private String proNotice;
	private String proRefund;
	private String proZipcode;
	
	private String proPicOriginal;
	private String proPicRename;
	private String proPicOriginalOld;
	private String proPicRenameOld;
	
	private List<ProductPicDto> picList;
	
	private List<ProductTimePriceDto> timePriceList;
	
//	private Date proDate;
//	private int proPrice;
//	private String rsvNum;

}