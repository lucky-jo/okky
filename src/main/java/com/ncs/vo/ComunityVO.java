package com.ncs.vo;

import org.springframework.stereotype.Repository;

@Repository
public class ComunityVO {

	private int seq ;
	private String title ;
	private String id ;
	private String content ;
	private String regdate ;
	private String updatedate ;
	private int exist ;
	private int cnt;
	private int likecount;
	private String category;
	private int replycount;
	private String board;

	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public String getUpdatedate() {
		return updatedate;
	}


	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}


	public int getExist() {
		return exist;
	}


	public void setExist(int exist) {
		this.exist = exist;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	@Override
	public String toString() {
		return "ComunityVO [seq=" + seq + ", title=" + title + ", id=" + id + ", content=" + content + ", regdate="
				+ regdate + ", updatedate=" + updatedate + ", exist=" + exist + ", cnt=" + cnt + ", category="
				+ category + "]";
	}



}
