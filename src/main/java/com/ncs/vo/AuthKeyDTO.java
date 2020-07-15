package com.ncs.vo;

import org.springframework.stereotype.Repository;

@Repository
public class AuthKeyDTO {
    private String email;
    private String authkey;
    @Override
	public String toString() {
		return "AuthKeyDTO [email=" + email + ", authkey=" + authkey + ", regdate=" + regdate + "]";
	}

	private String regdate;

    public AuthKeyDTO() {

    }

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}