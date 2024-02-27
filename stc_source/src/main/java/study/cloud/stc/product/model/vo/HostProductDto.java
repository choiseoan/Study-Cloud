package study.cloud.stc.product.model.vo;

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
public class HostProductDto {

	
	private String proName;
    private String proAddress;
    private String proPhone;
    private int proNum;
    private String memId;
    private String memAuthority;
    
//    private String proPicOriginal;
//	private String proPicRename;
	private List<ProductPicDto> picList;
}
