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
public class ProductPicDto {
	// update delete
	private int proNum;
	// insert update delete select
	private String proPicOriginal;
	private String proPicRename;
	// update
	private String proPicOriginalOld;
	private String proPicRenameOld;
}
