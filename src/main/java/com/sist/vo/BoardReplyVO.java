package com.sist.vo;

import java.util.Date;
import lombok.*;
 
@Getter
@Setter


public class BoardReplyVO {
	// 커뮤니티 게시글에 답글 - 변수 용도 추후 확인
	
	// 댓글번호, 게시글번호, 댓글 그룹아이디(부모 댓글만 부여), 댓글의 작성순서(댓글 그룹네 번호), 대댓구분 , 부모 댓글 번호, 댓글 수
	// 댓글 작성자, 
	private int rep_id, board_id, group_id, group_step, group_tab, root, depth;
	private String user_id, rep_content, dbday;
	

}
