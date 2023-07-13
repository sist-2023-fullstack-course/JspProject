package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class BoardVO {
	// 글번호, 조회수, 갖고올 순서, 댓글수
	// 제목 내용 작성자 작성일, 카테고리
	// BOARD_ID, TITLE, REGDATE, CONTENT, HIT, COMMENT_CNT, BOARD_CATEGORY, USER_ID
	// no, title , regdate, content, hit, depth, type, name
	private int board_id, hit, rownum, comment_cnt;
    private String title, content, user_id, dbday, board_category;
    //private Date regdate;
    
    
    
    
    
    
    
}




