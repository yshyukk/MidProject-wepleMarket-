package com.dev.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewInfo implements Serializable{
	
	private int bno;
	private int prodId;
	private String prodName;
	private String boardContent;
	private String writer;
	private String writeDate;
	private int cnt;
	private int rating;
	private String imgUrl;
}
