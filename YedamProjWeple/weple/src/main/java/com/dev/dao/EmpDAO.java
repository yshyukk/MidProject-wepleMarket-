package com.dev.dao;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmpDAO {
	private String empId;
	private String empPwd;
	private int rwu;
	private String accessAutho;
	private int empRole;
}
