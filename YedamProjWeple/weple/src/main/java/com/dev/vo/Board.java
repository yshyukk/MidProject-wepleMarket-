package com.dev.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {
	private int boardType;
	private String title;
	private String boardContent;
	private String writer;
	private String writeDate;
	private int bno;
	private int prodId;
	private int isHandled;
	private String repsComment;
	private int CNT;
	private String imgUrl;
	private String repsContent;
	private int orderNum;
	
}
