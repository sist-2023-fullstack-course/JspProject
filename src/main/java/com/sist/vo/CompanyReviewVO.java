package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

// 리뷰 정보
public class CompanyReviewVO {
	private int id;
	private double star;
	private String content, writer;
	private Date regdate;
}
