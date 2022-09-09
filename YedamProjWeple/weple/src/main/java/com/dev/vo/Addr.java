package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Addr {
	
	private String userId;
	private String addr;
	private String addr2;
	private String addrDetail;
	private int zipCode;
	private int isDefault;
	private String addrName;
	
	@Override
	public String toString() {
		return "Addr [userId=" + userId + ", addr=" + addr + ", addr2=" + addr2 + ", addrDetail=" + addrDetail
				+ ", zipCode=" + zipCode + ", isDefault=" + isDefault + ", addrName=" + addrName + "]";
	}
}
