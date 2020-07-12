package com.ncs.vo;

public class JoinDTO {
	// 게시글 정보
	private int seq ;
	private String title ;
	private String id ;
	private String regdate ;
	private int likecount;
	private int exist ;
	private int cnt;
	private String category;
	private int replycount;
	private String board;
	// 글쓴이 회원 정보
	private String userid;
	private String username;
    private String nickname;
    private String image;
    private int apoint;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getApoint() {
		return apoint;
	}
	public void setApoint(int apoint) {
		this.apoint = apoint;
	}

    
	@Override
	public String toString() {
		return "JoinDTO [seq=" + seq + ", title=" + title + ", id=" + id + ", regdate=" + regdate + ", likecount="
				+ likecount + ", exist=" + exist + ", cnt=" + cnt + ", category=" + category + ", replycount="
				+ replycount + ", board=" + board + ", userid=" + userid + ", username=" + username + ", nickname="
				+ nickname + ", image=" + image + ", apoint=" + apoint + "]";
	}
    

}
