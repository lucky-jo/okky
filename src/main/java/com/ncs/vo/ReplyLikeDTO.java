package com.ncs.vo;

public class ReplyLikeDTO {
	
	private String likerid;
	private String board;
	private int rseq;
	private int liketype;
	private String parentBoard;
	private int parentSeq;

	public String getLikerid() {
		return likerid;
	}

	public void setLikerid(String likerid) {
		this.likerid = likerid;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	@Override
	public String toString() {
		return "ReplyLikeDTO{" +
				"likerid='" + likerid + '\'' +
				", board='" + board + '\'' +
				", rseq=" + rseq +
				", liketype=" + liketype +
				", parentBoard='" + parentBoard + '\'' +
				", parentSeq=" + parentSeq +
				'}';
	}

	public int getRseq() {
		return rseq;
	}

	public void setRseq(int rseq) {
		this.rseq = rseq;
	}

	public int getLiketype() {
		return liketype;
	}

	public void setLiketype(int liketype) {
		this.liketype = liketype;
	}

	public String getParentBoard() {
		return parentBoard;
	}

	public void setParentBoard(String parentBoard) {
		this.parentBoard = parentBoard;
	}

	public int getParentSeq() {
		return parentSeq;
	}

	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}
}
