package com.ncs.vo;

public class ReplyVO {

	private int rseq;
	private String rid;
	private String rcontent;
	private String regdate;
	private String rupdatedate;
	private int rexist;
	private int rlikecount;
	private int seq;
	private int liketype;
	
	public int getLiketype() {
		return liketype;
	}
	public void setLiketype(int liketype) {
		this.liketype = liketype;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getRupdatedate() {
		return rupdatedate;
	}
	public void setRupdatedate(String rupdatedate) {
		this.rupdatedate = rupdatedate;
	}
	public int getRexist() {
		return rexist;
	}
	public void setRexist(int rexist) {
		this.rexist = rexist;
	}
	public int getRlikecount() {
		return rlikecount;
	}
	public void setRlikecount(int rlikecount) {
		this.rlikecount = rlikecount;
	}
	@Override
	public String toString() {
		return "ReplyVO [rseq=" + rseq + ", rid=" + rid + ", rcontent=" + rcontent + ", regdate=" + regdate
				+ ", rupdatedate=" + rupdatedate + ", rexist=" + rexist + ", rlikecount=" + rlikecount + ", seq=" + seq
				+ ", liketype=" + liketype + "]";
	}
	
	
}
