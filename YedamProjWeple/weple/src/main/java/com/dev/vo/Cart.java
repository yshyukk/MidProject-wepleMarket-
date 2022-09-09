package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class Cart {
	int prodId;
	String prodName;
	int isShare;
	int buyAmount;
	int prodPrice;
	int totalPrice;
	String imgUrl;
	
	
	@Override
	public String toString() {
		return "Cart [prodId=" + prodId + ", prodName=" + prodName + ", isShare=" + isShare + ", buyAmount=" + buyAmount
				+ ", prodPrice=" + prodPrice + ", totalPrice=" + totalPrice + ", imgUrl=" + imgUrl + "]";
	}
}
