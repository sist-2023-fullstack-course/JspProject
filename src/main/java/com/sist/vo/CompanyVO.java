package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

// 기업 정보
public class CompanyVO{
	private int id;
	private String com_name, address, time, content, com_star, map_info, local_name, category;
}