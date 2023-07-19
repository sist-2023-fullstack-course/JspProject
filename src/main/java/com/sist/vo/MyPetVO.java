package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 PET_ID
PET_CATEGORY
PET_NAME
PET_GENDER
PET_BIRTHYEAR
PET_WEIGHT
NEUTERED
USER_ID

 */
@Getter
@Setter

public class MyPetVO {
	private int pid,birthyear;
	private String category,name,gender,neutered,uid,weight;
}
