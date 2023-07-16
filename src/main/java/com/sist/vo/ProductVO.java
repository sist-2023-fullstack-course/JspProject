package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class ProductVO {
	private int id, star_sum, star_cnt, price, discount_price;
	private String name, info, delivery, category, poster;
}
