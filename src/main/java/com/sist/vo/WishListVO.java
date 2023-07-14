package com.sist.vo;
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
public class WishListVO {
	private int com_id,wish_no,com_category_id;
	private String com_name,poster,user_id;
	public int getCom_id() {
		return com_id;
	}
	public void setCom_id(int com_id) {
		this.com_id = com_id;
	}
	public int getWish_no() {
		return wish_no;
	}
	public void setWish_no(int wish_no) {
		this.wish_no = wish_no;
	}
	public int getCom_category_id() {
		return com_category_id;
	}
	public void setCom_category_id(int com_category_id) {
		this.com_category_id = com_category_id;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
}
