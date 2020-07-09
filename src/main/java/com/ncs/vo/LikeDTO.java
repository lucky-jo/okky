package com.ncs.vo;

public class LikeDTO {
	
	private String likeid;
	private String board;
	private int seq;
	private int liketype;
	private String writer;
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getLiketype() {
		return liketype;
	}
	public void setLiketype(int liketype) {
		this.liketype = liketype;
	}

	public String getLikeid() {
		return likeid;
	}
	public void setLikeid(String likeid) {
		this.likeid = likeid;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	@Override
	public String toString() {
		return "LikeDTO [likeid=" + likeid + ", board=" + board + ", seq=" + seq + ", liketype=" + liketype
				+ ", writer=" + writer + "]";
	}
	
	

}
