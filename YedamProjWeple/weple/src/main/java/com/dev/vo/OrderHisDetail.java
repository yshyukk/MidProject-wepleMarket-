package com.dev.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderHisDetail {
	String prodName;
	int buyAmount;
	int isShare;
	int totalPrice;
	int prodPrice;
	int isCompleted;
	String imgUrl;
	int prodId;
	int orderNum;
	int isReview;
	int isDelivery;

}

