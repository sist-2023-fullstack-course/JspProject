package com.sist.vo;

import lombok.Getter;
import lombok.Setter;
import java.util.*;
@Getter
@Setter

// 예약 정보
public class ReserveVO {
	private String res_state,res_msg,res_img,user_id,poster, dbday, address, phone, com_name, pet_name,user_name;
	private int res_id,com_id,pet_id;
	private Date res_date;
	private boolean timeOver;
}
