package com.board.dto;

import java.util.Date;
import lombok.Data;

@Data
// getter, setter, 생성자, toString() 자동생성
public class BoardDTO {

	private int no;
	private String title, content, writer;
	private Date writeDate;
	private int hit;
	private String pw;
	
}
