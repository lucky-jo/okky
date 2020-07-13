package com.ncs.vo;

import org.springframework.stereotype.Repository;

@Repository
public class AuthKeyDTO {
    private String userid;
    private String authkey;

    public AuthKeyDTO() {

    }

    public String getAuthkey() {
        return authkey;
    }

    public void setAuthkey(String authkey) {
        this.authkey = authkey;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }


    public AuthKeyDTO(String userid, String authkey ){
        this.userid = userid;
        this.authkey = authkey;
    }
}
