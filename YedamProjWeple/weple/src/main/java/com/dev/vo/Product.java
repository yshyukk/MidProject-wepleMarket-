package com.dev.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Product implements Serializable {
	private int prodId;
	private String imgUrl;
	private String prodName;
	private int prodPrice;
	private int weight;
	private String content;
	private String origin;
	private int isShare;
	private int sharePeople;
	private int catgLevel3;
	private int participatePeople;
	private int catgLevel1;
	private int catgLevel2;
	private int myjjim;
	private int totaljjim;
	private double ratio;
	private int star;
	private double avgStar;
}
