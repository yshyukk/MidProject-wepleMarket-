package com.dev.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProdReview {
	private String boardContent;
	private String writer;
	private String writeDate;
	private int bno;
	private int prodId;
	private int cnt;
	private String imgUrl;
	private String prodName;
	private int prodPrice;
}
