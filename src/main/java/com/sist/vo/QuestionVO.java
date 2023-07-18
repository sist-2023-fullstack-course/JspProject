package com.sist.vo;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class QuestionVO {
	private int no,hit,group_id,group_step,group_tab,isreply;
	private String id,name,subject,content,pwd,dbday;
	private Date regdate;
}
