package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

// 리뷰 정보
public class CompanyReviewVO {
	private int id, cid;
	private double star;
	private String content, user_id, dbday, user_name;
	private Date regdate;
}
