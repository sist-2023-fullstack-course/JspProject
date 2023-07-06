package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class BoardVO {
	//  
	private int no, hit, board_id, comment_index, comment_tab, comment_cnt;
	private String name, title, content, category;
	private Date regdate;
}




