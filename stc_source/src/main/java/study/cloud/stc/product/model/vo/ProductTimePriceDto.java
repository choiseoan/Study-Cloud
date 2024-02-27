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
public class ProductTimePriceDto {
	private String time;
	private String price;
	private String rsvNum;
}
