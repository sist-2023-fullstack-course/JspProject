package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class MemberVO {
	private String id,pwd,name,gender,phone,email,nickname,birthday,post,addr1,addr2,admin,msg;
	private Date regdate;
}
