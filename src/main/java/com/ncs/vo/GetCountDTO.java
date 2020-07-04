package com.ncs.vo;

public class GetCountDTO {
	private String id;
	private String board;
	private String today;
	private int seq;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	@Override
	public String toString() {
		return "GetCountDTO [id=" + id + ", board=" + board + ", today=" + today + ", seq=" + seq + "]";
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	
}
