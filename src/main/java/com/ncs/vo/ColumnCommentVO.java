package com.ncs.vo;

public class ColumnCommentVO {

	private int comment_seq;
	private int comment_board;
	private String comment_id;
	private int comment_point;
	private String comment_content;
	private String comment_regdate;
	private int comment_like;
	public int getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}
	public int getComment_board() {
		return comment_board;
	}
	public void setComment_board(int comment_board) {
		this.comment_board = comment_board;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public int getComment_point() {
		return comment_point;
	}
	public void setComment_point(int comment_point) {
		this.comment_point = comment_point;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(String comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public int getComment_like() {
		return comment_like;
	}
	public void setComment_like(int comment_like) {
		this.comment_like = comment_like;
	}
	@Override
	public String toString() {
		return "ColumnCommentVO [comment_seq=" + comment_seq + ", comment_board=" + comment_board + ", comment_id="
				+ comment_id + ", comment_point=" + comment_point + ", comment_content=" + comment_content
				+ ", comment_regdate=" + comment_regdate + ", comment_like=" + comment_like + "]";
	}
}
