package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class BoardVO {
	// 글번호, 조회수, 갖고올 순서, 댓글수
	// 제목 내용 작성자 작성일, 카테고리
	private int no, hit, rownum, depth;
    private String title, content, name, dbday, type;
    private Date regdate;
    
    
    
    
    
    
    
}




