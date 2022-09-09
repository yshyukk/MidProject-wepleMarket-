package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Comments {
	int bno;
	int repleNum;
	String userId;
	String reple;
	String writeDate;
	
	
	@Override
	public String toString() {
		return "comments [bno=" + bno + ", userId=" + userId + ", reple=" + reple + ", writeDate=" + writeDate + "]";
	}
}


