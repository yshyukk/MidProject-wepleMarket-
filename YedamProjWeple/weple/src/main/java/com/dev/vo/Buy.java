package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Buy {
	private String userId;
	private int prodId;
	private int buyAmount;
	private int isShare;
	private int isCart;
	private int isBuy;
	private int isDelivery;
	private int isCompleted;
	private int orderNum;
}
