package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class ProductVO {
	private int id, price, discount_price, discount_rate;
	private double star;
	private String name, info, delivery, category, poster;
}
