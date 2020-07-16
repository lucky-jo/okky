package com.ncs.vo;

import org.springframework.stereotype.Repository;

@Repository
public class AuthKeyDTO {
    private String email;
    private int authkey;
    private String regdate;
    
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAuthkey() {
		return authkey;
	}
	public void setAuthkey(int authkey) {
		this.authkey = authkey;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "AuthKeyDTO [email=" + email + ", authkey=" + authkey + ", regdate=" + regdate + "]";
	}
    
 
}