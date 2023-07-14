package com.sist.vo;
/*
 	wno: 위시리스트 번호
 	cno: 업체 번호
 	cname, cposter: 업체이름,업체사진
 	ccategory:업체카테고리번호
 */
public class WishListVO {
	private int wno,cno;
	private String uid;
	private String cname,cposter;
	private int ccategory;
	
	
	public int getCcategory() {
		return ccategory;
	}
	public void setCcategory(int ccategory) {
		this.ccategory = ccategory;
	}
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCposter() {
		return cposter;
	}
	public void setCposter(String cposter) {
		this.cposter = cposter;
	}
	
}
