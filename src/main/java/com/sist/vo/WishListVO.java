package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 	wno: 위시리스트 번호 wish_no
 	cno: 업체 번호
 	uid: user_id
 	cname, cposter: 업체이름,업체사진
 	ccategory:업체카테고리번호
 	
   --wishcompany--	
   com_id
   user_id
   wish_no
   
   --member--
   user_id
   
  --company--
  com_id
  com_category_id
  com_name
  poster
   

 */
@Getter
@Setter

public class WishListVO {
	private int com_id,com_category_id;
	private String com_name,poster,user_id;
}
