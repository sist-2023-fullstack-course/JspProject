package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

// 기업 정보
public class CompanyVO{
	private int id;
	private double star, map_x, map_y;
	private String com_name, address, time, content, map_info, local_name, category, poster, phone, homepage;
}