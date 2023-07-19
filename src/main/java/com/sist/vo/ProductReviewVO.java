package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class ProductReviewVO {
	private int id, pid;
	private String content, user_id, regdate, user_name;
}
