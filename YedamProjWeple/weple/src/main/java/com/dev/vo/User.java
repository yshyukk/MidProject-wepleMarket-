package com.dev.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class User {
	private String userId;
	private String email1;
	private String email2;
	private String userPwd;
	private String phone1;
	private String phone2;
	private String phone3;
	private String userName;
	private String gender;
	private Date birth;
	private int grade;
	private String addr;
	private String addr2;
	private String addrDetail;
	private int zipCode;
	private String regDate;
	private int userRole;
	private String email;
	private String phone;
}
