package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Inventory {
	private String region;
	private int prodId;
	private int inOut;
	private int amount;
	private int stock;
	private String invtDate;
}
