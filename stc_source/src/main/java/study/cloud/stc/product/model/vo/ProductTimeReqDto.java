package study.cloud.stc.product.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@ToString
@Getter
@Setter
public class ProductTimeReqDto {
	private String proNum;
	private String proDate;
	private List<ProductTimePriceDto> values;
	

}
