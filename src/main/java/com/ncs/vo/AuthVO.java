package com.ncs.vo;

public class AuthVO {
    private String userid;
    private String authkey;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getAuth() {
        return authkey;
    }

    public void setAuth(String authkey) {
        this.authkey = authkey;
    }

    @Override
    public String toString() {
        return "AuthVO{" +
                "userid='" + userid + '\'' +
                ", auth='" + authkey + '\'' +
                '}';
    }
}
