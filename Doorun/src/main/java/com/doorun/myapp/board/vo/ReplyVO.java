package com.doorun.myapp.board.vo;

import java.sql.Date;

public class ReplyVO {
	private int id;
	private int board_id;
	private String writer;
	private String content;
	private int parent_reply;
	private Date reg_date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getParent_reply() {
		return parent_reply;
	}
	public void setParent_reply(int parent_reply) {
		this.parent_reply = parent_reply;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
