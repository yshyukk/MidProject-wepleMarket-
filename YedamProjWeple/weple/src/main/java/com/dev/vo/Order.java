package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Order {
	private String userId;
	private int orderNum;
	private int orderPrice;
	private String orderInfo;
	private String orderDate;
	
	@Override
	public String toString() {
		return "Order [userId=" + userId + ", orderNum=" + orderNum + ", orderPrice=" + orderPrice + ", orderInfo="
				+ orderInfo + ", orderDate=" + orderDate + "]";
	}
}

