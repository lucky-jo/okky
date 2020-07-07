package com.ncs.vo;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class MemberVO {
    private String userid;
    private String userpw;
    private Boolean enabled;
    private String email;
    private String username;
    private String nickname;
    private String joindate;
    private String outdate;
    private String image;
    private int apoint;
    private int wpoint;
    private int follow;
    private int following;
    private Boolean allowed;

    @Override
    public String toString() {
        return "MemberVO{" +
                "userid='" + userid + '\'' +
                ", userpw='" + userpw + '\'' +
                ", enabled=" + enabled +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", nickname='" + nickname + '\'' +
                ", joindate='" + joindate + '\'' +
                ", outdate='" + outdate + '\'' +
                ", image='" + image + '\'' +
                ", apoint=" + apoint +
                ", wpoint=" + wpoint +
                ", follow=" + follow +
                ", following=" + following +
                ", allowed=" + allowed +
                ", authList=" + authList +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUserpw() {
        return userpw;
    }

    public void setUserpw(String userpw) {
        this.userpw = userpw;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getJoindate() {
        return joindate;
    }

    public void setJoindate(String joindate) {
        this.joindate = joindate;
    }

    public String getOutdate() {
        return outdate;
    }

    public void setOutdate(String outdate) {
        this.outdate = outdate;
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

    public int getWpoint() {
        return wpoint;
    }

    public void setWpoint(int wpoint) {
        this.wpoint = wpoint;
    }

    public int getFollow() {
        return follow;
    }

    public void setFollow(int follow) {
        this.follow = follow;
    }

    public int getFollowing() {
        return following;
    }

    public void setFollowing(int following) {
        this.following = following;
    }

    public Boolean getAllowed() {
        return allowed;
    }

    public void setAllowed(Boolean allowed) {
        this.allowed = allowed;
    }

    public List<AuthVO> getAuthList() {
        return authList;
    }

    public void setAuthList(List<AuthVO> authList) {
        this.authList = authList;
    }

    private List<AuthVO> authList;

}
