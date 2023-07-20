package com.sist.vo;
/*
	PRODUCT_ID NOT NULL NUMBER        
	USER_ID    NOT NULL VARCHAR2(100) 
	REGDATE    NOT NULL DATE          
	CART_NO    NOT NULL NUMBER        
	AMOUNT     NOT NULL NUMBER        
	ISSALE              NUMBER
 */

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CartVO {
	private int cart_no, product_id, issale, amount, product_price;
	private String user_id,product_name, product_poster, regdate;
	
	
	
	
}
